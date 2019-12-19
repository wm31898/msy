<?php
namespace app\hss\controller;

use think\db\exception\BindParamException;

class Comment extends \common\controller\BaseApi{
    /**
     *  分页查询
     */
    public function getGoodsCommentList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\CommentGoods();
        $goodsId = input('get.goods_id/d');
        if(!$goodsId){
            return buildFailed(config('custom.parameter_error'));
        }
        $config=[
            'where'=>[
                ['cg.status','=',0],
                ['cg.goods_id','=',$goodsId],
            ],
            'field'=>[
                'cg.id','u.name','u.mobile_phone','u.avatar','cg.score','cg.img','cg.video','cg.title','cg.content','cg.create_time','cg.update_time',
            ],
            'join'=>[
                ['common.user u','u.id = cg.user_id','left']
            ],
            'order'=>[
                'cg.id'=>'desc'
            ],
        ];
        $list = $model -> pageQuery($config);
        $list->each(function($item, $key){
            $item['img'] =  explode(',',(string) $item['img']);

        });
        $page = (int)input('get.page');
        if($page == 1 || !$page){
            $where = [
                ['status','=',0],
                ['goods_id','=',$goodsId],
            ];
            $averageScore = $model -> where($where)->avg('score');

            $total = $model -> where($where)->count('user_id');
            $list['average_score'] = $averageScore;
            $list['total_user'] = $total;
        }

        return buildSuccess($list);
    }

    public function edit(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        //判断是否登录
        $rst = isLogin();
        if($rst['code'] == 1){
            $user = $rst['user'];
        }else{
            return buildFailed($rst['msg']);
        }
        $data = input('post.');
        $data = $data['data'];
        $uid = $user['id'];
        $dataOrder=[
            'user_id' =>$uid,
            'order_id' =>$data['order_id'],
            'service_score' =>$data['service_score'],
            'logistics_score' =>$data['service_score'],
        ];

        //开启事务
        $modelCommentOrder = new \app\hss\model\CommentOrder();
        $modelCommentOrder->startTrans();
//        $result = $modelCommentOrder -> save($dataOrder);
        if(isset($data['id']) && $data['id']){
            $where = [
                "id"=>$data['id'],
                "user_id"=>$uid
            ];
//            $dataOrder['id'] = $data['id'];
            $dataOrder['update_time'] = time();
            $result = $modelCommentOrder -> save($dataOrder,$where);
        }else{
            $dataOrder['create_time'] = time();
            $result = $modelCommentOrder -> save($dataOrder);
        }
        if(false === $result){
            $modelCommentOrder ->rollback();
            return buildFailed();
        }
        $dataGoods = $data['goods_comment'];
        foreach ($dataGoods as $k=>&$v){
            if(isset($v['id']) && $v['id']){
                $dataGoods[$k]['update_time'] = time();
            }else{
                $dataGoods[$k]['create_time'] = time();
            }
            $dataGoods[$k]['user_id'] = $uid;
            if( isset($v['img']) && is_array($v['img']) && !empty($v['img']) ){
//            $imglArr = explode(',',$data['img']);
                $tempArr = array();
                foreach ($v['img'] as $item) {
                    if($item){
                        $result = moveImgFromTempApi(config('upload_dir.comment'),$item);
                        if(isset($result['status']) && $result['status'] == 0){
                            return buildFailed($result['info']);
                        }
                        $tempArr[] = $result;
                    }
                }
                $dataGoods[$k]['img'] = implode(',',$tempArr);
            }
            if( isset($v['video']) && is_array($v['video']) && !empty($v['video']) ){
//            $imglArr = explode(',',$data['img']);
                $tempArr = array();
                foreach ($v['video'] as $item) {
                    if($item){
                        $result = moveImgFromTempApi(config('upload_dir.comment'),$item);
                        if(isset($result['status']) && $result['status'] == 0){
                            return buildFailed($result['info']);
                        }
                        $tempArr[] = $result;
                    }
                }
                $dataGoods[$k]['video'] = implode(',',$tempArr);
            }
        }
        $modelCommentGoods = new \app\hss\model\CommentGoods();
        $result = $modelCommentGoods -> saveAll($dataGoods);
        if(false === $result){
            $modelCommentOrder ->rollback();
            return buildFailed();
        }

        //修改 订单状态
        $modelOrder = new \app\hss\model\Order();
        $where = [
            'user_id'=>$uid,
            'id'=>$data['order_id']
        ];
        $result = $modelOrder -> save(['order_status'=>4],$where);
        if(false === $result){
            $modelOrder ->rollback();
            return buildFailed();
        }
        $modelCommentGoods ->commit();
        return buildSuccess();
    }

    /**
     * @return false|string
     * 获取订单评论详情
     */
    public function getOrderCommentInfo()
    {
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        //判断是否登录
        $rst = isLogin();
        if($rst['code'] == 1){
            $user = $rst['user'];
        }else{
            return buildFailed($rst['msg']);
        }
        $model = new \app\hss\model\CommentOrder();
        $orderId = input('get.order_id/d');
        if(!$orderId){
            return buildFailed(config('custom.parameter_error'));
        }
        $config=[
            'where'=>[
                ['co.status','=',0],
                ['co.user_id','=',$user['id']],
                ['co.order_id','=',$orderId],
            ],
            'field'=>[
                'co.order_id','co.service_score','co.logistics_score','co.create_time',
                'co.update_time','cg.goods_id','cg.score','cg.img','cg.video','cg.title','cg.content','cg.anonymous'
            ],
            'join'=>[
                ['comment_goods cg','co.order_id = cg.order_id','left']
            ],
        ];

        $list = $model -> getList($config);
        return buildSuccess($list);

    }


}
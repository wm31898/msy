<?php
namespace app\hss\controller;

use think\db\exception\BindParamException;

class Tweet extends \common\controller\BaseApi{

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

        $model = new \app\hss\model\Tweet();
        $data = input('post.');
        $data = $data['data'];
        $data['user_id'] = $user['id'];

        if( isset($data['img']) && is_array($data['img']) && !empty($data['img']) ){
            $tempArr =[];
            foreach ($data['img'] as $item) {
                if($item){
                    $result = moveImgFromTempApi(config('upload_dir.tweet'),$item);
                    if(isset($result['status']) && $result['status'] == 0){
                        return buildFailed($result['info']);
                    }
                    $tempArr[] = $result;
                }
            }
            $data['img'] = implode(',',$tempArr);
        }
        if( isset($data['video']) && is_array($data['video']) && !empty($data['video']) ){
            $tempArr =[];
            foreach ($data['video'] as $item) {
                if($item){
                    $result = moveImgFromTempApi(config('upload_dir.tweet'),$item);
                    if(isset($result['status']) && $result['status'] == 0){
                        return buildFailed($result['info']);
                    }
                    $tempArr[] = $result;
                }
            }
            $data['video'] = implode(',',$tempArr);

//            $result = moveImgFromTempApi(config('upload_dir.tweet'),$item);
//            if(isset($result['status']) && $result['status'] == 0){
//                return buildFailed("1111".$result['info']);
//            }
//            $data['video'] = $result;
        }
        //新增
        $data['create_time'] = time();
        $model->startTrans();
        $result = $model -> allowField(true) -> save($data);
        if(!$result){
            $model->rollback();//事务回滚
            return buildFailed();
        }

        $tweetId = $model->getAttr('id');
        if($data['release_type'] == 3){
            if( isset($data['passages']) && is_array($data['passages']) && !empty($data['passages']) ){
                foreach ($data['passages'] as $k=>&$passage) {
                    $tempArr = [];
                     foreach ($passage['illustration'] as $kk=>&$illustration){
                         if($illustration){
                             $result = moveImgFromTempApi(config('upload_dir.tweet'),$illustration);
                             if(isset($result['status']) && $result['status'] == 0){
                                 return buildFailed($result['info']);
                             }
                             $tempArr[] = $result;
                         }

                     }

                    $passage['illustration'] = implode(',',$tempArr);
                    $passage['tweet_id'] = $tweetId;
                }

            }
            $modelPassage = new \common\model\Passage;
            $result = $modelPassage->allowField(true)->saveAll($data['passages']);
//            echo $modelPassage->getLastSql();exit;
            if(!$result){
                $model->rollback();//事务回滚
                return errorMsg('失败');
            }

        }

        $model->commit();//事务提交
        return buildSuccess($data);
    }

    /**
     *  分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Comment();
        $goodsId = input('get.goods_id/d');
        $config=[
            'where'=>[
                ['c.status','=',0],
                ['c.goods_id','=',$goodsId],
            ],
            'field'=>[
               'c.id as comment_id','u.name','c.user_id','c.score','c.img','c.title','c.content','c.create_time','c.update_time',
            ],
            'join'=>[
                ['common.user u','u.id = c.user_id','left']
            ],
            'order'=>[
                'c.id'=>'desc'
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



}
<?php
namespace app\hss\controller;

class Collection extends \common\controller\UserBaseApi {

    /**
     * 收藏
     */
    public function collect(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $goodsId = (int)$data['data']['goods_id'];
        if(!$goodsId){
            return buildFailed(config('custom.parameter_error'));
        }
        $model = new \app\hss\model\Collection();
        $config = [
            'where'=>[
                ['user_id','=',$this->user['id']],
                ['goods_id','=',$goodsId],
                ['status','=',0]
            ]
        ];
        $info = $model -> getInfo($config);
        if(count($info)){
            return buildSuccess([],'收藏成功');
        }
        $data = [
            'user_id'=>$this->user['id'],
            'goods_id'=>$goodsId,
            'create_time'=>time(),
        ];
        $result = $model -> isUpdate(false) -> save($data);
        if($result){
            return buildSuccess([],'收藏成功');
        }else{
            return buildFailed();
        }
    }


    /**
     * @return array|mixed
     * 查出产商相关收藏 分页查询
     */
    public function getList(){
        if (!request()->isGet()) {
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Collection();
        $config=[
            'where'=>[
                ['co.status', '=', 0],
                ['co.user_id', '=', $this->user['id']],
            ],
            'field'=>[
                'co.id','co.goods_id','g.headline','g.thumb_img','g.bulk_price','g.specification', 'g.purchase_unit'

            ], 'join'=>[
                ['goods g','g.id = co.goods_id','left'],
            ],'order'=>[
                'co.id'=>'desc'
            ]

        ];
        if(input('?get.category_id') && input('get.category_id/d')){
            $config['where'][] = ['o.category_id_1', '=', input('get.category_id/d')];
        }
        $keyword = input('get.keyword','');
        if($keyword) {
            $config['where'][] = ['o.name', 'like', '%' . trim($keyword) . '%'];
        }

        $list = $model -> pageQuery($config);
        return buildSuccess($list);
    }

    //删除
    public function del(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $ids = $data['data']['ids'];
        $model = new \app\hss\model\Collection();
        $condition = [
            ['user_id','=',$this->user['id']],
            ['goods_id','in',$ids],
        ];
        $result = $model -> del($condition);
        if($result['status']){
            return buildSuccess(["ids"=>$ids],'已取消收藏');
        }else{
            return buildFailed();
        }
    }
}
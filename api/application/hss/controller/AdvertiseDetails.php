<?php
namespace app\hss\controller;

class AdvertiseDetails extends \common\controller\BaseApi{
    /**商品详情页
     */
    public function getInfo(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $id = intval(input('id'));
        if(!$id){
            return buildFailed(config('custom.parameter_error'));
        }
        $model = new \app\hss\model\AdvertiseDetails();
        $config =[
            'where' => [
                ['status', '=', 0],
                ['id', '=', $id],
            ],
        ];

        $info = $model->getInfo($config);
        if(empty($info)){
            return buildFailed('此商品已下架');
        }
        $info['detail_img'] = explode(',',(string)$info['detail_img']);
        return buildSuccess($info);
    }
    /**
     * 查出产商相关产品 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\AdvertiseDetails();
        $belong_to = intval(input('belong_to'));
        $config=[
            'where'=>[
                ['status', '=', 0],
                ['belong_to','=', $belong_to],
            ],
            'order'=>[
                'sort'=>'desc',
                'id'=>'desc',

            ],
        ];

        $list = $model -> pageQuery($config);
        return buildSuccess($list);
    }

}
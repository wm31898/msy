<?php
namespace app\hss\controller;

class Information extends \common\controller\BaseApi {

    /**
     *  分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new\app\hss\model\Information();
        $config=[
            'where'=>[
            ],
            'order'=>[
                'sort'=>'desc',
                'id'=>'desc'
            ],
        ];
        $keyword = input('get.keyword','');
        if($keyword) {
            $config['where'][] = ['name', 'like', '%' . trim($keyword) . '%'];
        }
        $list = $model -> pageQuery($config)->each(function($item, $key){
            $item['main_img'] = explode(',',(string)$item['main_img']);
            return $item;
        });
        return buildSuccess($list);
    }

}
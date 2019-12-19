<?php
namespace app\hss\controller;

class Project extends \common\controller\BaseApi {

    /**
     * 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Project();
        $config=[
            'where'=>[
                ['shelf_status','=',3]
            ],
//            'field'=>[
//                'id','name','thumb_img','thumb_decs','price'
//            ],
            'order'=>[
                'sort'=>'desc',
                'id'=>'desc'
            ],
        ];
        if(input('?get.storeId') && (int)input('?get.storeId')){
            $config['where'][] = ['g.store_id', '=', input('get.storeId')];
        }
        $keyword = input('get.keyword','');
        if($keyword) {
            $config['where'][] = ['name', 'like', '%' . trim($keyword) . '%'];
        }
        $list = $model -> pageQuery($config);
        return buildSuccess($list);
    }

    /**详情页
     */
    public function getInfo(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $id = intval(input('id'));
        if(!$id){
            return buildFailed(config('custom.parameter_error'));
        }
        $model = new \app\hss\model\Project();
        $config =[
            'where' => [
                ['p.status', '=', 0],
                ['p.shelf_status', '=', 3],
                ['p.id', '=', $id],
            ],
        ];
        $info = $model->getInfo($config);
        if(empty($info)){
            return buildFailed('已下架');
        }
        $info['detail_img'] = explode(',',(string)$info['detail_img']);
        $info['tag'] = explode(',',(string)$info['tag']);
        return buildSuccess($info);
    }
}
<?php
namespace app\hss\controller;

class Scene extends \common\controller\BaseApi{
    /**
     * 查出 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new\app\hss\model\Scene();
        $config=[
            'where'=>[
            ],
            'field'=>[
                'g.id,g.sale_price,g.sale_type,g.shelf_status,g.create_time,g.update_time,g.inventory,
                g.name,g.retail_price,g.trait,g.category_id_1,g.category_id_2,g.category_id_3,
                g.thumb_img,g.goods_video,g.main_img,g.details_img,g.tag,g.parameters,g.sort,g.trait'
            ],
            'order'=>[
                'sort'=>'desc',
                'line_num'=>'asc',
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
        $model = new\app\hss\model\Scene();
        $config =[
            'where' => [
                ['status', '=', 0],
                ['shelf_status', '=', 3],
                ['id', '=', $id],
            ],
        ];
//        $css = (input('css'));
//        $this->assign('css',$css);
        $info = $model->getInfo($config);
        if(empty($info)){
           return buildFailed('已下架');
        }
        $info['main_img'] = explode(',',(string)$info['main_img']);
        $info['tag'] = explode(',',(string)$info['tag']);
        return buildSuccess($info);
    }

}
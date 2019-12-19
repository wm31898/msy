<?php
namespace app\hss\controller;

class Goods extends \common\controller\BaseApi{
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
        $model = new \app\hss\model\Goods();
        $config =[
            'where' => [
                ['g.status', '=', 0],
                ['g.shelf_status', '=', 3],
                ['g.id', '=', $id],
            ],
        ];
        $info = $model->getInfo($config);
        if(empty($info)){
            return buildFailed('此商品已下架');
        }
        $info['main_img'] = explode(',',(string)$info['main_img']);
        $info['detail_img'] = explode(',',(string)$info['detail_img']);
        $info['tag'] = explode(',',(string)$info['tag']);
        return buildSuccess($info);
    }
    /**
     * 查出产商相关产品 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Goods();
        $config=[
            'where'=>[
                ['g.status', '=', 0],
                ['g.shelf_status', '=', 3],
            ],
            'field'=>[
                'g.id ','g.name','g.headline','g.thumb_img','g.retail_price','g.category_id_1','g.thumb_img_type','g.thumb_img_desc'

            ],
            'order'=>[
                'is_selection'=>'desc',
                'sort'=>'desc',
                'id'=>'desc'
            ],
        ];
        if(input('?get.category_id') && input('get.category_id/d')){
            $config['where'][] = ['g.category_id_1', '=', input('get.category_id/d')];
        }
        $keyword = input('get.keyword','');
        if($keyword) {
            $config['where'][] = ['name', 'like', '%' . trim($keyword) . '%'];
        }
        
        $list = $model -> pageQuery($config);
        return buildSuccess($list);
    }

    //获取商品分类
    public function goodsCategoryList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $modelGoodsCategory = new \app\hss\model\GoodsCategory();
        $config =[
            'where' => [
                ['gc.status', '=', 0],
                ['gc.level','=',1]
            ],
        ];
        $list = $modelGoodsCategory->getList($config);
        foreach ($list as &$value){
            $value['tag'] = explode(',',(string)$value['tag']);
        }
        return buildSuccess($list);
    }

    /**获取推荐商品
     * @return array|\think\response\View
     */
    public function getRecommendGoods(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        if( input('?get.goods_id') && input('get.goods_id/d')){
            $join =[
                'join'=>[
                    ['goods g','g.id = rg.recommend_goods_id','left']
                ]
            ];
            $model = new \app\hss\model\RecommendGoods();
        }
        if( input('?get.project_id') && input('get.project_id/d')){
            $join =[
                'join'=>[
                    ['goods g','g.id = pg.goods_id','left']
                ]
            ];

            $model = new \app\hss\model\ProjectGoods();
        }
        if( input('?get.scene_id') && input('get.scene_id/d')){
            $join =[
                'join'=>[
                    ['goods g','g.id = sg.goods_id','left']
                ]
            ];
            $model = new \app\hss\model\SceneGoods();
        }
        //相关推荐商品
        $config =[
            'where' => [
                ['g.status', '=', 0],
            ],'field'=>[
                'g.id ','g.headline','g.thumb_img','g.bulk_price','g.specification','g.minimum_order_quantity',
                'g.minimum_sample_quantity','g.increase_quantity','g.purchase_unit'
            ],'join'=>[
                ['goods g','g.id = rg.recommend_goods_id','left']
            ]
        ];
        $config = array_merge($config,$join);
        $list = $model->getList($config);
        return buildSuccess($list);
    }

    /**
     * 状态  查出相关购物车产品信息 分页查询
     */
    public function getCartGoodsList(){
        if(!request()->isGet()){
            return errorMsg('请求方式错误');
        }
        $user = checkLogin();
        if(!$user){
            $cartList = input('get.cartList');
            $goodsList =  json_decode($cartList,true)['data'];
            $goodsIds = array_column($goodsList,'goods_id');
            $model = new \app\index\model\Goods();
            $config=[
                'where'=>[
                    ['g.status', '=', 0],
                    ['g.id', 'in', $goodsIds],
                ],
                'field'=>[
                    'g.id ','g.name','g.headline','g.thumb_img','g.thumb_img_desc','g.franchise_price','g.retail_price','g.sample_price','g.specification','g.minimum_order_quantity',
                    'g.minimum_sample_quantity','g.increase_quantity','g.purchase_unit', 'g.shelf_status',
                ],
            ];
            $list = $model -> pageQuery($config)->toArray();
            $showGoodsList =  $list['data'];
            foreach ($showGoodsList as $i =>&$showGoods){
                foreach($goodsList as $j=>&$goods){
                    if($showGoods['id'] == $goods['goods_id'] ){
                        $showGoodsList[$i]['num'] = $goods['num'];
                        $showGoodsList[$i]['cart_id'] = $i+1;
                    }
                }
            }
            $list['data']=$showGoodsList;
        }else{
            $userId = $user['id'];
            $model = new \app\index\model\Cart();
            $config=[
                'where'=>[
                    ['c.user_id','=',$userId],
                    ['c.status','=',0],
                    ['g.status','=',0],
                ],'join' => [
                    ['goods g','g.id = c.goods_id','left']
                ],'field'=>[
                    'c.id as cart_id','c.goods_id','c.num','c.create_time',
                    'g.id ','g.name','g.headline','g.thumb_img','g.thumb_img_desc','g.franchise_price','g.retail_price','g.sample_price','g.specification','g.minimum_order_quantity',
                    'g.minimum_sample_quantity','g.increase_quantity','g.purchase_unit','g.shelf_status',
                ],'order'=>[
                    'c.id'=>'desc'
                ],
            ];
            $keyword = input('get.keyword','');
            if($keyword) {
                $config['where'][] = ['g.name', 'like', '%' . trim($keyword) . '%'];
            }
            $list = $model -> pageQuery($config);
        }
        $this->successMsg('成功',$list);
    }

}
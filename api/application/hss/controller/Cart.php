<?php
namespace app\hss\controller;

class Cart extends \common\controller\UserBaseApi{
    /**
     * @return array
     * @throws \Exception
     *
     */
    public function add(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $goodsList = input('post.');
        $goodsList = $goodsList['data'];
        if(empty($goodsList)){
            return buildFailed(config('custom.parameter_error'));
        }
        $userId = $this->user['id'];
        $model = new \app\hss\model\Cart();
        $config = [
          'where' => [
              ['user_id','=',$userId],
              ['status','=',0]
          ],'field'=>[
              'id','user_id','foreign_id','num','create_time','goods_type'
            ]
        ];
        $cartList = $model->getList($config);
        $addData = [];
        $updateData =[];
        foreach ($goodsList as $goods){
            //假定没找到
            $find = false;
            foreach ($cartList as $cart){
                if($goods['foreign_id'] == $cart['foreign_id'] && $goods['goods_type'] == $cart['goods_type']  ){//找到了，则更新记录
                    $find = true;
                    $data = [
                        'user_id' => $this->user['id'],
                        'id' => $cart['id'],
                        'foreign_id' => $cart['foreign_id'],
                        'goods_type' => $cart['goods_type'],
                        'num' => $goods['num'] + $cart['num'],
                    ];
                    $updateData[] = $data;
                }
            }
            if(!$find){//如果没找到，则新增
                $data = [
                    'user_id' => $this->user['id'],
                    'foreign_id' => $goods['foreign_id'],
                    'goods_type' =>$goods['goods_type'],
                    'num' =>$goods['num'],
                    'create_time'=>time(),
                ];
                $addData[] = $data;
            }
        }
        $model->startTrans();
        if(!empty($addData)){
            $res =  $model->saveAll($addData);
            if (!count($res)) {
                $model->rollback();
                return buildFailed();
            }
        }
        if(!empty($updateData)){
            $res =  $model->saveAll($updateData);
            if (!count($res)) {
                $model->rollback();
                return buildFailed();
            }
        }
        $model -> commit();
        return buildSuccess();
    }

    /**
     * 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $userId = $this->user['id'];
        $model = new \app\hss\model\Cart();
         $config=[
             'where'=>[
                 ['c.user_id','=',$userId],
//                 ['c.create_time','>',time()-7*24*60*60],//只展示7天的数据
                 ['c.status','=',0],
             ],'join' => [
                 ['goods g','g.id = c.foreign_id','left']
             ],'field'=>[
                 'c.id as cart_id','c.foreign_id','c.num','c.goods_type','c.create_time',
                 'g.id as goods_id','g.headline','g.name','g.thumb_img','g.retail_price','g.specification',
                 'g.minimum_sample_quantity','g.increase_quantity','g.purchase_unit'
             ],'order'=>[
                 'c.id'=>'desc'
             ],
         ];
         $list = $model -> pageQuery($config);
         return buildSuccess($list);

    }

    //修改购物车数量
    public function editCartNum(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $data['user_id'] = $this -> user['id'];
        $model = new \app\hss\model\Cart();
        $res = $model ->isUpdate(true)-> save($data);
        if(false === $res){
            return buildFailed();
        }
        return buildSuccess();
    }

    //删除
    public function del(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $ids = $data['data']['ids'];
        $model = new \app\hss\model\Cart();
        $condition = [
            ['user_id','=',$this->user['id']],
            ['id','in',$ids],
        ];
        $result = $model -> del($condition,true);
        if($result['status']){
            return buildSuccess($ids);
        }else{
            return buildFailed();
        }
    }
}
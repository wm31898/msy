<?php
namespace app\hss\controller;

class Order extends \common\controller\UserBaseApi
{
    //生成订单
    public function generate()
    {
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $modelOrder = new \app\hss\model\Order();
        $modelOrderDetail = new \app\hss\model\OrderDetail();
        $postDate = input('post.');
        $goodsList = $postDate['data'];
        $goodsType = $postDate['goods_type'];
        if($goodsType == 1){
            if (empty($goodsList)) {

                return buildFailed(config('custom.parameter_error'));
            }
            $goodsIds = array_column($goodsList,'goods_id');
            $config = [
                'where' => [
                    ['g.status', '=', 0],
                    ['g.id', 'in', $goodsIds],
                ], 'field' => [
                    'id as goods_id','headline as name','thumb_img','thumb_img_desc','retail_price as price'
                ]
            ];
            //计算订单总价
            $modeGoods = new \app\hss\model\Goods();
            $goodsListNew = $modeGoods->getList($config);
        }

        if($goodsType == 2){
            if (empty($goodsList)) {
                return buildFailed(config('custom.parameter_error'));
            }
            $goodsIds = array_column($goodsList,'goods_id');
            $config = [
                'where' => [
                    ['status', '=', 0],
                    ['id', 'in', $goodsIds],
                ], 'field' => [
                    'id as goods_id','name','thumb_img','thumb_decs as thumb_img_desc','price'

                ]
            ];

            $modeGoods = new \app\hss\model\Project();
            $goodsListNew = $modeGoods->getList($config);

        }
        //计算订单总价
        $amount = 0;
        foreach ($goodsList as $k1 => &$goodsInfo) {
            foreach ($goodsListNew as $k2 => &$goodsInfoNew) {
                if($goodsInfo['goods_id'] == $goodsInfoNew['goods_id']){
                    $goodsList[$k1]['name'] = $goodsInfoNew['name'];
                    $goodsList[$k1]['thumb_img'] = $goodsInfoNew['thumb_img'];
                    $goodsList[$k1]['price'] = $goodsInfoNew['price'];
                    $totalPrices = $goodsInfo['num'] * $goodsInfoNew['price'];
                    $amount += number_format($totalPrices, 2, '.', '');
                }
            }
        }
        //开启事务
        $modelOrder->startTrans();
        //订单编号
        $orderSN = generateSN();
        //组装父订单数组
        $data = [
                'sn' => $orderSN,
                'user_id' => $this->user['id'],
                'amount' => $amount,
                'actually_amount' => $amount,
                'create_time' =>  time(),
                'order_type'=>$goodsType,
                'store_id'=>1,
        ];
        //生成父订单
        $res = $modelOrder->allowField(true)->save($data);
        if (!$res) {
            $modelOrder->rollback();
            return buildFailed('1');
        }
        $orderId = $modelOrder ->getAttr('id');
        //组装订单明细
        $dataDetail = [];

        foreach ($goodsList as $item=>&$goodsInfo) {
            $dataDetail[$item]['father_order_id'] = $orderId;
            $dataDetail[$item]['price'] = $goodsInfo['price'];
            $dataDetail[$item]['num'] = $goodsInfo['num'];
            $dataDetail[$item]['goods_id'] = $goodsInfo['goods_id'];
            $dataDetail[$item]['goods_name'] = $goodsInfo['name'];
            $dataDetail[$item]['goods_img'] = $goodsInfo['thumb_img'];
            $dataDetail[$item]['user_id'] = $this->user['id'];
            $dataDetail[$item]['store_id'] = 1;
            $dataDetail[$item]['goods_type'] = $goodsType;
        }
        //生成订单明细
        $res = $modelOrderDetail->allowField(true)->saveAll($dataDetail)->toArray();
        if (!count($res)) {
            $modelOrder->rollback();
            return buildFailed('2');
        }
        $modelOrder->commit();
        return buildSuccess(array('order_sn' => $orderSN));
    }
    // 订单确认页
    public function confirm()
    {
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }

        $data = input('post.');
        $data = $data['data'];
        $fatherOrderId = (int)$data['order_id'];
        $modelOrder = new \app\hss\model\Order();
        $config = [
            'where' => [
                ['o.status', '=', 0],
                ['o.id', '=', $fatherOrderId],
                ['o.user_id', '=', $this->user['id']],
            ],'field' => [
                'o.id', 'o.sn', 'o.order_status'
            ],
        ];
        $orderInfo = $modelOrder -> getInfo($config);
        if($orderInfo['order_status']>0){
            return buildFailed('此订单已提交过');
        }
        $modelOrder ->startTrans();
        $data['order_status'] = 1;
        $condition = [
            ['user_id','=',$this->user['id']],
            ['id','=',$fatherOrderId],
        ];

        $res = $modelOrder -> allowField(true) -> save($data,$condition);

        if(false === $res){
            $modelOrder ->rollback();
            return buildFailed();
        }
        /*            $modelOrderDetail = new \app\index\model\OrderDetail();
                    $res = $modelOrderDetail -> isUpdate(true)-> saveAll($data['orderDetail']);
                    if (!count($res)) {
                        $modelOrder->rollback();
                        return $this->errorMsg('失败');
                    }*/
        //根据订单号查询关联的购物车的商品 删除

        $modelOrderDetail = new \app\hss\model\OrderDetail();
        $config = [
            'where' => [
                ['od.status', '=', 0],
                ['od.father_order_id', '=', $fatherOrderId],
            ], 'field' => [
                'od.goods_id','od.goods_type','od.price', 'od.num','od.father_order_id','od.user_id',
            ]
        ];
        $orderDetailList = $modelOrderDetail->getList($config);
        $model = new \app\hss\model\Cart();
        foreach ($orderDetailList as &$orderDetailInfo){
            if($orderDetailInfo['goods_type'] == 1){
                $condition = [
                    ['user_id','=',$this->user['id']],
                    ['foreign_id','=',$orderDetailInfo['goods_id']],
                    ['goods_type','in',$orderDetailInfo['goods_type']],
                ];
                $result = $model -> del($condition,false);
                if(!$result['status']){
                    $modelOrder->rollback();
                    return buildFailed('删除失败');
                }
            }

        }
        $modelOrder -> commit();
        return buildSuccess(array('order_id' => $fatherOrderId));
    }

    //订单-详情页
    public function getInfo()
    {
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Order();
        $orderSn = input('get.order_sn');
        $config=[
            'where'=>[
                ['o.status', '=', 0],
                ['o.user_id', '=', $this->user['id']],
                ['o.sn', '=', $orderSn],
            ],
            'field'=>[
                'o.id','o.pay_sn','o.sn','o.order_status','o.pay_code','o.amount','o.actually_amount','o.remark',
                'o.consignee','o.mobile','o.province','o.city','o.area','o.detail_address','o.create_time','o.payment_time',
                'o.finished_time',
                'u.name','u.mobile_phone'
            ],'join'=>[
                ['common.user u','u.id = o.user_id','left'],
            ],'order'=>[
                'o.id'=>'desc'
            ]
        ];
        $info = $model->getInfo($config);
        $info =  $info!=0?$info->toArray():[];
        $modelOrderDetail = new \app\hss\model\OrderDetail();
        $config=[
            'where'=>[
                ['od.status', '=', 0],
                ['od.father_order_id','=',$info['id']]
            ],
            'field'=>[
                'od.goods_id', 'od.price', 'od.num', 'od.goods_type',
                'od.goods_name','od.goods_img'
            ],
//            'join'=>[
//                ['goods g','g.id = od.goods_id','left'],
//            ],

        ];
        $goodsList = $modelOrderDetail -> getList($config);
        $goodsNum = 0;
        foreach ($goodsList as &$goods){
            $goodsNum+=$goods['num'];
        }
        $info['goods_list'] = $goodsList;
        $info['goods_num'] = $goodsNum;
        return buildSuccess($info);
    }

    /**
     * @return array|mixed
     * 查出产商相关产品 分页查询
     */
    public function getList(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Order();
        $config=[
            'where'=>[
                ['o.status', '=', 0],
                ['o.user_id', '=', $this->user['id']],
            ],
            'field'=>[
                'o.id','o.pay_sn','o.sn','o.order_status','o.pay_code','o.amount','o.actually_amount','o.remark',
                'o.consignee','o.mobile','o.province','o.city','o.area','o.detail_address','o.create_time','o.payment_time',
                'o.finished_time',
            ],'order'=>[
            'o.id'=>'desc'
        ]

        ];
        if(input('?get.order_status') && input('get.order_status/d')){
            $config['where'][] = ['o.order_status', '=', input('get.order_status/d')];
        }else{
            $config['where'][] = ['o.order_status', '>', 0];
        }
        if(input('?get.category_id') && input('get.category_id/d')){
            $config['where'][] = ['o.category_id_1', '=', input('get.category_id/d')];
        }
        $keyword = input('get.keyword','');
        if($keyword) {
            $config['where'][] = ['o.name', 'like', '%' . trim($keyword) . '%'];
        }

        $list = $model -> pageQuery($config)->each(function($item, $key){
            $modelOrderDetail = new \app\hss\model\OrderDetail();
            $config=[
                'where'=>[
                    ['od.status', '=', 0],
                    ['od.father_order_id','=',$item['id']]
                ],
                'field'=>[
                    'od.goods_id', 'od.price', 'od.num', 'od.goods_type',
                    'od.goods_name','od.goods_img'
                ],
//                'join'=>[
//                    ['goods g','g.id = od.goods_id','left'],
//                ],

            ];
            $goodsList = $modelOrderDetail -> getList($config);
            $goodsNum = 0;
            foreach ($goodsList as &$goods){
                $goodsNum+=$goods['num'];
            }
            $item['goods_list'] = $goodsList;
            $item['goods_num'] = $goodsNum;
            return $item;
        });
        return buildSuccess($list);
    }

    /**
     * 设置状态
     */
    public function setStatus(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $model = new \app\hss\model\Order();
        $data = input('post.');
        $data = $data['data'];
        $id = $data['id'];
        if(!$id){
            return buildFailed('失败');
        }
        $where=[
            ['status','=',0],
            ['id','=',$id],
            ['user_id','=',$this->user['id']],
        ];
        $orderStatus = $data['order_status'];
        $updateData = [
            'order_status' => $orderStatus,
        ];
        $rse = $model->isUpdate(true)->allowField(['order_status'])->save($updateData,$where);
        if(false === $rse){
            return buildFailed('失败');
        }
        return buildSuccess($data);
    }

    //删除
    public function del(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $ids = $data['data']['ids'];
        $model = new \app\hss\model\Order();
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

    // 去结算
    public function toPay()
    {
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $postData = input('post.');
        $postData = $postData['data'];
        $modelOrder = new \app\hss\model\Order();
        $condition = [
            'where' => [
                ['user_id','=',$this->user['id']],
                ['sn','=',$postData['order_sn']],
                ['order_status','<',2],
            ], 'field'=>[
                'id','sn','actually_amount'
            ]
        ];
        $orderInfo  = $modelOrder->getInfo($condition);
        //先查找支付表是否有数据
        $modelPay = new \app\hss\model\Pay();
        $condition = [
            'where' => [
                ['user_id','=',$this->user['id']],
                ['sn','=',$orderInfo['sn']],
                ['pay_status','=',1],
                ['type','=',config('custom.pay_type')['orderPay']['code']]
            ], 'field'=>[
                'id','sn','actually_amount'
            ]
        ];
        $payInfo  = $modelPay->getInfo($condition);
        if(empty($payInfo)){
            //增加
            $data = [
                'sn' => $orderInfo['sn'],
                'actually_amount' =>$orderInfo['actually_amount'],
                'user_id' => $this->user['id'],
                'pay_code' => $postData['pay_code'],
                'type' => config('custom.pay_type')['orderPay']['code'],
            ];
            $result  = $modelPay->isUpdate(false)->save($data);
            if(!$result){
                $modelPay ->rollback();
                return buildFailed();
            }

        }else{
            //修改
            $updateData = [
                'actually_amount' =>$orderInfo['actually_amount'],
                'pay_code' => $postData['pay_code'],
            ];
            $where = [
                'sn' => $orderInfo['sn'],
                'user_id' => $this->user['id'],
            ];
            $result  = $modelPay->isUpdate(true)->save($updateData,$where);
            if($result === false){
                $modelPay ->rollback();
                return buildFailed();
            }
        }
        // 各支付方式的处理方式 //做到这里
        switch($postData['pay_code']){
            // 支付中心处理
            case config('custom.pay_code.WeChatPay.code') :
            case config('custom.pay_code.Alipay.code') :
            case config('custom.pay_code.UnionPay.code') :
                $url = config('custom.pay_gateway').$orderInfo['sn'];
                break;
        }
        return buildSuccess(['url'=>$url]);
    }

}
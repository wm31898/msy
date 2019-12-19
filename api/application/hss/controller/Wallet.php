<?php
namespace app\hss\controller;

class Wallet extends \common\controller\UserBaseApi{
    protected $wallet = null;
    public function __construct(){
        parent::__construct();
        // 平台初始化
        $this->wallet = cache('wallet'.$this->user['id']);
        if (empty( $this->wallet)){
            $model = new \app\hss\model\Wallet();
            $config = [
                'where' => [
                    ['status', '=', 0],
                    ['user_id', '=', $this->user['id']],
                ], 'field' => [
                    'id','user_id','status','amount','password'
                ],
            ];
            $this->wallet = $model->getInfo($config);
            if(empty( $this->wallet)){
                $model->isUpdate(false)->save(['user_id'=>$this->user['id']]);
                $this->wallet = $model->getInfo($config);
            }
            $this->wallet = cache('wallet'.$this->user['id'],$this->wallet->toArray());
        }
        // 判断是否已开通钱包,后面改进此方法
        if( in_array(request()->action(),['recharge','orderPayment']) ){
            if(empty($this->wallet['password'])){
                echo buildFailed('没有设置钱包密码');exit;
            }
        }
    }

    /**登录
     */
    public function login(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $model = new \app\hss\model\Wallet();;
        $postData = input('post.');
        $postData = $postData['data'];
        $postData['user_id'] = $this->user['id'];
        return $model->login($postData) ;
    }
    
    /**忘记密码 /注册
     */
    public function forgetPassword(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $model = new \app\hss\model\Wallet();;
        $postData = input('post.');
        $postData = $postData['data'];
        $postData['user_id'] = $this->user['id'];
        print_r( $model->resetPassword($postData));
    }

    /**
     * 钱包充值页面
     */
    public function recharge(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $data = $data['data'];
        $amount = (float)$data['amount'];
        $payCode = (int)$data['pay_code'];
        if( !$amount || !$payCode ){
            return buildFailed('参数错误');
        }
        //生成充值明细
        $walletDetailSn = generateSN();
        $data = [
            'sn'=>$walletDetailSn,
            'user_id'=>$this->user['id'],
            'amount'=>$amount,
            'actually_amount'=>$amount, // 还没有其它的业务 暂时先用$amount
            'create_time'=>time(),
            'pay_code'=>$payCode,
        ];
        // 线下汇款凭证
        if( isset($_POST['voucher']) && $_POST['voucher'] ){
            $data['voucher_img'] = moveImgFromTemp(config('upload_dir.scheme'),$_POST['voucher']);
        }

        $model= new \app\hss\model\WalletDetail();
        $res  = $model->isUpdate(false)->save($data);
        if(!$res){
            return buildFailed('充值失败');

        }
        //生成支付表的数据
        $modelPay = new \app\hss\model\Pay();
        //增加
        $data = [
            'sn' => $walletDetailSn,
            'actually_amount' =>$amount,
            'user_id' => $this->user['id'],
            'pay_code' => $payCode,
            'type' => config('custom.pay_type')['rechargePay']['code'],
        ];
        $result  = $modelPay->isUpdate(false)->save($data);
        if(!$result){
            $model->rollback();
            return buildFailed('失败');
        }
        // 各充值方式的处理
        switch($payCode){
            case config('custom.recharge_code.WeChatPay.code') :
            case config('custom.recharge_code.Alipay.code') :
            case config('custom.recharge_code.UnionPay.code') :
                $url = config('custom.pay_recharge').$walletDetailSn;
                return buildSuccess(['url'=>$url]);
                break;

            case config('custom.recharge_code.OfflinePay.code') :
                // 更新状态
                $result  = $model->isUpdate(false)->save(['sn'=>$walletDetailSn]);
                return successMsg('成功');
                break;
        }
    }

    //订单支付
    public function orderPayment(){
        $data = input('post.');
        $orderSn = $data['data']['order_sn'];
        $modelOrder = new \app\hss\model\Order();
        $config = [
            'where' => [
                ['o.status', '=', 0],
                ['o.sn', '=', $orderSn],
                ['o.user_id', '=', $this->user['id']],
            ], 'field' => [
                'o.id', 'o.sn', 'o.amount',
                'o.user_id', 'o.actually_amount', 'o.order_status'
            ],
        ];
        $orderInfo = $modelOrder->getInfo($config);
        if (empty($orderInfo) || !$orderInfo['order_status']) {
            return buildFailed('无效订单');
        }
        if ($orderInfo['order_status'] > 1 || empty($orderInfo)) {
            return buildFailed('订单已处理');
        }
        if($this->wallet['amount'] < $orderInfo['actually_amount']){
            //返回状态
            return buildFailed('余额不足，请先充值');
        }
        $modelOrder ->startTrans();
        $modelWalletDetail = new \app\hss\model\WalletDetail();
        $orderInfo['pay_sn'] = generateSN();
        $orderInfo['payment_time'] = time();
        $res = $modelWalletDetail->walletPaymentHandle($orderInfo);
        if(!$res['status'] ){
            $modelOrder->rollback();
            //返回状态
            return buildFailed('失败');
        }
        $data = [
            'pay_code'=>4,
            'pay_sn'=> $orderInfo['pay_sn'],
            'payment_time'=> $orderInfo['payment_time'],
            'order_sn'=> $orderInfo['sn'],
        ];
        $res = $modelOrder->orderHandle($data, $orderInfo);
        if(!$res['status']){
            $modelOrder->rollback();
            //返回状态
            return buildFailed('失败');
        }
        $modelOrder->commit();
        return buildSuccess();
    }

    /**详情页
     */
    public function getInfo(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\Wallet();
        $config =[
            'where' => [
                ['status', '=', 0],
                ['user_id', '=', $this->user['id']],
            ],'field' => [
                'id', 'amount'
            ],
        ];
        $info = $model->getInfo($config);
        return buildSuccess($info);
    }

    /**
     * 获取钱包详情列表
     * @return false|string
     */
    public function getWalletDetails(){
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \app\hss\model\WalletDetail();
        $config =[
            'where' => [
                ['status', '=', 0],
                ['user_id', '=', $this->user['id']],
            ],'field' => [
                'id', 'recharge_status','pay_sn','pay_code','sn','type','actually_amount','amount','payment_time'
            ],
        ];
        $list = $model->pageQuery($config);
        return buildSuccess($list);
    }

}
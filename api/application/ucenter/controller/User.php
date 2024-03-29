<?php
namespace app\ucenter\controller;

use function Couchbase\passthruEncoder;

class User extends \common\controller\BaseApi{
    /**登录
     */
    public function login(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $modelUser = new \common\model\UserCenterApi();
        $data = input('post.');
        $data = $data['data'];
        return  $modelUser->login($data);
    }
    /**注册
     */
    public function register(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $modelUser = new \common\model\UserCenterApi();
        $data = input('post.');
        $data = $data['data'];
        return $modelUser->register($data);
    }

    //退出
    public function logout(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $token = request()->header()['token'];
        cache('Login:' . $token,null);
        return buildSuccess([],'退出成功');
    }
    /*发送验证码
     */
    public function sendSms(){
        if (!(request()->isPost())) {
            return config('custom.not_post');
        }
        $data = input('post.');
        $mobilePhone = $data['data']['mobile_phone'];
        $captcha = create_random_str(4);
        $config = array(
            'mobilePhone' => $mobilePhone,
            'smsSignName' => config('custom.sms_sign_name'),
            'smsTemplateCode' => config('custom.sms_template_code'),
            'captcha' => $captcha,
        );
        $response = \common\lib\Sms::sendSms($config);
        if('OK'!==$response->Code){
            if('BUSINESS_LIMIT_CONTROL'===$response->Code){
                return buildFailed('同一个手机号码发送短信验证码，支持1条/分钟，5条/小时 ，累计10条/天。');
            }
            return buildFailed($response->Message);
        }
        //设置session
//        session('captcha_'.$mobilePhone,$captcha);
        cache('captcha_'.$mobilePhone,$captcha);
        return buildSuccess($response->Message);
    }

    //修改头像
    public function editAvatar(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $result = isLogin();
        if($result['code'] == -1){
            return buildFailed($result['msg']);
        }
        $user = $result['user'];
        $oldAvatar = $user['avatar'];
        $data = input('post.');
        $fileBase64 = $data['data']['fileBase64'][0];
        $upload = config('upload_dir.user_avatar');
        $result = json_decode(uploadSingleFile($fileBase64,$upload),true);
        if($result['code'] == -1){
            return buildFailed($result['msg']);
        }
        $user['avatar'] = $result['data'][0];
        $modelUser = new \common\model\User();
        $result = $modelUser->allowField(['avatar'])->save($user, ['id' => $user['id']]);
        if(!$result){
            return buildFailed();
        }
        //删除旧详情图
        delImgFromPathsApi($oldAvatar,$user['avatar']);
        return buildSuccess(['token' => getToken($user),'avatar'=>$user['avatar']]);
    }

    //修改名字
    public function editName(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $result = isLogin();
        if($result['code'] == -1){
            return buildFailed($result['msg']);
        }
        $user = $result['user'];
        $data = input('post.');
        $newName = preg_replace('# #','',$data['data']['name']);
        $user['name'] = $newName;
        $modelUser = new \common\model\User();
        $result = $modelUser->allowField(['name'])->save($user, ['id' => $user['id']]);
        if(!$result){
            return buildFailed();
        }
        return buildSuccess(['token' => getToken($user),'name'=>$user['name']]);
    }
}
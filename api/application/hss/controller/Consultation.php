<?php
namespace app\hss\controller;

class Consultation extends \common\controller\BaseApi{

    /**
     * 提交需求留言
     */
    public function addNeedsMessage(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $data = $data['data'];
        $data['create_time'] =time();
        $model = new \app\hss\model\NeedsMessage();
        $result = $model -> isUpdate(false)->save($data);
        if (!$result){
            return buildFailed();
        }else{
            return buildSuccess([],'已提交，等待电话回复，谢谢~');
        }
    }
}
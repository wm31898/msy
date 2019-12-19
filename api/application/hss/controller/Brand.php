<?php
namespace app\hss\controller;

class Brand extends \common\controller\UserBaseApi{
    public function edit(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $userId = $this->user['id'];
        $data = input('post.');
        $data = $data['data'];
        $model = new  \app\hss\model\Brand();
        if( isset($data['logo']) && $data['logo'] ){
            $result = moveImgFromTempApi(config('upload_dir.weiya_brand'),$data['logo']);
            if(isset($result['status']) && $result['status'] == 0){
                return buildFailed($result['info']);
            }
            $data['logo'] = $result;

        }
        if( isset($data['certificate']) && $data['certificate'] ){
            $result = moveImgFromTempApi(config('upload_dir.weiya_brand'),$data['certificate']);
            if(isset($result['status']) && $result['status'] == 0){
                return buildFailed($result['info']);
            }
            $data['certificate'] = $result;
        }
        if( isset($data['authorization']) && $data['authorization'] ){
            $result = moveImgFromTempApi(config('upload_dir.weiya_brand'),$data['authorization']);
            if(isset($result['status']) && $result['status'] == 0){
                return buildFailed($result['info']);
            }
            $data['authorization'] = $result;
        }
        if(isset($data['id']) && !empty($data['id']) ){
            //开启事务
            $model -> startTrans();
            //修改
            $id = $data['id'];
            $data['update_time'] = time();
            $condition = [
                ['status','=',0],
                ['id','=',$id],
                ['user_id','=',$userId],
            ];
            $result = $model -> isUpdate(false)->save($data,$condition);
            if( false === $result ){
                $model ->rollback();
                return buildFailed();
            }
            $config = [
                'where' => [
                    ['status','=',0],
                    ['id','=',$id],
                    ['user_id','=',$userId],
                ],
            ];
            $info = $model->getInfo($config);
            if($info['logo']){
                //删除旧主图
                delImgFromPathsApi($info['logo'],$data['logo']);
            }
            if($info['certificate']){
                //删除旧主图
                delImgFromPathsApi($info['certificate'],$data['certificate']);
            }
            if($info['authorization']){
                //删除商品旧主图
                delImgFromPathsApi($info['authorization'],$data['authorization']);
            }
            $model->commit();
            return buildSuccess($info);
        }else{
            //增加
            $config = [
                'where'=>[
                    ['status','=',0],
                    ['user_id','=',$userId]
                ],
            ];
            $list = $model -> getList($config);
            if(empty($list)){
                $data['is_default'] = 1;
            }

            $data['user_id'] = $userId;
            $data['create_time'] = time();
            $result = $model->isUpdate(false)->save($data);
            if(!$result){
                return buildFailed();
            }
            $id = $model->getAttr('id');
            $data['id'] = $id;
            return buildSuccess($data);
        }
    }

    /**
     * @return array设置默认值
     */
   public function setDefault(){
       if (!request()->isPost()) {
           return buildFailed(config('custom.not_post'));
       }
       $data = input('post.');
       $data = $data['data'];
       $id = $data['id'];
       $userId = $this->user['id'];
       $where = [
           ['status','=',0],
           ['id',"=",$id],
           ['user_id','=',$userId],
       ];
       $model = new  \app\hss\model\Brand();
       $model -> startTrans();
       $result = $model->where($where)->setField('is_default',1);
       if(false === $result){
           $model ->rollback();
           return buildFailed();
       }
       //修改其他不为默认值
       $where = [
           ['status','=',0],
           ['id',"<>",$id],
           ['user_id','=',$userId],
       ];
       $result = $model->where($where)->setField('is_default',0);
       if(false === $result){
           $model ->rollback();
           return buildFailed();
       }
       $model->commit();
       return buildSuccess(["id"=>$id,'is_default'=>1]);
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
        $model = new \app\hss\model\Brand();
        $config =[
            'where' => [
                ['status', '=', 0],
                ['id', '=', $id],
                ['user_id', '=', $this->user['id']],
            ],
        ];
        $info = $model->getInfo($config);
        if(empty($info)){
            return buildFailed('没有数据');
        }
        return buildSuccess($info);
    }
    //获取列表
    public function getList(){
        $model = new  \app\hss\model\Brand();
        $config = [
            'where'=>[
                ['status','=',0],
                ['user_id','=',$this->user['id']]
            ],
        ];
        $list = $model -> getList($config);
        return buildSuccess($list);
    }

    //删除
    public function del(){
        if (!request()->isPost()) {
            return buildFailed(config('custom.not_post'));
        }
        $data = input('post.');
        $ids = $data['data']['ids'];
        if(empty($ids) && !is_array($ids)){
            return buildFailed(config('custom.parameter_error'));
        }
        $model = new \app\hss\model\Brand();
        $condition = [
            ['user_id','=',$this->user['id']],
            ['id','in',$ids],
        ];
        $result = $model -> del($condition);
        if($result['status']){
            return buildSuccess(['ids'=>$ids]);
        }else{
            return buildFailed();
        }
    }

}
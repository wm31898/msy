<?php
namespace app\ucenter\controller;
class Address extends \common\controller\UserBaseApi{
    //增加修改地址页面
    public function edit(){
        if(!request()->isPost()){
            return buildFailed(config('custom.not_post'));
        }
        $model = new \common\model\AddressC();
        $userId = $this->user['id'];
        $data = input('post.');
        $data = $data['data'];
        if($data['id'] ){
            //开启事务
            $model -> startTrans();
            //修改
            $addressId = $data['id'];
            unset($data['id']);
            $condition = [
                'status' => 0 ,
                'id' => $addressId ,
                'user_id' => $userId ,
            ];
            $id = $model -> edit($data,$condition);
//            echo $model->getLastSql();exit;
            if( !$id ){
                $model ->rollback();
                return buildFailed();
            }
            //修改其他地址不为默认值
            if($data['is_default'] == 1){
                $where = [
                    ['status','=',0],
                    ['id',"<>",$addressId],
                    ['user_id','=',$userId],
                ];
                $result = $model->where($where)->setField('is_default',0);
                if(false === $result){
                    $model ->rollback();
                    return buildFailed();
                }
            }
            $model->commit();
            return buildSuccess($data);
        }else{
            //增加
            $config = [
                'where'=>[
                    ['status','=',0],
                    ['user_id','=',$userId]
                ],
            ];
            $addressCount = $model -> where($config['where'])->count('id');
            if(!$addressCount){
                $data['is_default'] = 1;
            }
            //开启事务
            $model -> startTrans();
            $data['user_id'] = $userId;
            $id = $model->edit($data);
            if(!$id){
                return buildFailed();
            }
            //修改其他地址不为默认值
            if($data['is_default'] == 1){
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
            }
            $model->commit();
            $data['id'] = $id;
            return buildSuccess($data);
        }
    }

    //获取
    public function getList()
    {
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \common\model\AddressC();
        $config = [
            'where'=>[
                ['status','=',0],
                ['user_id','=',$this->user['id']]
            ],'field' => [
                'id','consignee','detail_address','tel_phone','mobile','is_default','status','province','city','area'
            ]
        ];
        $list = $model -> getList($config);
        return buildSuccess($list);

    }
    //获取
    public function getInfo()
    {
        if(!request()->isGet()){
            return buildFailed(config('custom.not_get'));
        }
        $model = new \common\model\AddressC();
        $id = input('get.id',0,'int');
        if( input('?get.id') && input('get.id/d')){
            $where =[
                'where'=>[
                    ['id','=',$id],
                ]
            ];
        }
        if( input('?get.is_default') && input('get.is_default/d')){
            $where =[
                'where'=>[
                    ['is_default','=',1],
                ]
            ];
        }
        $config = [
            'where'=>[
                ['status','=',0],
                ['user_id','=',$this->user['id']],
            ],'field' => [
                'id','consignee','detail_address','tel_phone','mobile','is_default','status','province','city','area'
            ]
        ];
        $config = array_merge($config,$where);
        $info = $model -> getInfo($config);
        return buildSuccess($info);

    }
    //删除地址
    public function del(){
        if(!request()->isPost()){
            return buildFailed("请求方式错误");
        }
        $data = input('post.');
        $id = (int)$data['data']['id'];
        if(!$id){
            return buildFailed("参数错误");
        }
        $model = new \common\model\AddressC();
        $condition = [
            ['user_id','=',$this->user['id']],
            ['id','=',$id],
        ];
        $result = $model -> del($condition);
        if($result['status']){
            return buildSuccess($data['data'],'删除成功');
        }else{
            return buildFailed($result['info']);
        }

    }

}
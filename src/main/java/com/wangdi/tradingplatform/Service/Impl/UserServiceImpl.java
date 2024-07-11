package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangdi.tradingplatform.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    //保存一个新的用户
    public int save(User user){
        return userMapper.insert(user);
    }
    //通过ID删除一个用户
    public int delete(int id){
        return userMapper.deleteById(id);
    }
    //通过ID更改用户信息
    public int change(User user){
        return userMapper.updateById(user);
    }
    //通过ID查找用户
    public User findByID(int id){
        return userMapper.selectById(id);
    }
    //通过账号查找用户
    public User findByAccount(String Account){
        return userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getAccount, Account));
    }
    //查找所有用户
    public List<User> findAll(){
        return userMapper.selectList(null);
    }

    @Override
    public PageInfo<User> pageAll(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list = userMapper.selectList(null);
        return new PageInfo<User>(list);
    }

    @Override
    public boolean hasAccount(String account) {
        return false;
    }

    @Override
    public boolean register(User user) {
        return false;
    }
}

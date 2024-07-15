package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.Annotation.LogAnnotation;
import com.wangdi.tradingplatform.DAO.AdministratorMapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangdi.tradingplatform.Service.ManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ManageServiceImpl implements ManageService {
    private final UserMapper userMapper;

    private final AdministratorMapper administratorMapper;
    //新建一个管理员
    public int addAdmin(Administrator admin){
        return administratorMapper.add(admin);
    }
    //根据ID删除一个管理员
    @LogAnnotation
    public int deleteAdmin(int id){
        System.out.println(id);
        return administratorMapper.delete(id);
    }
    //通过账号查找管理员
    public Administrator findAdminByAccount(String Account){
        return administratorMapper.findByAccount(Account);
    }
    //通过ID查找管理员
    public Administrator findAdminByID(int id){
        return administratorMapper.findByID(id);
    }
    //查找所有管理员
    public List<Administrator> findAllAdmins(){
        return administratorMapper.findAll();
    }
    //保存一个新的用户
    public int addUser(User user){
        return userMapper.insert(user);
    }
    //通过ID删除一个用户
    public int deleteUser(int id){
        return userMapper.deleteById(id);
    }
    //通过ID更改用户信息
    public int changeUser(User user){
        return userMapper.updateById(user);
    }
    //通过ID查找用户
    public User findUserByID(int id){
        return userMapper.selectById(id);
    }
    //通过账号查找用户
    public User findUserByAccount(String Account){
        return userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getAccount, Account));
    }
    //查找所有用户
    public List<User> findAllUsers(){
        return userMapper.selectList(null);
    }

    @Override
    public PageInfo<User> pageAllUsers(int pageNum, int pageSize) {
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

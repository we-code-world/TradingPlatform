package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ManageService {

    //新建一个管理员
    int addAdmin(Administrator admin);
    //根据ID删除一个管理员
    int deleteAdmin(int id);
    //通过账号查找管理员
    Administrator findAdminByAccount(String Account);
    //通过ID查找管理员
    Administrator findAdminByID(int id);
    //查找所有管理员
    List<Administrator> findAllAdmins();

    //保存一个新的用户
    int addUser(User user);
    //通过ID删除一个用户
    int deleteUser(int id);
    //通过ID更改用户信息
    int changeUser(User user);
    //通过ID查找用户
    User findUserByID(int id);
    //通过账号查找用户
    User findUserByAccount(String Account);
    //查找所有用户
    List<User> findAllUsers();
    //分页查找所有用户
    PageInfo<User> pageAllUsers(int pageNum,int pageSize);

    // 判断是否存在账号
    boolean hasAccount(String account);
    // 注册用户
    boolean register(User user);
}

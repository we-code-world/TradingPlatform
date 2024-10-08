package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ManageService {

    //新建一个管理员
    int addAdmin(Administrator admin);
    //根据ID删除一个管理员
    int deleteAdmin(int id);
    //通过ID查找管理员
    Administrator findAdminByID(int id);

    //通过ID删除一个用户
    int deleteUser(int id);
    //通过ID更改用户信息
    int changeUser(User user);
    //通过ID查找用户
    User findUserByID(int id);
    //查找所有用户
    List<User> findAllUsers();
    //分页查找所有用户
    PageInfo<User> pageAllUsers(int pageNum,int pageSize);

    //根据ID更新一个交易
    int updateByid(Transaction deal);
    //根据ID查找一个交易
    Transaction findByID(int id);
    //匹配符合要求的交易列表
    List<Transaction> matching(Transaction transaction);
    //分页实现匹配符合要求的交易列表
    PageInfo<Transaction> pagematching(Transaction transaction,int pageNum,int pageSize);

    //根据卖方查找交易列表
    List<Transaction> findBySeller(int Sid);
    //分页实现根据卖方查找交易列表
    PageInfo<Transaction> pagefindBySeller(int Sid,int pageNum,int pageSize);
    //根据买方id查找交易列表
    List<Transaction> findByBuyer(int Bid);
    //分页实现根据买方id查找交易列表
    PageInfo<Transaction> pagefindByBuyer(int Bid,int pageNum,int pageSize);
    //根据物品id查找交易列表
    List<Transaction> findByGoods(int Gid);
    //分页实现根据物品id查找交易列表
    PageInfo<Transaction> pagefindByGoods(int Gid,int pageNum,int pageSize);
    //根据交易状态查找交易列表
    List<Transaction> findByStatus(int status);
    //分页实现根据交易状态查找交易列表
    PageInfo<Transaction> pagefindByStatus(int status,int pageNum,int pageSize);
    //查找所有的交易
    List<Transaction> findAll();
    //分页实现查找所有的交易
    PageInfo<Transaction> pagefindAll(int pageNum,int pageSize);

}

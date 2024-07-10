package com.wangdi.tradingplatform.DAO;

import com.wangdi.tradingplatform.Entity.Administrator;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper // 在运行时会自动生成接口的实现类对象
public interface AdministratorMapper {
    //新建一个管理员
    @Insert("insert into T_admin(id,account,password) values (null, #{account}, #{password});")
    public int add(Administrator admin);
    //根据ID删除一个管理员
    @Delete("delete from T_admin where id=#{id};")
    public int delete(int id);
    //通过账号查找管理员
    @Select("select id,account,password from T_admin where Account = #{account};")
    public Administrator findByAccount(String account);
    //通过ID查找管理员
    @Select("select id,account,password from T_admin where id = #{id};")
    public Administrator findByID(int id);
    //查找所有管理员
    @Select("select id,account,password from T_admin")
    public List<Administrator> findAll();
}

package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.DAO.AdministratorMapper;
import com.wangdi.tradingplatform.Entity.Administrator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service("AdministratorServiceImpl")
public class AdministratorServiceImpl implements AdministratorService {
    private final AdministratorMapper administratorMapper;
    //新建一个管理员
    public int save(Administrator admin){
        return administratorMapper.add(admin);
    }
    //根据ID删除一个管理员
    public int delete(int id){
        return administratorMapper.delete(id);
    }
    //通过账号查找管理员
    public Administrator findByAccount(String Account){
        return administratorMapper.findByAccount(Account);
    }
    //通过ID查找管理员
    public Administrator findByID(int id){
        return administratorMapper.findByID(id);
    }
    //查找所有管理员
    public List<Administrator> findAll(){
        return administratorMapper.findAll();
    }
}

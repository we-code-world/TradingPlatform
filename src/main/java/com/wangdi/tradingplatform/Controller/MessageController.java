package com.wangdi.tradingplatform.Controller;

import com.wangdi.tradingplatform.Entity.Message;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.MessageService;
import com.wangdi.tradingplatform.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Message")
public class MessageController {
    @Autowired
    @Qualifier("MessageServiceImpl")
    private MessageService messageService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @RequestMapping("/chat")
    @ResponseBody
    public Map<String,Object> chat(int id, int userid){
        Map<String,Object> map=new HashMap<String,Object>();
        Message M= new Message();
        M.setSenderId(userid);
        M.setReceiverId(id);
        List<Message> list=messageService.findBothSide(M);
        List<Message> list1=messageService.findByUser(userid);
        User seller=userService.findByID(id);
        User mine=userService.findByID(userid);
        List<User> ulist=new ArrayList<User>();
        try {
            ulist.add(seller);
            for (Message m:list1) {
                User u1=userService.findByID(m.getReceiverId());
                User u2=userService.findByID(m.getSenderId());
                if (u1!=null&&u1.getId()!=userid){
                    if (ulist.isEmpty())ulist.add(u1);
                    else {
                        int sign=1;
                        for (User u:ulist){
                            if (u1.getId()==u.getId())sign=0;
                        }
                        if (sign==1)ulist.add(u1);
                    }
                }
                if (u2!=null&&u2.getId()!=userid){
                    if (ulist.isEmpty())ulist.add(u2);
                    else {
                        int sign=1;
                        for (User u:ulist){
                            if (u2.getId()==u.getId())sign=0;
                        }
                        if (sign==1)ulist.add(u2);
                    }
                }
            }
            map.put("mine",mine);
            map.put("seller",seller);
            map.put("users",ulist);
            map.put("messages",list);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/all")
    @ResponseBody
    public Map<String,Object> all(int userid){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Message> list1=messageService.findByUser(userid);
        List<User> ulist=new ArrayList<User>();
        if(list1!=null){
            for (Message m:list1) {
                User u1=userService.findByID(m.getReceiverId());
                User u2=userService.findByID(m.getSenderId());
                if (u1!=null&&u1.getId()!=userid){
                    if (ulist.isEmpty())ulist.add(u1);
                    else {
                        int sign=1;
                        for (User u:ulist){
                            if (u1.getId()==u.getId())sign=0;
                        }
                        if (sign==1)ulist.add(u1);
                    }
                }
                if (u2!=null&&u2.getId()!=userid){
                    if (ulist.isEmpty())ulist.add(u2);
                    else {
                        int sign=1;
                        for (User u:ulist){
                            if (u2.getId()==u.getId())sign=0;
                        }
                        if (sign==1)ulist.add(u2);
                    }
                }
            }
            map.put("users",ulist);
            map.put("result","ok");
        }else {
            map.put("result","error");
        }
        return map;
    }
    @RequestMapping("/send")
    @ResponseBody
    public Map<String,Object> sendmsg(int id,int userid,String text){
        Map<String,Object> map=new HashMap<String,Object>();
        if(text==null||text==""){
            map.put("result","error");
            return map;
        }
        try {
            Message msg=new Message();
            msg.setReceiverId(id);
            msg.setSenderId(userid);
            msg.setContent(text);
            messageService.save(msg);
            map.put("result","ok");
        }catch (Exception e){
            map.put("result","error");
        }
        return map;
    }
}

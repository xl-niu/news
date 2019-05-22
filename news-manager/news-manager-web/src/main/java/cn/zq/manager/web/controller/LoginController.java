package cn.zq.manager.web.controller;

import cn.zq.common.pojo.PageData;
import cn.zq.common.utils.JsonUtils;
import cn.zq.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    /*登录*/
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public String login(String username, String password, HttpSession session) {
        PageData pageData = new PageData();
        pageData.put("username", username);
        pageData.put("password", password);
        List<PageData> list = loginService.getLogin(pageData);
        String result="用户名或密码错误！";
        if(list!=null && list.size()>0){
            PageData pd=list.get(0);
            session.setAttribute("user",pd);
            result=pd.get("resak002").toString();
            result="reload";
        }
        return JsonUtils.objectToJson(result);
    }
    /*登出*/
    @RequestMapping(value = "logout", method = RequestMethod.POST)
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("user");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("index");
        return mv;
    }
}

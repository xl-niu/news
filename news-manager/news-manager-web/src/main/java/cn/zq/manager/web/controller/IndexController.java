package cn.zq.manager.web.controller;

import cn.zq.common.pojo.PageData;
import cn.zq.service.LoginService;
import cn.zq.service.MeetingService;
import cn.zq.service.NewsService;
import cn.zq.service.OaServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private OaServer oaServer;
    @Autowired
    private NewsService newsService;
    @Autowired
    private MeetingService meetingService;

    @RequestMapping("/")
    public ModelAndView showIndex(HttpSession session){
        ModelAndView mv=new ModelAndView();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd 00:00:00");
        df.format(new Date());
        //公告
        List<PageData> list =newsService.getNewsTitle(1);
        //会议安排
        List<PageData> meeting=meetingService.getDayMeeting(df.format(new Date()));
        List<PageData> meetings=new ArrayList<>();
        for (PageData pd:meeting) {
            PageData resultMeet=new PageData();
            resultMeet.put("meetc",pd.get("meetRoom")+"&nbsp;&nbsp;"+pd.get("meetKssj").toString().substring(11,16)+ "—"+pd.get("meetJssj").toString().substring(11,16)+"&nbsp;&nbsp;"+pd.get("meetTitle"));
            pd.get("meetRoom");
            pd.get("meetKssj").toString().substring(11,16);
            pd.get("meetJssj").toString().substring(11,16);
            meetings.add(resultMeet);
        }
        String count="";
        try {
            PageData pd = (PageData) session.getAttribute("user");
            String userID = pd.get("resak001").toString();
            count = oaServer.getCount(userID);
        } catch (Exception e) {
        }
        mv.setViewName("index");
        mv.addObject("News",list);
        mv.addObject("meet",meetings);
        mv.addObject("notice",count);
        return mv;
    }

    @RequestMapping("/{page}")
    public String showPage(@PathVariable String page){
        return page;
    }
}

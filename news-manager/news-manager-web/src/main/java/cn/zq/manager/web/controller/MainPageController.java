package cn.zq.manager.web.controller;

import cn.zq.common.pojo.PageData;
import cn.zq.common.utils.JsonUtils;
import cn.zq.service.NewsService;
import cn.zq.service.OaServer;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainPageController {

    @Autowired
    private OaServer oaServer;
    @Autowired
    private NewsService newsService;

    /*获取OA中待处理事件数目*/
    @RequestMapping(value = "oa", method = RequestMethod.GET)
    @ResponseBody
    public String getCount(HttpSession session) {
        String result = "";
        try {
            PageData pd = (PageData) session.getAttribute("user");
            String userID = pd.get("resak001").toString();
            result = oaServer.getCount(userID);
        } catch (Exception e) {
        }
        PageInfo<PageData> pageInfo=newsService.getNewsContent(1);
        return JsonUtils.objectToJson(pageInfo);
    }

    /*获取前10条新闻标题*/
    @RequestMapping(value = "newsTitle", method = RequestMethod.GET)
    @ResponseBody
    public String getNewsTitle() {
        List<PageData> list =newsService.getNewsTitle(1);
        return JsonUtils.objectToJson(list);
    }
}

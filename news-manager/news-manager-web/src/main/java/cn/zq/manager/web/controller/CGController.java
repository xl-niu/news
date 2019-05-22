package cn.zq.manager.web.controller;

import cn.zq.common.pojo.PageData;
import cn.zq.common.utils.JsonUtils;
import cn.zq.service.CGService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CGController {

    @Autowired
    private CGService cgService;

    /*请购审批追踪*/
    @RequestMapping("30001")
    public ModelAndView QGSPZZ() {

        return null;
    }

    /*请购未转采购*/
    @RequestMapping("30002")
    public ModelAndView WZCG() {

        return null;
    }

    /*采购审批追踪*/
    @RequestMapping("30003")
    public ModelAndView CGSPZZ() {

        return null;
    }

    /*采购未供货表*/
    @RequestMapping("30004")
    public ModelAndView WGHB() {

        return null;
    }

    /*采购逾期未到货*/
    @RequestMapping("30005")
    @ResponseBody
    public String YQWDH(int page, int rows) {
        PageInfo<PageData> result = cgService.YQWDH(page, rows);
        return JsonUtils.objectToJson(result);
    }

    /*已收货未入库明细*/
    @RequestMapping("30006")
    public ModelAndView SHWRKMX() {

        return null;
    }
}

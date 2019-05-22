package cn.zq.service.impl;

import cn.zq.common.pojo.PageData;
import cn.zq.dao.util.DaoSupport;
import cn.zq.service.MeetingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MeetingServiceImpl implements MeetingService {
    @Resource(name = "daoSupport")
    private DaoSupport daoSupport;

    @Override
    public List<PageData> getDayMeeting(String day) {
        List<PageData> list = null;
        try {
            list = daoSupport.findForList("meet.getDayMeeting", day);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

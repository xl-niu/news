package cn.zq.service.impl;

import cn.zq.dao.util.DaoSupport;
import cn.zq.dao.util.DataSourceEnum;
import cn.zq.dao.util.DataSourceHolder;
import cn.zq.service.OaServer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OaServerImpl implements OaServer {

    @Resource(name = "daoSupport")
    private DaoSupport daoSupport;
    @Override
    public String getCount(String UserId) {
        DataSourceHolder.setDataSources(DataSourceEnum.DS3.getKey());
        String Count="";
        try {
            Count =daoSupport.findForObject("oa.getCount",UserId).toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Count;
    }
}

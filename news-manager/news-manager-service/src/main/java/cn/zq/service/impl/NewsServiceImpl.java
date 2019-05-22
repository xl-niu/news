package cn.zq.service.impl;

import cn.zq.common.pojo.PageData;
import cn.zq.dao.util.DaoSupport;
import cn.zq.dao.util.DataSourceEnum;
import cn.zq.dao.util.DataSourceHolder;
import cn.zq.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Resource(name = "daoSupport")
    private DaoSupport daoSupport;

    @Override
    public PageInfo<PageData> getNewsContent(int ClassID) {
        List<PageData> list = null;
        PageHelper.startPage(1, 10);
        try {
            DataSourceHolder.setDataSources(DataSourceEnum.DS2.getKey());
            list = daoSupport.findForList("news.getNews", ClassID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        PageInfo<PageData> pageInfo = new PageInfo<PageData>(list);
        return pageInfo;
    }
    @Override
    public List<PageData> getNewsTitle(int ClassID) {
        List<PageData> list = null;
        try {
            DataSourceHolder.setDataSources(DataSourceEnum.DS2.getKey());
            list = daoSupport.findForList("news.getNewsTitle", ClassID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

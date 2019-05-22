package cn.zq.service.impl;

import cn.zq.common.pojo.PageData;
import cn.zq.dao.util.DaoSupport;
import cn.zq.dao.util.DataSourceEnum;
import cn.zq.dao.util.DataSourceHolder;
import cn.zq.service.CGService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CGServiceImpl implements CGService {

    @Resource(name = "daoSupport")
    private DaoSupport daoSupport;

    @Override
    public List<PageData> QGSPZZ() {
        return null;
    }

    @Override
    public List<PageData> WZCG() {
        return null;
    }

    @Override
    public List<PageData> CGSPZZ() {
        return null;
    }

    @Override
    public List<PageData> WGHB() {
        return null;
    }

    @Override
    public PageInfo<PageData> YQWDH(int page, int rows) {
        DataSourceHolder.setDataSources(DataSourceEnum.DS4.getKey());
        List<PageData> list = null;
        PageHelper.startPage(page, rows);
        try {

            list = (List<PageData>) daoSupport.findForList("cg.yqwdh");

        } catch (Exception e) {
            e.printStackTrace();
        }
        PageInfo<PageData> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<PageData> SHWRKMX() {
        return null;
    }
}

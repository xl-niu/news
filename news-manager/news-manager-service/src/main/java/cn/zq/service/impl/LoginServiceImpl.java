package cn.zq.service.impl;

import cn.zq.common.pojo.PageData;
import cn.zq.dao.util.DaoSupport;
import cn.zq.dao.util.DataSourceEnum;
import cn.zq.dao.util.DataSourceHolder;
import cn.zq.service.LoginService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource(name = "daoSupport")
    private DaoSupport daoSupport;

    /**
     * 登录
     * @param pageData
     * @return
     */
    @Override
    public List<PageData> getLogin(PageData pageData) {
        List<PageData> list = null;
        try {
            DataSourceHolder.setDataSources(DataSourceEnum.DS2.getKey());
            if (pageData.get("username") != null && pageData.get("password") != null) {
                list = (List<PageData>) daoSupport.findForList("managerUser.findUserByNP", pageData);
                PageInfo<PageData> pageInfo = new PageInfo<>(list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

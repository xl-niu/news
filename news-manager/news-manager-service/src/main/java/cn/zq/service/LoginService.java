package cn.zq.service;

import cn.zq.common.pojo.PageData;

import java.util.List;

public interface LoginService {
    List<PageData> getLogin(PageData pageData);
}

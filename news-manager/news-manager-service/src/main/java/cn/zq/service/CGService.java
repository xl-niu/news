package cn.zq.service;

import cn.zq.common.pojo.PageData;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CGService {
    List<PageData> QGSPZZ();

    List<PageData> WZCG();

    List<PageData> CGSPZZ();

    List<PageData> WGHB();

    PageInfo<PageData> YQWDH(int page, int rows);

    List<PageData> SHWRKMX();
}

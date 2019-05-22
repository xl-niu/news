package cn.zq.service;

import cn.zq.common.pojo.PageData;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface NewsService {

    PageInfo<PageData> getNewsContent(int ClassID);

    List<PageData> getNewsTitle(int ClassID);
}

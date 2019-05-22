package cn.zq.dao.util;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

    /**
     * 获取当前数据源连接
     * @return
     */
    @Override
    protected Object determineCurrentLookupKey() {
        System.out.println("当前数据库："+DataSourceHolder.getDataSources());
        return DataSourceHolder.getDataSources();
    }
}

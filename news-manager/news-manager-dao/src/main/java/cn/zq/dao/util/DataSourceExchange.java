package cn.zq.dao.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class DataSourceExchange {

    public void before(JoinPoint point) { //获取目标对象的类类型
        Class<?> aClass = point.getTarget().getClass();
        String c = aClass.getName();
        String[] ss = c.split("\\."); //获取包名用于区分不同数据源

        String packageName = ss[2];
        if ("product".equals(packageName)) {
            DataSourceHolder.setDataSources(DataSourceEnum.DS2.getKey());
            System.out.println("数据源：" + DataSourceEnum.DS2.getKey());
        } else {
            DataSourceHolder.setDataSources(DataSourceEnum.DS1.getKey());
            System.out.println("数据源：" + DataSourceEnum.DS1.getKey());
        }
    }

    /**
     * 执行后将数据源置为空
     */
    public void after() {
        DataSourceHolder.setDataSources(null);
    }

}

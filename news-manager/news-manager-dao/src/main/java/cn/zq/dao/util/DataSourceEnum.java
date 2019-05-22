package cn.zq.dao.util;

public enum DataSourceEnum {

    /**
     * ds1 测试
     * ds2 智奇新闻
     * ds3 OA
     * ds4 dszq
     */
    DS1("ds1"),DS2("ds2"),DS3("ds3"),DS4("ds4");
    private String key;

    DataSourceEnum(String key) {this.key=key;}

    public String getKey(){return key;}
    public void setKey(String key){this.key=key;}
}

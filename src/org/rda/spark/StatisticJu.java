package org.rda.spark;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.Properties;

public class StatisticJu {
    public static void main(String[] args){
        //初始化配置文件和Spark
        System.setProperty("hadoop.home.dir",
                "C:\\Users\\P52\\Downloads\\hadoop-common-2.2.0-bin-master\\hadoop-common-2.2.0-bin-master");
        Properties properties = new Config().getConfig();
        SparkSession spark = SparkSession.builder().appName("Railway Application").master("local[*]").getOrCreate();
        Dataset<Row> data = spark.read().csv("C:\\Users\\P52\\OneDrive\\文档\\铁路数据\\city2324.csv");
        data.show();
        Dataset<Row> cityJu = data.select("_c1", "_c3").dropDuplicates();
        cityJu.show();
        //cityJu.repartition(1).write().csv("C:\\Users\\P52\\OneDrive\\文档\\铁路数据\\cityJu2324.csv");
    }
}

package org.rda.spark;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.Properties;

/**
 * Created by pi on 18-5-28.
 * 读取或保存数据库表
 */
public class DataLoader {

    /**
     * 读取数据库表
     * @param ss SparkSession
     * @param url   jdbcurl包含数据库名
     * @param tableName 数据表名
     * @param p 连接属性
     * @return
     */
    public static Dataset<Row> readTable(SparkSession ss, String url, String tableName, Properties p){
       return ss.read().jdbc(url, tableName, p);
    }
     public static Dataset<Row> readCsv(SparkSession ss, String path){
         return ss.read().csv(path);
     }

    /**
     * 保存数据库表
     * @param dataset   要保存的Dataset
     * @param url   jdbcurl包含数据库名
     * @param tableName 数据表名
     * @param p 连接属性
     */
    public static void writeTable(Dataset<Row> dataset,String url, String tableName, Properties p){
        dataset.write().mode("overwrite").jdbc(url,tableName, p);
    }
}

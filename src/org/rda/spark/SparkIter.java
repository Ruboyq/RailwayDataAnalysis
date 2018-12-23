package org.rda.spark;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.api.java.function.MapFunction;
import org.apache.spark.sql.*;
import org.apache.spark.sql.functions.*;
import scala.collection.Seq;
import scala.collection.Seq$;
import scala.collection.mutable.StringBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by pi on 18-5-25.
 * 完整测试
 */


public class SparkIter {

    public static void main(String[] args) {
        //初始化配置文件和Spark
        Properties properties = new Config().getConfig();
        SparkSession spark = SparkSession.builder().appName("Railway Application").master("local[*]").getOrCreate();
        CenterPairProcessor centerPairProcessor = new CenterPairProcessor();
        //读取铁路货运数据表
        Dataset<Row> lines = DataLoader
                .readTable(spark, properties.getProperty("url"), properties.getProperty("railwayDataTable"), properties);
        //读取城市数据表
        Dataset<Row> cityInfo = DataLoader
                .readTable(spark, properties.getProperty("url"), properties.getProperty("cityDataTable"), properties);
        //获得所有城市之间的距离
        //Dataset<Row> citiesDataset = new DistanceProcessor().getCityDistance(lines, cityInfo);
        //保存城市之间的距离
//        DataLoader.writeTable(citiesDataset,
//                properties.getProperty("url"),properties.getProperty("distanceTable"), properties);
        //读取城市之间的距离表
        Dataset<Row> citiesDataset = DataLoader
                .readTable(spark, properties.getProperty("url"), properties.getProperty("distanceTable"), properties);
//        //按照距离和吨数过滤中心对
        Dataset<Row> pairs =  new CenterPairProcessor().getCenterPair(lines, citiesDataset,
                Integer.valueOf(properties.getProperty("distance"))
                ,Integer.valueOf(properties.getProperty("ltTons"))
                ,Integer.valueOf(properties.getProperty("gtTons")))
                .orderBy("sumTons");
//        citiesDataset.show();
//        Dataset<Row> dropDulPairs = DataLoader
//                .readTable(spark, properties.getProperty("url"), properties.getProperty("centerPairTable"), properties);
        //去除吨数相同的线路，选择第一条
        Dataset<Row> dropDulPairs = centerPairProcessor.dropDulPairs(pairs);

        //按照设置的距离值过滤
        Dataset<Row> cityGroup = citiesDataset
                .filter(citiesDataset.col("distance").lt(Integer.valueOf(properties.getProperty("distance")))
                        .and(citiesDataset.col("distance").gt(0)));

        //获得城市对的经维度
        Dataset<Row> allGroups = centerPairProcessor
                .getAllGroups(dropDulPairs, cityInfo, cityGroup);

        //获得所有圈内的城市
        Dataset<Row> allGroupCity = allGroups.select("fromCity").union(allGroups.select("toCity")).dropDuplicates()
                .toDF("city")
                .withColumn("color", functions.lit(1));
        Dataset<Row> distinct = allGroups.select("longitude", "latitude").dropDuplicates();

        dropDulPairs.show(100);
        distinct.show(100);
        allGroupCity.show(100);

        //System.out.println(pairs.count()+"/"+dropDulPairs.count()+"/"+distinct.count());
        //写入数据库
//        DataLoader.writeTable(citiesDataset,
//                properties.getProperty("url"),properties.getProperty("distanceTable"), properties);

//        DataLoader.writeTable(dropDulPairs,
//                properties.getProperty("url"),properties.getProperty("centerPairTable"), properties);
//        DataLoader.writeTable(distinct.select("longitude", "latitude"),
//                properties.getProperty("url"),properties.getProperty("districtTable"), properties);
//        DataLoader.writeTable(allGroupCity,
//                properties.getProperty("url"),properties.getProperty("colorTable"), properties);



//        Dataset<Row> citiloglat = cityInfo.select("name","longitude","latitude");
//        Dataset<Row> longlatPairs = pairs.join(citiloglat.toDF("fromCenter", "fromLongitude","fromLatitude"),"fromCenter")
//                .join(citiloglat.toDF("toCenter", "toLongitude","toLatitude"),"toCenter");
//        longlatPairs.show(100);

//        pairs.show();
//        Dataset<Row> filteredPairs = pairs.groupBy("sumTons").count();
//        filteredPairs.show(100);

        //结果写入中心对表
//        DataLoader.writeTable(pairs,
//                properties.getProperty("url"),properties.getProperty("centerPairTable"), properties);

        spark.stop();



        //System.out.println("update test");

//        Properties options = new Properties();
////        String url = "jdbc:mysql://localhost:3306/rda";
//        String url = "jdbc:mysql://172.31.34.183:3306/rda";
//        String railwaydata = "railwaydata";
//        String city = "city";
//        options.put("driver", "com.mysql.jdbc.Driver");
//        options.put("user", "root");
//        options.put("password", "123456");

//        //从数据库读取线路信息
//        Dataset<Row> lines = spark.read().jdbc(properties.getProperty("url"), properties.getProperty("railwayDataTable"), properties);
//        //从数据库读取城市信息
//        Dataset<Row> cityInfo = spark.read().jdbc(properties.getProperty("url"), properties.getProperty("cityDataTable"), properties);
//        //lines.show();

//        //统计线路吨数
//        Dataset<Row> sumTons = lines.groupBy("fromCity", "toCity")
//                .sum("tonnage").toDF("fromCity", "toCity","sum");
//        sumTons.show();
//        cityInfo.show();
//
//        Dataset<Row> fromCities = cityInfo.select("name", "longitude", "latitude")
//                .toDF("fromCenter", "fromLongitude", "fromLatitude");
//        //fromCities.show();
//        Dataset<Row> toCities = fromCities.toDF("toCenter", "toLongitude", "toLatitude");
//        //toCities.show();
//        //获得所有组合情况
//        Dataset<Row> allCenters = fromCities.crossJoin(toCities);
//        //allCenters.show(1000);
//        //计算所有城市之间距离
//        Encoder<CityDistance> citiesEncoder = Encoders.bean(CityDistance.class);
//        Dataset<CityDistance> citiesDataset = allCenters.map(
//                (MapFunction<Row, CityDistance>) row ->{
//                    String fromCity = row.getString(0);
//                    double fromLong = row.getDouble(1);
//                    double fromLat = row.getDouble(2);
//                    String toCity = row.getString(3);
//                    double toLong = row.getDouble(4);
//                    double toLat = row.getDouble(5);
//
//                    CityDistance cityDistance = new CityDistance(fromCity,
//                    toCity, MapUtils.GetDistance(fromLat,fromLong,toLat,toLong));
//                    return cityDistance;
//                },
//                citiesEncoder);
//        citiesDataset.show();
//        citiesDataset.write().mode("overwrite")
//                .jdbc(properties.getProperty("url"),properties.getProperty("distanceTable"), properties);


//        Dataset<Row> sumTons = lines.groupBy("fromCity", "toCity")
//                .sum("tonnage").toDF("fromCity", "toCity","sum");
//        sumTons.show();

//        //按照城市间的距离过滤城市对
//        Dataset<Row> cityGroup = citiesDataset
//                .filter(citiesDataset.col("distance").lt(Integer.valueOf(properties.getProperty("distance")))).orderBy("fromCity");
//        //cityGroup.show();


//        //获得城市群
//        Dataset<Row> fromGroups = cityGroup.select("fromCity", "toCity").toDF("fromCenter", "fromCity");
//        //fromGroups.show();
//        Dataset<Row> toGroups = fromGroups.toDF("toCenter", "toCity");
//        //toGroups.show();
//        //城市群之间所有可能的路线
//        Dataset<Row> allGroupLines = fromGroups.crossJoin(toGroups).select("fromCity", "toCity","fromCenter", "toCenter");
//        allGroupLines.show();
//        //System.out.println("All Group Lines: "+allGroupLines.count());
//        Seq<String> seq = Seq$.MODULE$.empty();
//        seq.addString(new StringBuilder("fromCity"));
//        seq.addString(new StringBuilder("toCity"));
//        Dataset<Row> centerTons = sumTons.join(allGroupLines, "fromCity")
//                .filter(sumTons.col("toCity").equalTo(allGroupLines.col("toCity")))
//                .groupBy("fromCenter", "toCenter").sum("sum").toDF("fromCenter", "toCenter", "sumTons");
//        centerTons.show();
//        Dataset<Row> filteredCenterPairs = centerTons.filter(centerTons.col("sumTons")
//                .gt(Integer.valueOf(properties.getProperty("tons"))));
//        filteredCenterPairs.show();


    }
}


package org.rda.spark;

import org.apache.spark.ml.clustering.KMeansModel;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.RowFactory;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.*;
import static org.apache.spark.sql.functions.*;
import static org.apache.spark.sql.types.DataTypes.*;

import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

/**
 * Created by pi on 18-6-3.
 */
public class SparkKM {

	public boolean optimizeStation(int distance, int tons, String type, int clusterNum) {
		try {
			/*
			 * 距离 int distance = 800000; 吨数（大于） int tons = 100000; 品类 String
			 * type = "17"; 聚类类别数 int clusterNum = 50;
			 */
			// 初始化配置文件和SparkE:\JAVALIB\hadoop-common-2.2.0-bin-master
			Properties properties = new Config().getConfig();
			SparkSession spark = SparkSession.builder().appName("Railway Application").master("local[*]").getOrCreate();
			CenterPairProcessor centerPairProcessor = new CenterPairProcessor();
			// 读取铁路货运数据表
			Dataset<Row> data = DataLoader.readTable(spark, "jdbc:mysql://localhost:3306/rda",
					properties.getProperty("railwayDataTable"), properties);
			// 传入品类id前四位或前两位
			Dataset<Row> lines = data.filter(data.col("productId").startsWith(type));
			// 读取城市数据表
			Dataset<Row> cityInfo = DataLoader.readTable(spark, properties.getProperty("url"),
					properties.getProperty("cityDataTable"), properties);
			// 读取城市之间的距离表
			Dataset<Row> citiesDataset = DataLoader.readTable(spark, properties.getProperty("url"),
					properties.getProperty("distanceTable"), properties);

			KMeansCluster kMeansCluster = new KMeansCluster();
			// 转换经纬度特征为Vector
			Dataset<Row> citydata = kMeansCluster.generateFeature(cityInfo.select("name", "longitude", "latitude"));
			// 训练KMeans模型
			// k=70,Silhouette:0.5309008869196431
			// k=60,Silhouette:0.5524560842832416
			// k=50,Silhouette:0.4961842249413106
			// k=30,Silhouette:0.587926094121242
			// kmeans聚类类别数
			KMeansModel kMeansModel = kMeansCluster.traning(citydata, clusterNum);
			// 取出聚类中心点
			int max = kMeansModel.clusterCenters().length;
			int i = 0;
			List<Row> rows = new LinkedList<>();
			StructType schema = createStructType(new StructField[] { createStructField("id", IntegerType, false),
					createStructField("longitude", DoubleType, false),
					createStructField("latitude", DoubleType, false) });
			while (i < max) {

				rows.add(i, RowFactory.create(i, kMeansModel.clusterCenters()[i].apply(0),
						kMeansModel.clusterCenters()[i].apply(1)));
				i++;
			}
			Dataset<Row> centers = spark.createDataFrame(rows, schema);

			// 获得城市群
			Dataset<Row> kmgroups = kMeansCluster.getKMeansGroup(kMeansModel, citydata);
			// 按照距离过滤中心对，距离固定
			Dataset<Row> clusters = new KMeansCluster().getClusters(kmgroups, citiesDataset, lines, distance);
			// 统计中心对之间的吨数
			Dataset<Row> centerTons = clusters.select("fromCluster", "toCluster", "sum")
					.groupBy("fromCluster", "toCluster").sum("sum").toDF("fromCenter", "toCenter", "sumTons");
			// 传入吨数，大于指定吨数
			Dataset<Row> centerpair = centerTons.filter(centerTons.col("sumTons").gt(tons));
			// 获得剩下的中心对
			Dataset<Row> filteredCenters = centerpair.select("fromCenter").union(centerpair.select("toCenter"))
					.dropDuplicates().toDF("cluster");
			// 中心经纬度
			Dataset<Row> district = centers.join(filteredCenters.toDF("id"), "id").orderBy("id");
			// 城市所属中心
			Dataset<Row> color = filteredCenters.join(kmgroups, "cluster").select("name", "cluster")
					.toDF("city", "color").orderBy("color");
			// 保存结果到数据库
			DataLoader.writeTable(centerpair, properties.getProperty("url"), properties.getProperty("centerPairTable"),
					properties);
			DataLoader.writeTable(district, properties.getProperty("url"), properties.getProperty("districtTable"),
					properties);
			DataLoader.writeTable(color, properties.getProperty("url"), properties.getProperty("colorTable"),
					properties);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}

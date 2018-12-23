package org.rda.spark;
import org.apache.spark.api.java.function.MapFunction;
import org.apache.spark.ml.clustering.KMeansModel;
import org.apache.spark.ml.clustering.KMeans;
import org.apache.spark.ml.evaluation.ClusteringEvaluator;
import org.apache.spark.ml.feature.VectorAssembler;
import org.apache.spark.ml.linalg.DenseVector;
import org.apache.spark.ml.linalg.Vector;
import org.apache.spark.ml.linalg.VectorUDT;
import org.apache.spark.sql.*;
import org.apache.spark.util.SystemClock;

/**
 * Created by pi on 18-6-3.
 */
public class KMeansCluster {

    public Dataset<Row> generateFeature(Dataset<Row> cities){
        VectorAssembler assembler = new VectorAssembler()
                .setInputCols(new String[]{"longitude", "latitude"})
                .setOutputCol("features");
        Dataset<Row> citydata = assembler.transform(cities);
        return citydata;
    }

    public KMeansModel traning(Dataset<Row> citydata, int k){

        //citydata.show();
        // Trains a k-means model.
        KMeans kmeans = new KMeans().setK(k).setSeed(1L);
        System.out.println("!!!!!!!!!!!!!");
        System.out.println(citydata.toString());
        KMeansModel model = kmeans.fit(citydata);
        return model;
    }

    public Dataset<Row> getKMeansGroup(KMeansModel model, Dataset<Row> citydata){
// Make predictions
        Dataset<Row> clusters = model.transform(citydata);
        System.out.println("Silhouette:"+evaluate(clusters));
        return clusters.select("name", "prediction").toDF("name", "cluster");
    }

    public Dataset<Row> getClusters(Dataset<Row> groups, Dataset<Row> citydistance,Dataset<Row> lines, int distance){

        Dataset<Row> sumTons = lines.groupBy("fromCity", "toCity")
                .sum("tonnage").toDF("fromCity", "toCity","sum");


        Dataset<Row> allClusters = groups.crossJoin(groups).toDF("fromCity","fromCluster", "toCity", "toCluster");
        Dataset<Row> distanceFilter = allClusters.filter(allClusters.col("fromCluster").notEqual(allClusters.col("toCluster")))
                .join(citydistance, allClusters.col("fromCity").equalTo(citydistance.col("fromCity"))
                .and(allClusters.col("toCity").equalTo(citydistance.col("toCity"))))
                .filter(citydistance.col("distance").gt(distance))
                .select(allClusters.col("fromCity"),allClusters.col("toCity"),
                        allClusters.col("fromCluster"),allClusters.col("toCluster"), citydistance.col("distance"));
        Dataset<Row> alltons = distanceFilter.join(sumTons, distanceFilter.col("fromCity").equalTo(sumTons.col("fromCity"))
        .and(distanceFilter.col("toCity").equalTo(sumTons.col("toCity"))))
                .select(distanceFilter.col("fromCity"),distanceFilter.col("toCity"),
                        distanceFilter.col("fromCluster"),distanceFilter.col("toCluster"), distanceFilter.col("distance")
                ,sumTons.col("sum"));
        //System.out.println(allClusters.count()+"/"+distanceFilter.count());
        return alltons;
    }

    public double evaluate(Dataset<Row> predictions){
        // Evaluate clustering by computing Silhouette score
        ClusteringEvaluator evaluator = new ClusteringEvaluator();

        double silhouette = evaluator.evaluate(predictions);
        return silhouette;
    }


}

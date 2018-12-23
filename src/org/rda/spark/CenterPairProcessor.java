package org.rda.spark;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.functions;
import scala.collection.Seq;
import scala.collection.Seq$;
import scala.collection.mutable.StringBuilder;

/**
 * Created by pi on 18-5-28.
 */
public class CenterPairProcessor {

    public Dataset<Row> getCenterPair(Dataset<Row> lines, Dataset<Row> citiesDataset, int distance, int ltTons, int gtTons){

        Dataset<Row> sumTons = lines.groupBy("fromCity", "toCity")
                .sum("tonnage").toDF("fromCity", "toCity","sum");
//        sumTons.show();
        //按照城市间的距离过滤城市对
        Dataset<Row> cityGroup = citiesDataset
                .filter(citiesDataset.col("distance").lt(distance));
        //获得城市群
        Dataset<Row> fromGroups = cityGroup.select("fromCity", "toCity").toDF("fromCenter", "fromCity");
        //fromGroups.show();
        Dataset<Row> toGroups = fromGroups.toDF("toCenter", "toCity");
        //toGroups.show();
        //城市群之间所有可能的路线
        Dataset<Row> allGroupLines = fromGroups.crossJoin(toGroups).select("fromCity", "toCity","fromCenter", "toCenter");
//        allGroupLines.show();
        //System.out.println("All Group Lines: "+allGroupLines.count());
//        Seq<String> seq = Seq$.MODULE$.empty();
//        seq.addString(new StringBuilder("fromCity"));
//        seq.addString(new StringBuilder("toCity"));
//        Dataset<Row> centerTons = sumTons.join(allGroupLines, "fromCity")
//                .filter(sumTons.col("toCity").equalTo(allGroupLines.col("toCity")))
//                .groupBy("fromCenter", "toCenter").sum("sum").toDF("fromCenter", "toCenter", "sumTons");
        Dataset<Row> centerTons = sumTons.join(allGroupLines, sumTons.col("fromCity").equalTo(allGroupLines.col("fromCity"))
        .and(sumTons.col("toCity").equalTo(allGroupLines.col("toCity")))).select("fromCenter", "toCenter", "sum")
                .groupBy("fromCenter", "toCenter").sum("sum").toDF("fromCenter", "toCenter", "sumTons");
//        centerTons.show();
        Dataset<Row> filteredCenterPairs = centerTons.filter(centerTons.col("sumTons").lt(ltTons)
                .and(centerTons.col("sumTons").gt(gtTons)));
        return filteredCenterPairs;
    }

    public Dataset<Row> dropDulPairs(Dataset<Row> pairs){
        Dataset<Row> dropDul = pairs.groupBy("fromCenter", "sumTons").agg(functions.first("toCenter"))
                .groupBy("first(toCenter, false)", "sumTons").agg(functions.first("fromCenter"))
                .toDF("toCenter", "sumTons", "fromCenter");
        //dropDul.show();
        Dataset<Row> dropSame =  dropDul.filter(dropDul.col("toCenter").notEqual(dropDul.col("fromCenter")))
                .select("fromCenter", "toCenter", "sumTons");
        //dropSame.show();
        return dropSame;
    }

    /**
     * 获得城市对的经维度
     * @param pairs 城市对
     * @param cities 城市信息
     * @param cityGroup 按照距离过滤后的全国城市对
     * @return
     */
    public Dataset<Row> getAllGroups(Dataset<Row> pairs, Dataset<Row> cities, Dataset<Row> cityGroup){
        Dataset<Row> centers = pairs.select("fromCenter").union(pairs.select("toCenter")).toDF("name");
        Dataset<Row> tmp = centers.join(cities.select("name", "longitude", "latitude"), "name")
                .select("name", "longitude", "latitude").dropDuplicates();
        //获得中心城市周围的城市
        Dataset<Row> allGroups = tmp.toDF("fromCity","longitude", "latitude").join(cityGroup, "fromCity");
        return allGroups;
    }
}

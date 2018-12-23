package org.rda.spark;
import org.apache.spark.api.java.function.MapFunction;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Encoder;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.functions;
import org.apache.spark.sql.Row;

/**
 * Created by pi on 18-5-28.
 */
public class DistanceProcessor {

    public Dataset<Row> getCityDistance(Dataset<Row> lines, Dataset<Row> cityInfo){
        //统计线路吨数
        Dataset<Row> sumTons = lines.groupBy("fromCity", "toCity")
                .sum("tonnage").toDF("fromCity", "toCity","sum");
        //sumTons.show();
        //cityInfo.show();

        Dataset<Row> fromCities = cityInfo.select("name", "longitude", "latitude")
                .toDF("fromCenter", "fromLongitude", "fromLatitude");
        //fromCities.show();
        Dataset<Row> toCities = fromCities.toDF("toCenter", "toLongitude", "toLatitude");
        //toCities.show();
        //获得所有组合情况
        Dataset<Row> allCenters = fromCities.crossJoin(toCities);
        //allCenters.show(1000);
        //计算所有城市之间距离
        Encoder<CityDistance> citiesEncoder = Encoders.bean(CityDistance.class);
        Dataset<CityDistance> citiesDataset = allCenters.map(
                (MapFunction<Row, CityDistance>) row ->{
                    String fromCity = row.getString(0);
                    double fromLong = row.getDouble(1);
                    double fromLat = row.getDouble(2);
                    String toCity = row.getString(3);
                    double toLong = row.getDouble(4);
                    double toLat = row.getDouble(5);

                    CityDistance cityDistance = new CityDistance(fromCity,
                            toCity, MapUtils.GetDistance(fromLat,fromLong,toLat,toLong));
                    return cityDistance;
                },
                citiesEncoder);
        return citiesDataset.toDF();
    }

}

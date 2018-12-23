package org.rda.spark;
import java.io.Serializable;

/**
 * Created by pi on 18-5-28.
 */
public class CityDistance implements Serializable{
    String fromCity;
    String toCity;
    double distance;

    public CityDistance(String fromCity, String toCity, double distance) {
        this.fromCity = fromCity;
        this.toCity = toCity;
        this.distance = distance;
    }

    public String getFromCity() {
        return fromCity;
    }

    public void setFromCity(String fromCity) {
        this.fromCity = fromCity;
    }

    public String getToCity() {
        return toCity;
    }

    public void setToCity(String toCity) {
        this.toCity = toCity;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }
}
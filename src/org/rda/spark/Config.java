package org.rda.spark;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * Created by pi on 18-5-28.
 */
public class Config {

    public Properties getConfig(){
        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("config.properties");
        Properties p = new Properties();
        try {
            p.load(new BufferedReader(new InputStreamReader(inputStream)));
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return p;
    }
}

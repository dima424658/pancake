import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {

        JsonObject g=new JsonObject();
        Gson gson=new Gson();
        String stringJson="{\n" +
                "  \"res\": \"ChekLogin\",\n" +
                "  \"login\": \"+79188295987\"\n" +
                "}";
        //получаю Json в строку stringJson

        while(){
            g=gson.fromJson(stringJson,JsonObject.class);
            String s=g.get("res").toString();
            switch (s){
                case "\"ChekLogin\"":
                    ChekLogin(s);

            }
        }

    }
    private static void ChekLogin(String s) {
        double x=-1;

        System.out.println(s);
        if(s.equalsIgnoreCase("\"ChekLogin\"")){
            // генерирую код ответа
            x = (Math.random() *10000+10000) % 99999;}
        System.out.println((int)x);
        //отправляю "x" на сервер

    }
}

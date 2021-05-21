import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    private static int kodProverki = -1;

    public static void main(String[] args) {
       /*
        JNITest t=new JNITest();
        t.printHelloWorld();
        */
        JsonObject g = new JsonObject();
        Gson gson = new Gson();
        String stringJson = "{\n" +
                "  \"req\": \"DBdataUser\",\n" +
                "  \"name\": \"Tamik\",\n" +
                "  \"lastName\": \"Kozhiev\",\n" +
                "  \"mail\": \"tkozhiev@gmail.com\",\n" +
                "  \"phone\": \"+7918829588\"\n" +
                "}";
        //получаю Json в строку stringJson

        // while () {
        g = gson.fromJson(stringJson, JsonObject.class);
        String s = g.get("req").toString();
        switch (s) {
            case "\"ChekPhoneUser\"":
                ChekLoginUser(stringJson, g, gson);
                break;
            case "\"ChekKodUser\"":
                ChekKodUser(stringJson, g, gson);
                break;
            case "\"DBdataUser\"":
                DBdataUser(stringJson, gson);
                break;
            case "DBdataAdmin":
                DBdataAdmin(stringJson, gson);
                break;
            case "\"ChekPhoneAdmin\"":
                ChekLoginAdmin(stringJson, g, gson);
                break;
            case "\"ChekKodAdmin\"":
                ChekKodAdmin(stringJson, g, gson);
                break;
        }

    }
    //}

    private static void DBdataUser(String stringJson, Gson gson) {
        ResUser ru = gson.fromJson(stringJson, ResUser.class);
        //вызываю метод куда передаю данные пользователя

    }

    private static void ChekLoginUser(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringPhone = g.get("phone").toString();
        //отправляю в бд проверить есть такой или нет
        /* если есть

        g.addProperty("res","phoneInDB");
        String ansss=gson.toJson(g);

         */
        /* если нет
         g.addProperty("res","phoneNotInDB");
        String ansss=gson.toJson(g);
         */

        kodProverki = ((int) (Math.random() * 10000) + 10000) % 99999;
        System.out.println(kodProverki);
        //отправляю "x" на сервер

    }

    private static void ChekKodUser(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringKod = g.get("kodUser").toString();
        String ansString = stringKod.substring(1, stringKod.length() - 1);
        int ansKod = Integer.parseInt(ansString);
        if (kodProverki == ansKod) {
            Response ansJson = new Response();
            ansJson.res = "Верно";
            String resJson = gson.toJson(ansJson);
            System.out.println(resJson);
        } else {
            Response ansJson = new Response();
            ansJson.res = "Неверно";
            String resJson = gson.toJson(ansJson);
            System.out.println(resJson);
        }
    }

    private static void DBdataAdmin(String stringJson, Gson gson) {
        ReqAdmin ra = gson.fromJson(stringJson, ReqAdmin.class);
        //вызываю метод куда передаю данные админа

    }

    private static void ChekLoginAdmin(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringPhone = g.get("phone").toString();
        //отправляю в бд проверить есть такой или нет
        /* если есть

        g.addProperty("res","phoneInDB");
        String ansss=gson.toJson(g);

         */
        /* если нет
         g.addProperty("res","phoneNotInDB");
        String ansss=gson.toJson(g);
         */

        kodProverki = ((int) (Math.random() * 10000) + 10000) % 99999;
        System.out.println(kodProverki);
        //отправляю "x" на сервер

    }

    private static void ChekKodAdmin(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringKod = g.get("kodAdmin").toString();
        String ansString = stringKod.substring(1, stringKod.length() - 1);
        int ansKod = Integer.parseInt(ansString);
        if (kodProverki == ansKod) {
            Response ansJson = new Response();
            ansJson.res = "Верно";
            String resJson = gson.toJson(ansJson);
            System.out.println(resJson);
        } else {
            Response ansJson = new Response();
            ansJson.res = "Неверно";
            String resJson = gson.toJson(ansJson);
            System.out.println(resJson);
        }
    }
}

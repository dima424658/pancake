import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class Main {
    private static int kodProverki = -1;

    public static void main(String[] args) {
       /*
        JNIShugar t=new JNIShugar();
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

       /*  BookingForUser pp = new BookingForUser();
        pp.adresBroni = "hui";
        pp.nameCompany = "chlen";
        pp.phone = "+79888788998";
        pp.timeBroni = "17:30";
        pp.typeInventory = "Velosiped";
        String test = gson.toJson(pp);
        System.out.println(test);

        */
        g = gson.fromJson(stringJson, JsonObject.class);
        String s = g.get("req").toString();
        switch (s) {
            case "\"ChekPhoneUser\"":
                ChekPhoneUser(stringJson, g, gson);
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
                ChekPhoneAdmin(stringJson, g, gson);
                break;
            case "\"ChekKodAdmin\"":
                ChekKodAdmin(stringJson, g, gson);
                break;
            case "\"AddNewPoint\"":
                AddNewPoint(stringJson, gson);
                break;
            case "\"BookingForUser\"":
                BookingForUser(stringJson, gson);
                break;
            case "\"AddNewInventoryForAdmin\"":
                AddNewInventoryForAdmin(stringJson, g, gson);
                break;
        }

    }


    private static void DBdataUser(String stringJson, Gson gson) {
        ResUser ru = gson.fromJson(stringJson, ResUser.class);
        //вызываю метод куда передаю данные пользователя
        try {
            ResUser.jniSugar.CreateUser(ru.name, ru.lastName, ru.mail, ru.phone);
            Response re = new Response();
            re.res = "DataUserAcceptet";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        } catch (Throwable e) {
            Response re = new Response();
            re.res = "DataUserNoAcceptet";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        }
    }

    private static void ChekPhoneUser(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringPhone = g.get("phone").toString();
        //отправляю в бд проверить есть такой или нет

        try {

            if (ResUser.jniSugar.ChekUserPhone(stringPhone)) {
                g.addProperty("res", "phoneInDB");
                String ansss = gson.toJson(g);
            } else {
                g.addProperty("res", "phoneNotInDB");
                String ansss = gson.toJson(g);
            }
            kodProverki = ((int) (Math.random() * 10000) + 10000) % 99999;
            System.out.println(kodProverki);
            //отправляю "kodProverki" на сервер
            ResUser.jniSugar.SendVerPhone(stringPhone, kodProverki);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "ProblemWithKod";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        }

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
        try {
            ResUser.jniSugar.CreateAdmin(ra.name, ra.lastName, ra.mail, ra.phone, ra.nameFirm);
            Response re = new Response();
            re.res = "DataAdminAcceptet";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "DataAdminNoAcceptet";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        }


    }

    private static void ChekPhoneAdmin(String stringJson, JsonObject g, Gson gson) {
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringPhone = g.get("phone").toString();
        //отправляю в бд проверить есть такой или нет
        try {

            if (ResUser.jniSugar.ChekAdminPhone(stringPhone)) {
                g.addProperty("res", "phoneInDB");
                String ansss = gson.toJson(g);
            } else {
                g.addProperty("res", "phoneNotInDB");
                String ansss = gson.toJson(g);
            }
            kodProverki = ((int) (Math.random() * 10000) + 10000) % 99999;
            System.out.println(kodProverki);
            //отправляю "kodProverki" на сервер
            ResUser.jniSugar.SendVerPhone(stringPhone, kodProverki);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "ProblemWithKod";
            String ansss = gson.toJson(re);
            //System.out.println(ansss);
        }
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

    private static void AddNewPoint(String stringJson, Gson gson) {

        AdminPointProkat adminPointProkat = gson.fromJson(stringJson, AdminPointProkat.class);
        //вызываю метод куда передаю данные точки проката админа через класс
        try {
            ResUser.jniSugar.SetNewPointInfo(adminPointProkat.nameCompany, adminPointProkat.latitude, adminPointProkat.longitude,
                    adminPointProkat.timeOpen, adminPointProkat.timeClose);
            Response re = new Response();
            re.res = "DataAdminPointProkatAcceptet";
            String ansss = gson.toJson(re);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "DataAdminPointProkatNoAcceptet";
            String ansss = gson.toJson(re);
        }

    }

    private static void BookingForUser(String stringJson, Gson gson) {
        BookingForUser bookingForUser = gson.fromJson(stringJson, BookingForUser.class);
        //вызываю метод куда передаю данные о брони
        try {
            ResUser.jniSugar.SetBookingInfo(bookingForUser.phone, bookingForUser.latitude, bookingForUser.longitude, bookingForUser.nameCompany,
                    bookingForUser.typeInventory, bookingForUser.timeBroni);
            Response re = new Response();
            re.res = "BookingWasSuccessful";
            String ansss = gson.toJson(re);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "BookingWasNotSuccessful";
            String ansss = gson.toJson(re);
        }
    }

    private static void AddNewInventoryForAdmin(String stringJson, JsonObject g, Gson gson) {
        AddNewInventory addNewInventory = gson.fromJson(stringJson, AddNewInventory.class);
        g = gson.fromJson(stringJson, JsonObject.class);
        String stringKod = g.get("count").toString();
        String ansString = stringKod.substring(1, stringKod.length() - 1);
        int countInventory = Integer.parseInt(ansString);
        //System.out.println(countInventory);
//отправляю инфу в бд

        try {
            ResUser.jniSugar.SetNewInventoryInfo(addNewInventory.latitude, addNewInventory.longitude, addNewInventory.typeInventory,
                    addNewInventory.season, countInventory);
            Response re = new Response();
            re.res = "AddNewInventoryWasSuccessful";
            String ansss = gson.toJson(re);
        } catch (Exception e) {
            Response re = new Response();
            re.res = "AddNewInventoryWasNotSuccessful";
            String ansss = gson.toJson(re);
        }

    }
}

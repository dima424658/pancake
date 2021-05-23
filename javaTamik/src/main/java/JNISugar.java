public class JNISugar {
    static {
        System.loadLibrary("Sugar");
    }

    native void Start();

    native void Stop();

    native void Wait();

    native void CreateUser(String name, String lastName, String mail, String phone, String authKey);
    native void CreateAdmin(String name, String lastName, String mail, String phone, String authKey, String nameFirm);

    native boolean CheckUserPhone(String phone);//done

    native boolean CheckAdminPhone(String phone);//done

    native void SetUserAuthKey(String phone, String authKey); //done

    native void SetAdminAuthKey(String phone, String authKey);//done

    native void SetNewPointInfo(String nameCompany, String latitude, String longitude, String timeOpen, String timeClose);

    native void SetNewInventoryInfo(String latitude, String longitude, String typeInventory, String season, int count);

    native void SetBookingInfo(String phone, String latitude, String longitude,
                               String typeInventory, String timeBroni);

    native String CheckUserAuthKey(String authKey);//done

    native String CheckAdminAuthKey(String authKey);//done

    native void AddNewEventInDB(String latitude, String longitude, String nameEvent, String maxCount, String desc, String dateStart);

    native String GetShortRentalHistoryForUser(String authKey);

    native String GetEventForUser();

    native String GetAllStatistics();

    native void SendVerPhone(String phone, int verKod);


}

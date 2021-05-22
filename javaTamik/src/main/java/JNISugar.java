public class JNISugar {
    static {
        System.loadLibrary("server");
    }
    native void Start();
    native void Stop();
    native void Wait();
    static String callback(String req){

        return Main.callback(req);
    }
    native void CreateUser(String name, String lastName, String mail, String phone);
    native void CreateAdmin(String name, String lastName, String mail, String phone, String nameFirm);


   // native void CreateUser(String name, String lastName, String mail, String phone);

   // native void CreateAdmin(String name, String lastName, String mail, String phone, String nameFirm);

    native boolean ChekUserPhone(String phone);

    native void SendVerPhone(String phone, int verKod);

    native boolean ChekAdminPhone(String phone);

    native void SetNewPointInfo(String nameCompany,String latitude,String longitude,String timeOpen,String timeClose);

    native void SetNewInventoryInfo(String latitude,String longitude,String typeInventory,String season,int count);

    native void SetBookingInfo( String phone,String latitude,String longitude,String nameCompany,
                                     String typeInventory,String timeBroni);



}

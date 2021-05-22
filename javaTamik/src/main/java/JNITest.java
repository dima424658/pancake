public class JNITest {
    static {
        System.loadLibrary("server_d");
    }

    native void printHelloWorld();

    native void SetDataUser(String name, String lastName, String mail, String phone);

    native boolean ChekUserPhone(String phone);

    native void SendVerPhone(String phone, int verKod);

    native void SetDataAdmin(String name, String lastName, String mail, String phone, String nameFirm);

    native boolean ChekAdminPhone(String phone);

    native void SetNewPointInfo(String nameCompany,String latitude,String longitude,String timeOpen,String timeClose);

    native void SetNewInventoryInfo(String latitude,String longitude,String typeInventory,String season,int count);

    native void SetBookingInfo( String phone,String latitude,String longitude,String nameCompany,
                                     String typeInventory,String timeBroni);

}

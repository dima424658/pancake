public class ResUser extends Response {
    static JNISugar jniSugar=new JNISugar();
    String name;
    String lastName;
    String mail;
    String phone;
    String authKey;
    void Info(){
        System.out.println(name+" "+lastName+" "+mail+" "+phone);
    }
}

public class ResUser extends Response {
    static JNISugar jniSugar=new JNISugar();
    String name;
    String lastName;
    String mail;
    String phone;
    void Info(){
        System.out.println(name+" "+lastName+" "+mail+" "+phone);
    }
}

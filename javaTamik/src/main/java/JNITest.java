public class JNITest {
    static {
        System.loadLibrary("server_d");
    }

    native void printHelloWorld();
}

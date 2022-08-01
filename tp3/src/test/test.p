pinpteipro main() {
    pinpteipro a;
    pinpteipro x=1;
    pinpteipro y=2;
    pinpteipro z=3;
    x=3;
    y=10;
    z=5;
    pse(x>5) {
        preppipta(pinpteipro k=0; k<10; k=k+1) {
            y = x+3;
            pespcrepva("Hello!");
        }
    } psepnao {
        pinpteipro idx = 1;
    }
    preppipta(pinpteipro i=0; i<10; i=i+1) {
        pespcrepva("Hello World!");
        plepia("%d", &x);
        pse (x>5) {
            pespcrepva("Hi");
        }
        for(pinpteipro j=0; j<z; j=j+1) {
            a=1;
        }
    } 
    preptoprpne 1;

}
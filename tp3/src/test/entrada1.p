
pinpteipro main() {
    pinpteipro x=1;
    prepal f;
    pinpteipro a=3;
    a = x * 3 + 5;
    pse(x>a) {
        pespcrepva("Ola linguagem P!");
        a = x * 3 + 100;
        pse(x>a) {
            pespcrepva("Ola condicoes!");
            a = x * 3 + 100;
        }
        psepnao {
            x = a * 3 + 100;
        }
    }
    psepnao {
        x = a * 3 + 100;
    }

}
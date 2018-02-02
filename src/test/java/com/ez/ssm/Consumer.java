package com.ez.ssm;

import java.util.Date;
import java.util.Vector;

/*消费者 */
public   class Consumer implements Runnable {
    private Vector obj;
    public Consumer(Vector v) {
        this.obj = v;
    }
    public void run() {
        synchronized (obj) {
            while (true) {
                try {
                    if (obj.size() == 0) {
                        obj.wait();
                    }
                    System.out.println(new Date()+"消费者：我要买面包。");
                    System.out.println("面包数： " + obj.size());
                    obj.clear();
                    obj.notify();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

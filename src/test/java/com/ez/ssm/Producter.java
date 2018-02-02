package com.ez.ssm;

import java.util.Date;
import java.util.Vector;

/* 生产者 */
public class Producter implements Runnable {
    private Vector obj;
    public Producter(Vector v) {
        this.obj = v;
    }
    public void run() {
        synchronized (obj) {
            while (true) {
                try {
                    if (obj.size() != 0) {
                        obj.wait();
                    }
                    obj.add(new String("面包"));
                    obj.notify();
                    System.out.println(new Date()+"生产者：面包做好了。");
                    Thread.sleep(500);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
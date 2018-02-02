package com.ez.ssm;

import java.util.Vector;

public class Thred {
    //测试wait（）和notify（）方法
//用生产者和消费者模式模拟这一过程


    public static void main(String[] args) {
        //测试wait（）和notify（）
        Vector obj = new Vector();
        Thread consumer = new Thread(new Consumer(obj));
        Thread producter = new Thread(new Producter(obj));
        consumer.start();
        producter.start();
    }
}

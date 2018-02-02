package com.ez.commons.designpatten;

/**
 *
 * @author by chenez
 * @datetime 2018/1/8 17:02
 * @description 单例模式 http://blog.csdn.net/jason0539/article/details/23297037/
 *
 */
public class Singleton {

    //Singleton通过将构造方法限定为private避免了类在外部被实例化，
    //在同一个虚拟机范围内，Singleton的唯一实例只能通过getInstance()方法访问。
    //（事实上，通过Java反射机制是能够实例化构造方法为private的类的，那基本上会使所有的Java单例实现失效。此问题在此处不做讨论，姑且掩耳盗铃地认为反射机制不存在。）
    private Singleton (){}

    private static Singleton singleton;
    private static Singleton getInstance(){
        if (singleton == null){
            singleton=new Singleton();
        }
        return singleton;
    }
}

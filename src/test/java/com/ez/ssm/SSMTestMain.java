package com.ez.ssm;

import com.ez.commons.json.Entity;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Created by chenez on 2017/2/27.
 */
public class SSMTestMain {

    public static void main(String[] args) throws Exception{
        /*1、json转换*/
/*        Student stu=new Student();
        stu.setName("JSON");
        stu.setAge("23");
        stu.setAddress("北京市西城区");

        //1、使用JSONObject
        JSONObject json = JSONObject.fromObject(stu);
        //2、使用JSONArray
        JSONArray array=JSONArray.fromObject(stu);

        String strJson=json.toString();
        String strArray=array.toString();
        System.out.println("strArray = " + strArray);
        System.out.println("strJson = " + strJson);*/

        /*2、java反射*/
        //获取类
/*        Class c = Class.forName("Student");
        //获取id属性
        Field idF = c.getDeclaredField("age");
        //实例化这个类赋给o
        Object o = c.newInstance();
        //打破封装
        idF.setAccessible(true); //使用反射机制可以打破封装性，导致了java对象的属性不安全。
        //给o对象的id属性赋值"110"
        idF.set(o, "110"); //set
        //get
        System.out.println(idF.get(o));
        */
        /*3、替换反斜杠*/
        String s =  "2016\\07\\520942006536.PDF";
        System.out.println("s = " + s);

        //s=s.replace("\\", "\\\\\\");
        System.out.println("s = " + s);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("s",s);
        System.out.println("jsonObject = " + jsonObject);
        System.out.println("jsonObject.toString() = " + jsonObject.toString());
        String ss=jsonObject.getString("s");
        System.out.println("ss = " + ss);

        //把s中的反斜杠\ 替换为\\
        /*System.out.println(s.replaceAll("\\\\", "\\\\\\\\\\\\"));
        System.out.println(s.replace("\\", "\\\\\\"));
*/

    }
    public static class Student{
        private  String name;
        private String age;
        private  String address;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getAge() {
            return age;
        }

        public void setAge(String age) {
            this.age = age;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }
    }

}

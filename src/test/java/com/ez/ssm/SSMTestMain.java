package com.ez.ssm;

import com.ez.commons.json.Entity;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenez on 2017/2/27.
 */
public class SSMTestMain {

    public static void main(String[] args) throws Exception{
        /*1、json转换*/
        Student stu=new Student();
        Student stu1=new Student();
        stu.setName("zhangsan");
        stu.setAge("23");
        stu.setAddress("北京市西城区");
        stu1.setName("lisi");
        stu1.setAge("24");
        stu1.setAddress("南京市浦口区");

        School school=new School();
        school.setNAME("张八岭中学");
        school.setAGE("90年历史");
        school.setADDRESS("安徽省明光市张八岭镇");

        Map<String,Student> map=new HashMap<String,Student>();
        map.put("zhangsan",stu);
        map.put("lisi",stu1);


        //net.sf.json.JSONObject
        //1、使用JSONObject转对象
        JSONObject jsonBean = JSONObject.fromObject(stu);
        //2、使用JSONArray
        JSONArray arrayBean=JSONArray.fromObject(stu);
        //3、使用JSONObject转map
        JSONObject jsonMap = JSONObject.fromObject(map);
        //4、创建新的jsonobject对象
        JSONObject jsonNew=new JSONObject();
        jsonNew.put("stu",stu);
        jsonNew.put("jsonmap",jsonMap);
        jsonNew.put("school",school);

        //com.alibaba.fastjson.JSONObject(json直接put的java bean对象)
        com.alibaba.fastjson.JSONObject fastjson=new com.alibaba.fastjson.JSONObject();
        fastjson.put("school",school);

        System.out.println("jsonBean = " + jsonBean);
        System.out.println("arrayBean = " + arrayBean);
        System.out.println("jsonMap = " + jsonMap);
        System.out.println("jsonNew = " + jsonNew);
        System.out.println("fastjson = " + fastjson);


        /*2、java反射*/
        //获取类
        /*Class c = Class.forName("Student");
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
        /*String s =  "2016\\07\\520942006536.PDF";
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
        System.out.println(s.replaceAll("\\\\", "\\\\\\\\\\\\"));
        System.out.println(s.replace("\\", "\\\\\\"));*/


    }
    public static class School{
        private String NAME;
        private String AGE;
        private String ADDRESS;

        public String getNAME() {
            return NAME;
        }

        public void setNAME(String NAME) {
            this.NAME = NAME;
        }

        public String getAGE() {
            return AGE;
        }

        public void setAGE(String AGE) {
            this.AGE = AGE;
        }

        public String getADDRESS() {
            return ADDRESS;
        }

        public void setADDRESS(String ADDRESS) {
            this.ADDRESS = ADDRESS;
        }
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

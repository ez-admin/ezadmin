package com.ez.util;

/**
 * @author chenze 787818013@qq.com
 * @version V1.0
 * @Title: MonthToDate
 * @Package com.mf.util
 * @Description: ${DOTO} (通过月份计算出月底最后一天)
 * @date 2016/3/3
 *
 */
public class MonthToDate {
    //method1通过当前的会计周期年和月 计算当前的会计周期的月份的开始日期和结束日期
    public static StartEndDate monthtodate(String month,String year){
        int monthnum=Integer.parseInt(month);

        String monthlastdate=null;//最后一天
        String months=null;//月份（两位小数）
        //判断最后一天
        if(monthnum==1 || monthnum==3 || monthnum==5 || monthnum==7 || monthnum==8 || monthnum==10 || monthnum==12){
            monthlastdate="31";
        }else if(monthnum==2){
            monthlastdate="28";
        }else {
            monthlastdate="30";
        }
        //将月份转为两位数
        if(monthnum<10){
            months="0"+monthnum;
        }else{
            months=month;
        }
        String datebegin=year+months+"01";
        String datend=year+months+monthlastdate;

        StartEndDate startenddate=new StartEndDate();
        startenddate.setDatebegin(datebegin);//赋值月初时间
        startenddate.setDatend(datend);//赋值月末时间
        return startenddate;
    }
    //method2通过当前的会计周期年和月 显示当前的的时间（格式yyyydd）
    public static String yearmonth(String month,String year){
        int monthnum=Integer.parseInt(month);
        String months=null;
        //将月份转为两位数
        if(monthnum<10){
            months="0"+monthnum;
        }else{
            months=month;
        }
        String yearmonth=year+months;
        return yearmonth;
    }
    //method2通过当前的会计周期年和月 计算大一个月的会计周期
    public static String monthplusone(String month,String year){
        int monthnum=Integer.parseInt(month);
        int yearnum=Integer.parseInt(year);
        String months=null;
        String years=null;
        //将月份转为两位数
        if(monthnum==12) {
            months = "01";
            years = String.valueOf( yearnum + 1 );
        }else if(monthnum<10){
            months="0"+String.valueOf( monthnum + 1 );
            years=String.valueOf( yearnum );
        }else {
            months=String.valueOf( monthnum + 1 );
            years=String.valueOf( yearnum );
        }
        String yearmonth=years+months;
        return yearmonth;
    }

}
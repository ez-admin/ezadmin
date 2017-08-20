package com.ez.commons.scheduled;

import com.ez.modules.system.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/5/6.
 */
@Component
public class Syslogdeletetask {
    @Autowired
    private SysLogService sysLogService;

    /**
     * 定时任务 删除 3个月前的操作日志记录
     */
    public void deletelog(){
        Date dNow = new Date();   //当前时间
        Date dBefore = new Date();
        Calendar calendar = Calendar.getInstance(); //得到日历
        calendar.setTime(new Date());//把当前时间赋给日历
        calendar.add(calendar.MONTH, -3);  //设置为前3月
        Date threeMonthBeforeDate = calendar.getTime();   //得到前3月的时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //设置时间格式
        String threeMonthBefore = sdf.format(threeMonthBeforeDate);    //格式化前3月的时间
        sysLogService.deleteThreeMonthBefore(threeMonthBefore);
    }
}

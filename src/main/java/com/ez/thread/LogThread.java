package com.ez.thread;

import com.ez.system.dao.SysLogDao;
import com.ez.system.entity.SysLog;
import com.ez.util.SpringBeanUtil;

/**
 * Created by chenez on 2017/2/28.
 */
public class LogThread implements Runnable{

    private SysLog sysLog;

    public LogThread (SysLog sysLog){
        this.sysLog=sysLog;
    }
    //通过springBean工具注入
    private SysLogDao sysLogDao= SpringBeanUtil.getBean(SysLogDao.class);

    @Override
    public void run() {
        if (sysLog!=null){
            try {
                Thread.sleep(10000);//线程延迟
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            sysLogDao.add(sysLog);
        }
    }
}

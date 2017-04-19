package com.ez.annotation;


import com.ez.system.entity.SysLog;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysLogService;
import com.ez.util.FormatDateUtil;
import com.ez.util.PubConstants;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * @author chenez
 * @since 2017/2/26 22:39.
 * @version 1.0
 */

@Aspect
@Component
public  class SystemLogAspect {
    //注入Service用于把日志保存数据库
    @Resource
    private SysLogService syslogService;

    //本地异常日志记录对象
    private  static  final Logger logger = Logger.getLogger(SystemLogAspect.class);

    //Service层切点
    @Pointcut("@annotation(com.ez.annotation.SystemLogService)")
    public  void serviceAspect() {
    }

    //Controller层切点
    @Pointcut("@annotation(com.ez.annotation.SystemLogController)")
    public  void controllerAspect() {
    }

    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public  void doBefore(JoinPoint joinPoint) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //shiro管理的session
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        SysUser sysUser = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);

        //请求的IP
        String ip = request.getRemoteAddr();
        try {
            //*========控制台输出=========*//
            System.out.println("=====前置通知开始=====");
            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            System.out.println("方法描述:" + getControllerMethodDescription(joinPoint));
            //*========数据库日志=========*//
            System.out.println(getControllerMethodDescription(joinPoint).length()+"请求descript:" + getControllerMethodDescription(joinPoint));
            SysLog log = new SysLog();
            log.setMehtoddescription(getControllerMethodDescription(joinPoint));
            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            log.setLogtype(PubConstants.LOGTYPE_NORMAL);
            log.setRequestIp(ip);
            log.setExceptionCode( null);
            log.setExceptionDetail( null);
            log.setParams( null );
            log.setCreateDate(FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss"));
            if(sysUser!=null){
                log.setUserno( sysUser.getUserno() );
                System.out.println("请求人:" + sysUser.getLognm());
                System.out.println("请求IP:" + ip);
            }

            //保存数据库
            syslogService.add(log);
            System.out.println("=====前置通知结束=====");
        }  catch (Exception e) {
            //记录本地异常日志
            e.printStackTrace();
            logger.error("==前置通知异常==");
            logger.error(e.getMessage());
        }
    }

    /**
     * 异常通知 用于拦截service层记录异常日志
     *
     * 由于事务原因，系统在报错是无法时，无法对日志进行保存操作；
     * 解决方案：1、报错日志用log4j保存到text（目前采用） 2、利用动态数据源切换（需要两个数据库）3、分布式开发
     *
     * service层注解未启用；如要启用请在applicationContext.xml开启<aop:aspectj-autoproxy />
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
    public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //shiro管理的session
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        SysUser sysUser = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
        //获取请求ip
        String ip = request.getRemoteAddr();
        //获取用户请求方法的参数并序列化为JSON格式字符串
        String params = "";
        if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {
            for ( int i = 0; i < joinPoint.getArgs().length; i++) {
                String objType=joinPoint.getArgs()[i].getClass().toString();
                if(objType.indexOf("com.")!=-1)//剔除request 和 response 类型参数
                params += objType + ";";
            }
        }
        SysLog log=new SysLog();
        try {
              /*========控制台输出=========*/
            System.out.println("=====异常通知开始=====");
            System.out.println("异常代码:" + e.getClass().getName());
            System.out.println("异常信息:" + e.getMessage());
            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            System.out.println("方法描述:" + getServiceMthodDescription(joinPoint));
            System.out.println("请求IP:" + ip);
            System.out.println("请求参数:" + params);
               /*==========数据库日志=========*/
            String mehtodescription=getServiceMthodDescription(joinPoint);
            String pointway=joinPoint.getSignature().getName();
            String classname=joinPoint.getTarget().getClass().getName();
            if ("add".equals(pointway)){
                mehtodescription="保存"+classname +"异常";
            }

            log.setMehtoddescription(mehtodescription);
            log.setExceptionCode(e.getClass().getName());
            log.setLogtype(PubConstants.LOGTYPE_EXCEPTION);
            log.setExceptionDetail(e.getMessage());
            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            log.setParams(params);
            log.setCreateDate(FormatDateUtil.getFormatDate("yyyy-MM-dd hh:mm:ss"));
            log.setRequestIp(ip);
            if(sysUser!=null){
                System.out.println("请求人:" + sysUser.getLognm());
                log.setUserno(sysUser.getUserno());
            }
            //保存数据库
            syslogService.add(log);
            /*利用线程保存，无法避开事务的问题
            LogThread logThread=new LogThread(log);
            logThread.run();*/
            System.out.println("=====异常通知结束=====");
        }  catch (Exception ex) {
            //记录本地异常日志
            ex.printStackTrace();
            logger.error("==异常通知异常==");
            logger.error(ex.getStackTrace());
        }
         /*==========记录本地异常日志==========*/
        logger.error("\"异常方法:{}异常代码:{}异常信息:{}参数:{}\"");
        logger.error(joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName()+ e.getClass().getName());
        logger.error( e.getMessage());
        logger.error(params);
    }


    /**
     * 获取注解中对方法的描述信息 用于service层注解
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public  static String getServiceMthodDescription(JoinPoint joinPoint)throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods= targetClass.getMethods();
        String description = "";
        for (Method method : methods)
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SystemLogService. class).description();
                    break;
                }
            }
        return description;
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public  static String getControllerMethodDescription(JoinPoint joinPoint)  throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SystemLogController. class).description();
                    break;
                }
            }
        }
        return description;
    }
}

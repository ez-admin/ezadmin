<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--如果在web.xml 不配置首次加载地址，系统会默认去找WEB-INF下index.jsp,如果配置jsp:forward ,首页默认加载action地址--%>
<jsp:forward page="/ez/syslogin/login_toLogin.do" />
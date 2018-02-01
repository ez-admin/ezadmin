package com.ez.commons.util;

import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;

/**
 * @auther chenez
 * @description 接口请求工具
 * @date 2017/9/25  13:52
 */
public class HttpRequestUtil {
    private static final Logger logger = LoggerFactory
            .getLogger(HttpRequestUtil.class);

    /**
     * Post  请求
     * @param url
     * @param map
     * @return
     */
    public static String post(String url,Map<String, String> map){
        try {
            Document doc=Jsoup.connect(url).data(map).timeout(30000).ignoreContentType(true).post();
            if(doc!=null && doc.text()!=null && !"".equals(doc.text())){
                return doc.text();
            }
        } catch (IOException e) {
            logger.info("system request post error exception:{}",e.getMessage());
        }
        return null;
    }


    /**
     * Get 请求
     * @param url
     * @return
     */
    public static String get(String url){
        try {
            Document doc= Jsoup.connect(url).timeout(30000).get();
            if(doc!=null && doc.text()!=null && !"".equals(doc.text())){
                return doc.text();
            }
        } catch (IOException e) {
            logger.info("system request Get error exception:{}",e.getMessage());
        }
        return null;
    }

    /**
     * json请求
     *
     * @param url
     * @param param
     * @return
     */
    public static String httpClientPostByShortTime(String url, String param) {
        logger.info("[api接口]状态:正在请求:{}", url);
        //POST的URL
        HttpPost httppost = new HttpPost(url);

        //json请求头部
        httppost.addHeader(HTTP.CONTENT_TYPE, "application/json");

        logger.info("[api接口]状态:发送接口参数:{}", param);
        //设置编码
        httppost.setEntity(new StringEntity(param, "UTF-8"));
        CloseableHttpResponse response = null;
        CloseableHttpClient httpclient = null;//忽略https 的ssl认证

        try {
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(2000).setConnectionRequestTimeout(2000)
                    .setSocketTimeout(2000).build();
            httppost.setConfig(requestConfig);
            httpclient = HttpClients.createDefault();
            response = httpclient.execute(httppost);
//		    HttpResponse response=new DefaultHttpClient().execute(httppost);
            //发送Post,并返回一个HttpResponse对象
            if (response.getStatusLine().getStatusCode() == 200) {//如果状态码为200,就是正常返回
                String result = EntityUtils.toString(response.getEntity());
                logger.info("[api接口]状态:接收到数据:{}", result);
                return result;
            } else {
                logger.info("[api接口]状态:接口请求异常，请求状态码:{}", response.getStatusLine().getStatusCode());
            }
        } catch (Exception e) {
            logger.error("[api接口]状态:请求异常:{}", e.getMessage());
        } finally {
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e) {
                }
            }

            if (httpclient != null) {
                try {
                    httpclient.close();
                } catch (IOException e) {
                }
            }
        }
        return null;
    }


    /**
     * httpclient https请求
     *
     * @return
     */
    private static CloseableHttpClient createSSLClientDefault() {
        try {
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
                //信任所有
                public boolean isTrusted(X509Certificate[] chain,
                                         String authType) throws CertificateException {
                    return true;
                }
            }).build();
//	    	SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext);
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, new X509HostnameVerifier() {

                @Override
                public boolean verify(String arg0, SSLSession arg1) {
                    return true;
                }

                @Override
                public void verify(String arg0, SSLSocket arg1)
                        throws IOException {
                }
                @Override
                public void verify(String arg0, X509Certificate arg1)
                        throws SSLException {
                }
                @Override
                public void verify(String arg0, String[] arg1,
                                   String[] arg2) throws SSLException {
                }
            });
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (KeyStoreException e) {
            e.printStackTrace();
        }
        return HttpClients.createDefault();
    }


}

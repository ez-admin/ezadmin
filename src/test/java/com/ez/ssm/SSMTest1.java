package com.ez.ssm;

import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.UnsupportedEncodingException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/applicationContext*.xml"})
public class SSMTest1 {
	



	//权限和计算
	@Test
	public void singlon(){
        //json 中含有 unicode码转成中文
        String jsonResult="{\"sex\":-1,\"retMsg\":\"\u8eab\u4efd\u8bc1\u53f7\u7801\u4e0d\u5408\u6cd5!\",\"retData\":[]}";
        JSONObject jsonObject= JSONObject.parseObject(jsonResult);
        String sex= jsonObject.getString("sex");
        System.out.println("sex = " + sex);
        System.out.println("jsonObject = " + jsonObject);

	}

}

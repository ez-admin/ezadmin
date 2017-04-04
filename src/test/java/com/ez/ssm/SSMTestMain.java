package com.ez.ssm;

import com.alibaba.druid.support.json.JSONUtils;

/**
 * Created by chenez on 2017/2/27.
 */
public class SSMTestMain {
    public static void main(String[] args) {
        String a="execution(void com.ez.system.service.impl.SysDictionaryServiceImpl.add(SysDictionary))";
        JSONUtils.toJSONString(a);
    }
}

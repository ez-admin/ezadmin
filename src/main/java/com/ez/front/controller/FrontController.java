package com.ez.front.controller;

import com.ez.annotation.SystemLogController;
import com.ez.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by chenez on 2017/6/30.
 */
@Controller
@RequestMapping(value="/ez/front/")
public class FrontController extends BaseController {
    /**
     * 访问前台首页
     * @return
     */
    @RequestMapping(value="index")
    public String index(Model model){
        return "ez/front/index";
    }
    /**
     * 访问前台详细页
     * @return
     */
    @RequestMapping(value="bigdata")
    public String bigdata(Model model){
        return "ez/front/bigdata";
    }
}

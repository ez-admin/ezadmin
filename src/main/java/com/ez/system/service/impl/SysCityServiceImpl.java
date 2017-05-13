package com.ez.system.service.impl;

import com.ez.base.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.system.entity.*;
import com.ez.system.dao.*;
import com.ez.system.service.*;

/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysCityService")
public class SysCityServiceImpl extends BaseServiceImpl<SysCity> implements SysCityService {
	@Autowired
	private SysCityDao sysCityDao;


}

package com.ez.annotation;

import java.lang.annotation.*;

/**
 *自定义注解
 */
@Target({ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public  @interface ServiceImplClassDescription {
    String description()  default "";
}
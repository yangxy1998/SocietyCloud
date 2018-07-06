package util.annotation;

import java.lang.annotation.*;

/**
 * 属性注解
 *
 * 注明通过Request或Session返回属性的名字是什么
 * 注解格式：@Attribute(id="id",type=Type.class)
 * 使用方法：在jsp文件当中通过jsp标准动作useBean
 * <!--<jsp:useBean id="id" type="Type"/>-->
 * 来使用Type对象。
 *
 * Created by Administrator on 2018/7/5.
 * @author 杨晓宇
 */

@Documented
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)

public @interface Attribute {

    /**
     * Bean当中的id
     * @return 属性名
     */
    String id() default "";

    /**
     * Bean当中的type
     * @return 属性类型
     */
    Class type() default Object.class;

}

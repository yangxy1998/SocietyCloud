package util;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by Administrator on 2018/7/5.
 * @author 杨晓宇
 *
 * 注明请求返回属性的名字是什么
 * 格式：对象类型=属性名
 * 例如：User="user"表示我需要一个属性为user的User对象
 */

@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
public @interface Attribute {

    /**
     * 通过请求Attribute传递的User对象
     * @return User对象的Attribute名
     */
    String User() default "";

    /**
     * 通过请求Attribute传递的社团对象
     * @return 社团对象的Attribute名
     */
    String Society() default "";

}

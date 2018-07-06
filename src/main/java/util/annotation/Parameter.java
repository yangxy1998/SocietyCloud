package util.annotation;

import java.lang.annotation.*;

/**
 *
 * 注明通过Request提供的参数名是什么
 * 注解格式：@Attribute({name1,name2,...})
 * 使用方法：在html或jsp提交的表单中定义其参数
 *     <!--<input type="..." name="name1">-->
 *     <!--<input type="..." name="name2">-->
 *     <!--<input type="..." name="...">-->
 *     <!--<input type="..." name="...">-->
 * 来向servlet传递参数。
 *
 * Created by Administrator on 2018/7/6.
 * @author 杨晓宇
 */

@Documented
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface Parameter {

    /**
     * request中能提供的parameter列表
     * @return parameterNames
     */
    String[] value();

}

package util;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;

/**
 * 联系类
 * 所有联系类的父类，拥有会话绑定监听者，在类型初始化时要做一些处理
 * Created by Administrator on 2018/7/9.
 * @author 杨晓宇
 */
public abstract class Relation {

    /**
     * 根据联系类型，获取指定类型的实体
     * @param entityType 实体类型
     * @return 实体
     */
    public abstract Entity get(@Param("entityType") String entityType);

    public abstract JSONObject getJSONObject();

}

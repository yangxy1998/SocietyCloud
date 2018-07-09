package util;

import javax.servlet.http.HttpSessionBindingListener;
import java.util.List;

/**
 * 联系类
 * 所有联系类的父类，拥有会话绑定监听者，在类型初始化时要做一些处理
 * Created by Administrator on 2018/7/9.
 * @author 杨晓宇
 */
public abstract class Relation implements HttpSessionBindingListener {

    //一个关联所涉及的实体
    private List<Entity> entities;

    /**
     * 加入一个关联
     * @param entity
     */
    public void join(Entity entity){
        entities.add(entity);
    }

    /**
     * 获取关联的所有实体
     * @return 实体
     */
    public List<Entity> getEntities() {
        return entities;
    }

    /**
     * 设置关联应该显示的日志
     * @return 日志内容
     */
    public abstract String getRelationLog();
}

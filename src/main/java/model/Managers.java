package model;
import model.DAO.*;


/**
 *
 *
 * 用于装配所有DAO的管理者集合
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 */


public class Managers {

    //用户管理接口
    public static UserDAO UserManager;

    //社团管理接口
    public static SocietyDAO SocietyManager;

}

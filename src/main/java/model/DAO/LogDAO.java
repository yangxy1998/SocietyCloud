package model.DAO;

import org.apache.ibatis.annotations.Param;
import util.Log;

import java.util.List;

/**
 * Created by Administrator on 2018/7/10.
 */
public interface LogDAO {

    List<Log> getAllLogs();

    List<Log> getErrorLogs();

    List<Log> getUserLogs(@Param("userName") String userName);

    List<Log> getAllUserLogs();

    List<Log> getSocietyLogs(@Param("societyName") String societyName);

    List<Log> getAllSocietyLogs();

    List<Log> getAdminLogs(@Param("adminName") String adminName);

    void addLog(@Param("time") String time,
                @Param("log") String log,
                @Param("type") String type,
                @Param("attribute") String attribute);

}

package model.DAO.entity;

import model.entity.Society;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * Society类的数据访问对象
 * Created by Administrator on 2018/7/5.
 * @see model.entity.Society 社团类
 *
 * @author 杨晓宇
 * @author 程乐
 */

public interface SocietyDAO {

    Society getSocietyById(@Param("societyId") String societyId);

    Society getSocietyByName(@Param("societyName") String societyName);

    void createSociety(@Param("societyId") String societyId,
                       @Param("societyName") String societyName,
                       @Param("schoolName") String schoolName,
                       @Param("mainType") String mainType,
                       @Param("subType") String subType,
                       @Param("foundDate") String foundDate,
                       @Param("founder") String founder);

    void updateSociety(@Param("societyId") String societyId,
                       @Param("societyName") String societyName,
                       @Param("schoolName") String schoolName,
                       @Param("mainType") String mainType,
                       @Param("subType") String subType,
                       @Param("foundDate") String foundDate,
                       @Param("founder") String founder,
                       @Param("status") int status,
                       @Param("description") String description);

    void deleteSociety(@Param("societyId") String societyId);


    List<Society> getAllSocieties();

    List<Society> getMainTypeOfSocieties(@Param("mainType") String mainType);

    List<Society> getSubTypeOfSocieties(@Param("mainType") String mainType,
                                        @Param("subType") String subType);

    List<Society> getSocietiesByKeyword(@Param("keyword") String keyword);

}

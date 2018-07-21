package controller.servlet;


import model.entity.Activity;
import model.entity.Society;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.Log;
import util.function.Pages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Servlet implementation class UploadServlet
 * @author 杨晓宇
 * @author 程乐
 */

public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String SOCIETY_DIRECTORY = "SocietyFiles";
    private static final String ACTIVITY_DIRECTORY="ActivityFiles";

    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String type=request.getParameter("type");
        if(("activity").equals(type)){
            // 检测是否为多媒体上传
            if (!ServletFileUpload.isMultipartContent(request)) {
                // 如果不是则停止
                PrintWriter writer = response.getWriter();
                writer.println("Error: 表单必须包含 enctype=multipart/form-data");
                writer.flush();
                return;
            }

            // 配置上传参数
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            // 设置临时存储目录
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);

            // 设置最大文件上传值
            upload.setFileSizeMax(MAX_FILE_SIZE);

            // 设置最大请求值 (包含文件和表单数据)
            upload.setSizeMax(MAX_REQUEST_SIZE);

            // 中文处理
            upload.setHeaderEncoding("UTF-8");

            HttpSession session = request.getSession();
            Activity activity = (Activity) session.getAttribute("activity");
            String activityId=activity.getActivityId();
            System.out.println("上传照片的activity变量"+activityId);
            try {
                // 解析请求的内容提取文件数据
                @SuppressWarnings("unchecked")
                List<FileItem> formItems = upload.parseRequest(request);

                if (formItems != null && formItems.size() > 0) {
                    // 迭代表单数据
                    for (FileItem item : formItems) {

                        if (item.isFormField()&&((String)item.getFieldName()).equals("activity")) {
                            activityId = item.getString();
                            System.out.println(activityId);
                        }
                    }

                    // 构造临时路径来存储上传的文件
                    // 这个路径相对当前应用的目录

                    String societyPath= InitServlet.outerPath + ACTIVITY_DIRECTORY;
                    String uploadPath =  societyPath + File.separator + activityId;
                    System.out.println("......"+uploadPath);

                    // 如果目录不存在则创建
                    File societyDir=new File(societyPath);
                    if (!societyDir.exists()) {
                        if(!societyDir.mkdir()) Log.addErrorLog("创建文件夹失败。");
                    }
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        if(!uploadDir.mkdir()) Log.addErrorLog("创建文件夹失败。");
                    }
                    for (FileItem item : formItems) {
                        // 处理不在表单中的字段
                        if (!item.isFormField()) {

                            SimpleDateFormat df = new SimpleDateFormat("MM-dd-HH-mm-ss");//设置日期格式
                            String time = df.format(new Date());


                            String fileName = new File(item.getName()).getName();
                            String filePath = uploadPath + File.separator + activityId+".jpg";
                            File storeFile = new File(filePath);
                            // 在控制台输出文件的上传路径
                            System.out.println(filePath);
                            // 保存文件到硬盘
                            item.write(storeFile);
                            session.setAttribute("alert", "文件上传成功！");
                        }
                    }
                }
            } catch (Exception ex) {
                session.setAttribute("alert", "上传失败！");
            }
            response.sendRedirect(Pages.ACTIVITY_MANAGE_PAGE);
        }
        else {
            // 检测是否为多媒体上传
            if (!ServletFileUpload.isMultipartContent(request)) {
                // 如果不是则停止
                PrintWriter writer = response.getWriter();
                writer.println("Error: 表单必须包含 enctype=multipart/form-data");
                writer.flush();
                return;
            }

            // 配置上传参数
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            // 设置临时存储目录
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);

            // 设置最大文件上传值
            upload.setFileSizeMax(MAX_FILE_SIZE);

            // 设置最大请求值 (包含文件和表单数据)
            upload.setSizeMax(MAX_REQUEST_SIZE);

            // 中文处理
            upload.setHeaderEncoding("UTF-8");

            HttpSession session = request.getSession();
            Society society= (Society) session.getAttribute("society");
            String societyId=society.getSocietyId();
            System.out.println("上传照片的society变量"+societyId);
            try {
                // 解析请求的内容提取文件数据
                @SuppressWarnings("unchecked")
                List<FileItem> formItems = upload.parseRequest(request);

                if (formItems != null && formItems.size() > 0) {
                    // 迭代表单数据
                    for (FileItem item : formItems) {

                        if (item.isFormField()&&((String)item.getFieldName()).equals("society")) {
                            societyId = item.getString();
                            System.out.println(societyId);
                        }
                    }

                    // 构造临时路径来存储上传的文件
                    // 这个路径相对当前应用的目录

                    String societyPath= InitServlet.outerPath + SOCIETY_DIRECTORY;
                    String uploadPath =  societyPath + File.separator + societyId;
                    System.out.println("......"+uploadPath);

                    // 如果目录不存在则创建
                    File societyDir=new File(societyPath);
                    if (!societyDir.exists()) {
                        if(!societyDir.mkdir()) Log.addErrorLog("创建文件夹失败。");
                    }
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        if(!uploadDir.mkdir()) Log.addErrorLog("创建文件夹失败。");
                    }
                    for (FileItem item : formItems) {
                        // 处理不在表单中的字段
                        if (!item.isFormField()) {

                            SimpleDateFormat df = new SimpleDateFormat("MM-dd-HH-mm-ss");//设置日期格式
                            String time = df.format(new Date());


                            String fileName = new File(item.getName()).getName();
                            String filePath = uploadPath + File.separator + societyId+".jpg";
                            File storeFile = new File(filePath);
                            // 在控制台输出文件的上传路径
                            System.out.println(filePath);
                            // 保存文件到硬盘
                            item.write(storeFile);
                            session.setAttribute("alert", "文件上传成功！");
                        }
                    }
                }
            } catch (Exception ex) {
                session.setAttribute("alert", "上传失败！");
            }
            response.sendRedirect(Pages.SOCIETY_MANAGE_PAGE);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
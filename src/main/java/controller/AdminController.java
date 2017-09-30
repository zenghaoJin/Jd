package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import po.*;
import service.AdminService;
import service.JedisClient.JedisClient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/push-pseries")
    public String push_pseries() throws Exception {
        return "push-pseries";
    }
    @RequestMapping("/push_pseriesUI")
    public String push_pseriesUI(@RequestParam("ex")MultipartFile ex,
                                 HttpServletRequest request, Model model) throws Exception {
        InputStream is = ex.getInputStream();
        Workbook wb = WorkbookFactory.create(is);
        Sheet sheet = wb.getSheetAt(0);
        //工作行
        Row row ;
        //工作单元格
        Cell cell ;
        //sheet.getLastRowNum()获取行数
        String[] mClass = new String[sheet.getRow(0).getLastCellNum()-1];;
        String[] tClass = new String[sheet.getRow(1).getLastCellNum()-1];
        String[] thClass = new String[sheet.getRow(2).getLastCellNum()-1];
        for(int i=0;i<=sheet.getLastRowNum();i++){
            row= sheet.getRow(i);
            //row.getLastCellNum()获取第i行的列数
            for (int j=1;j<row.getLastCellNum();j++){
                cell= row.getCell(j);
                if(i==0){
                    System.out.println("================1"+cell.toString());
                    mClass[j-1] =cell.toString();
                }else if(i==1){
                    System.out.println("================2"+cell.toString());
                    tClass[j-1] =cell.toString();
                }else{
                    System.out.println("================3"+cell.toString());
                    thClass[j-1] =cell.toString();
                }
            }
        }
        adminService.saveJdclass(mClass,tClass,thClass);
        return "push-pseries";
    }
    @RequestMapping("/add_pseries")
    public String add_pseries(Model model) throws Exception {
        List<JdMclass> s1 = adminService.selectJdMclass();
        int num = adminService.selectZjdMclass();
        model.addAttribute("JdMclass",s1);
        model.addAttribute("num",num);
        return "add-pseries";
    }
    @RequestMapping("/a_login")
    public String a_login(){
        return "a_login";
    }
    @RequestMapping("/a_loginUI")
    public String a_loginUI(HttpSession session, @Validated JdAdmin jdAdmin, BindingResult bindingResult, Model model)throws Exception {
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            return "a_login";
        }
        if(adminService.selectJdAdmin(jdAdmin)>0){
            session.setAttribute("jdAdmin",jdAdmin);
            return "redirect:add_pseries";
        }else{
            model.addAttribute("message2","密码错误");
            model.addAttribute("jdAdmin",jdAdmin);
            return "a_login";
        }
    }
    @RequestMapping("/addJdMclass")
    public void addJdMclass(HttpServletResponse response, JdMclass jdMclass)throws Exception{
        String str = jdMclass.getName();
        String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
        System.out.println("------------------------"+str2);
        int x = adminService.selectJdMclass_name(str2);
        jdMclass.setName(str2);
        String result = null;
        if(x>0){
            result = "{\"name\":\"0\"}";
        }else{
            adminService.addJdMclass(jdMclass);
            if(jedisClient.get("key")!=null){
                jedisClient.decr("key");
            }
            result = "{\"name\":\""+jdMclass.getName()+"\",\"mid\":\""+jdMclass.getMid()+"\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/addJdTwoclass")
    public void addJdTwoclass(HttpServletResponse response, JdTwoclass jdTwoclass)throws Exception{
        String str = jdTwoclass.getName();
        String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
        System.out.println("------------------------"+str2);
        System.out.println("------------------------"+jdTwoclass.getMid());
        System.out.println("------------------------"+jdTwoclass.getTid());
        int x = adminService.selectJdTwoclass_name(jdTwoclass);
        jdTwoclass.setName(str2);
        String result = null;
        if(x>0){
            result = "{\"name\":\"0\"}";
        }else{
            result = "{\"name\":\"1\"}";
            adminService.addJdTwoclass(jdTwoclass);
            if(jedisClient.get("key")!=null){
                jedisClient.decr("key");
            }
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/selectJdTwoclass")
    public void selectJdTwoclass(HttpServletResponse response, String mid)throws Exception{
        List<JdTwoclass> s1 = adminService.selectJdTwoclass(mid);
        String result = null;
        System.out.println("---------------------------"+s1.size());
        if(s1==null||s1.size()==0){
            result = "{\"name\":\"0\"}";
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(result);
        }else{
            JSONArray listArray =JSONArray.fromObject(s1);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(listArray.toString());
        }
    }

    @RequestMapping("/addJdThreeclass")
    public void addJdThreeclass(HttpServletResponse response, JdThreeclass jdThreeclass)throws Exception{
        String str = jdThreeclass.getName();
        String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
        int x = adminService.selectJdThreeclass_name(jdThreeclass);
        jdThreeclass.setName(str2);
        String result = null;
        if(x>0){
            result = "{\"name\":\"0\"}";
        }else{
            result = "{\"name\":\"1\"}";
            adminService.addJdThreeclass(jdThreeclass);
            if(jedisClient.get("key")!=null){
                jedisClient.decr("key");
            }
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }



    @RequestMapping("/selectJdThreeclass")
    public void selectJdThreeclass(HttpServletResponse response, String tid)throws Exception{
        List<JdThreeclass> s1 = adminService.selectJdThreeclass(tid);
        String result = null;
        System.out.println("---------------------------"+s1.size());
        if(s1==null||s1.size()==0){
            result = "{\"name\":\"0\"}";
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(result);
        }else{
            JSONArray listArray =JSONArray.fromObject(s1);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(listArray.toString());
        }
    }
    @RequestMapping("/add-ppseries")
    public String add_ppseries(String thid,Model model) throws Exception {
        PageHelper.startPage(1, 6);
        List<JdProds> s1 = adminService.selectJdProds();
        PageInfo<JdProds> pageInfo = new PageInfo<JdProds>(s1);
        int total = (int) ((pageInfo.getTotal()-1)/6)+1;
        System.out.println("------------------------共有商品信息：" + total);
        model.addAttribute("total",total);//商品属相
        model.addAttribute("thid",thid);//分类id
        model.addAttribute("prods",s1);
        model.addAttribute("page","1");
        return "add-ppseries";
    }
    @RequestMapping("/add-ppseriesUI")
    public String add_ppseriesUI(String thid,String[] proids,Model model) throws Exception {
        for(int i=0;i<proids.length;i++){
            System.out.println(proids[i]);
            adminService.updateJdprods(thid,proids[i]);
        }
        return "redirect:add-ppseries";
    }
    @RequestMapping("/page")
    public void page(HttpServletResponse response,String pagenum) throws Exception {
        System.out.println("--------------------------------------"+pagenum);
        PageHelper.startPage(Integer.parseInt(pagenum), 6);
        List<JdProds> s1 = adminService.selectJdProds();
        PageInfo<JdProds> pageInfo = new PageInfo<JdProds>(s1);
        int total = (int) ((pageInfo.getTotal()-1)/6)+1;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagenum",pagenum);
        map.put("prods",s1);
        map.put("total",total);
        JSONObject json = JSONObject.fromObject(map);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json.toString());
    }

    @RequestMapping("/update-pseries")
    public String update_pseries(Model model) throws Exception {
        List<JdMclass> s1 = adminService.selectJdMclass();
        model.addAttribute("JdMclass",s1);
        return "update-pseries";
    }
    @RequestMapping("/outAdmin")
    public String outAdmin(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("jdAdmin");
        session.invalidate();
        return "a_login";
    }

    @RequestMapping("/updateJdMclass")
    public void updateJdMclass(HttpServletResponse response, JdMclass jdMclass)throws Exception{
        String str = jdMclass.getName();
        String result = null;
        if(str!=null&&!"".equals(str)){
            String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
            System.out.println("--------------------------------------"+str2);
            int x = adminService.selectJdMclass_name(str2);
            if(x>0){
                result = "{\"name\":\"0\"}";
            }else{
                result = "{\"name\":\""+str2+"\",\"mid\":\""+jdMclass.getMid()+"\"}";
                jdMclass.setName(str2);
                adminService.updateJdMclass(jdMclass);
                if(jedisClient.get("key")!=null){
                    jedisClient.decr("key");
                }
            }
        }else{
                result = "{\"mid\":\""+jdMclass.getMid()+"\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/updateJdTwoclass")
    public void updateJdTwoclass(HttpServletResponse response, JdTwoclass jdTwoclass)throws Exception{
        String str = jdTwoclass.getName();
        String result = null;
        if(str!=null&&!"".equals(str)){
            String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
            System.out.println("--------------------------------------"+jdTwoclass.getTid());
            jdTwoclass.setName(str2);
            int x = adminService.selectJdTwoclass_name(jdTwoclass);
            if(x>0){
                result = "{\"name\":\"0\"}";
            }else{
                result = "{\"name\":\""+str2+"\",\"tid\":\""+jdTwoclass.getTid()+"\"}";
                adminService.updateJdTwoclass(jdTwoclass);
                if(jedisClient.get("key")!=null){
                    jedisClient.decr("key");
                }
            }
        }else{
            result = "{\"tid\":\""+jdTwoclass.getTid()+"\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/updateJdThreeclass")
    public void updateJdThreeclass(HttpServletResponse response, JdThreeclass jdThreeclass)throws Exception{
        String str = jdThreeclass.getName();
        String result = null;
        if(str!=null&&!"".equals(str)){
            String str2 = new String(str.getBytes("iso-8859-1"),"utf-8");
            System.out.println("--------------------------------------"+jdThreeclass.getThid());
            jdThreeclass.setName(str2);
            int x = adminService.selectJdThreeclass_name(jdThreeclass);
            if(x>0){
                result = "{\"name\":\"0\"}";
            }else{
                result = "{\"name\":\""+str2+"\",\"thid\":\""+jdThreeclass.getThid()+"\"}";
                adminService.updateJdThreeclass(jdThreeclass);
                if(jedisClient.get("key")!=null){
                    jedisClient.decr("key");
                }
            }
        }else{
            result = "{\"thid\":\""+jdThreeclass.getThid()+"\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

}

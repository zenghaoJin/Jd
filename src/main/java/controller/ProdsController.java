package controller;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import po.JdProdimg;
import po.JdProds;
import po.JdSizes;
import po.JdStores;
import service.ProdsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
@Controller
public class ProdsController {
    @Autowired
    private ProdsService prodsService;
    @RequestMapping("/index")
    public String index(){
        return "add-prod";
    }
    @RequestMapping("/s_login")
    public String s_login(){
        return "s_login";
    }
    @RequestMapping("/addProd")
    public String addProd(){
        return "add-prod";
    }
    @RequestMapping("/addProdUI")
    public String addProdUI(HttpServletRequest request, @Validated JdProds prods, BindingResult bindingResult, String[] size, String[] iname, String[] number, @RequestParam("img")MultipartFile[] img,Model model)throws Exception{
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("prods",prods);
            model.addAttribute("size",size);
            model.addAttribute("iname",iname);
            model.addAttribute("number",number);
            model.addAttribute("img",img);
            return "forward:index";
        }
        prodsService.insertProds(prods);
        int id = prods.getProId();
        for(int i=0;i<iname.length;i++){
            if(iname[i]!=null&&!"".equals(iname[i])&&img[i]!=null){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                String path = request.getServletContext().getRealPath("/upload");//图片路径
                System.out.println("-----------------------------------------------"+path);
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                model.addAttribute("img",imgnewName);
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);

                JdProdimg img1 = new JdProdimg();
                img1.setIname(iname[i]);
                img1.setImg(imgnewName);
                img1.setProId(id);
                prodsService.insertProdimg(img1);
                int ProiId = img1.getPimgId();
                for(int x=0;x<size.length;x++){
                    if (size[x]!=null&&!"".equals(size[x])){
                    JdSizes jdSizes = new JdSizes();
                    jdSizes.setNumber(number[i]);
                    jdSizes.setSize(size[x]);
                    jdSizes.setProiId(ProiId);
                    prodsService.insertSzies(jdSizes);
                }
                }
            }
        }
        model.addAttribute("size",size.length);
        model.addAttribute("iname",iname.length);
        model.addAttribute("number",number.length);
        return "prod";
    }
    @RequestMapping("/s_loginUI")
    public String s_loginUI(HttpServletRequest request, @Validated JdStores jdStores,BindingResult bindingResult,Model model) throws Exception {
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("jdStores",jdStores);
            return "s_login";
        }
        if(prodsService.s_login(jdStores)>0){
            JdStores jdStores1 = prodsService.selectStores(jdStores.getPname());
            System.out.println("----------------------"+jdStores1.getSto_Id());
            System.out.println("----------------------"+jdStores1.getName());
            System.out.println("----------------------"+jdStores1.getPname());
            HttpSession session = request.getSession();
            session.setAttribute("jdStores", jdStores1);
            return "add-prod";
        }else{
            model.addAttribute("jdStores",jdStores);
            model.addAttribute("message2","密码错误");
            return "s_login";
        }
    }
    @RequestMapping("/out")
    public String out(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("jdStores");
        session.invalidate();
        return "s_login";
    }


}

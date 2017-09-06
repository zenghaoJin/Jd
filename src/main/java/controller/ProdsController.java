package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


import javafx.scene.control.Cell;
import net.sf.json.JSONObject;


import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

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
import service.ProdsService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.MessageDigest;
import java.util.*;


import org.apache.poi.ss.usermodel.Row;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
@Controller
public class ProdsController {
    @Autowired
    private ProdsService prodsService;
    @RequestMapping("/s_message")
    public String s_message(int stoid,Model model)throws Exception{
        List<JdMessage> s1 = prodsService.selectMessage(stoid);
        model.addAttribute("JdMessage",s1);
        model.addAttribute("stoid",stoid);
        return "/s_message";
    }
    @RequestMapping("/s_messageUI")
    public String s_messageUI(int uid,int stoid,int mid,String message,Model model)throws Exception{
        JdMessage s2 = new JdMessage();
        s2.setMid(mid);
        s2.setState("1");
        prodsService.updateMessage(s2);
        JdMessage s1 = new JdMessage();
        s1.setMessage(message);
        s1.setUid(uid);
        s1.setStoid(stoid);
        s1.setState("0");
        prodsService.insertMessage(s1);
        return "/s_message";
    }
    @RequestMapping("/updateJdOrder_state")
    public void updateJdOrder_state(String oid,String state,Model model) throws Exception {
        JdOrder s1 = new JdOrder();
        s1.setOid(Integer.parseInt(oid));
        s1.setState(state);
        prodsService.updateJdOrder_state(s1);
    }
    @RequestMapping("/s_table")
    public String s_table(String stoid,Model model) throws Exception {
        List<JdOrder> s1 = prodsService.selectJdOrder(stoid);
        List<JdSizes> s2 = new ArrayList<>();
        for(int i=0;i<s1.size();i++){
            s2.add(prodsService.selectJdSizes(s1.get(i).getSizeid()));
        }
        model.addAttribute("Sizes",s2);
        model.addAttribute("stoid",stoid);;
        model.addAttribute("JdOrder",s1);
        return "s_table";
    }
    @RequestMapping("/s_login")
    public String s_login(){
        return "s_login";
    }
    @RequestMapping("/s_update")
    public String s_update(){
        return "s_update";
    }
    @RequestMapping("/s_updateUI")
    public String s_updateUI(@Validated JdStores jdStores,BindingResult bindingResult,HttpServletRequest request,Model model) throws Exception {
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("jdStores",jdStores);
            return "forward:s_update";
        }
            prodsService.updateStores(jdStores);
        return "forward:out";
    }
    @RequestMapping("/addProd")
    public String addProd(){
        return "add-prod";
    }
    @RequestMapping("/addProdUI")
    public String addProdUI(HttpServletRequest request, @Validated JdProds prods, BindingResult bindingResult, String[] sizeCheckbox, String[] iname, String[] number, @RequestParam("zhuimg")MultipartFile zhuimg,@RequestParam("img")MultipartFile[] img,Model model)throws Exception{
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("prods",prods);
            model.addAttribute("size",sizeCheckbox);
            model.addAttribute("iname",iname);
            model.addAttribute("number",number);
            model.addAttribute("img",img);
            return "addProd";
        }
        int[] proimgID = new int[iname.length];
        String zimgname = zhuimg.getOriginalFilename();
        String path = request.getServletContext().getRealPath("/upload");//图片路径
        String zimgnewName = UUID.randomUUID() + zimgname.substring(zimgname.lastIndexOf("."));
        File newFile2 = new File(path+"/"+zimgnewName);
        zhuimg.transferTo(newFile2);
        System.out.println("-------------------"+zimgnewName);
        prods.setZimg(zimgnewName);
        prodsService.insertProds(prods);
        int id = prods.getProid();
        for(int i=0;i<iname.length;i++){
            if(iname[i]!=null&&!"".equals(iname[i])&&img[i]!=null){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                System.out.println("-----------------------------------------------"+path);
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);

                JdProdimg img1 = new JdProdimg();
                img1.setIname(iname[i]);
                img1.setImg(imgnewName);
                img1.setProid(id);
                prodsService.insertProdimg(img1);
                int Pimgid = img1.getPimgid();
                proimgID[i] = Pimgid;

                for(int x=0;x<sizeCheckbox.length;x++){
                    if (sizeCheckbox[x]!=null&&!"".equals(sizeCheckbox[x])){
                    JdSizes jdSizes = new JdSizes();
                    jdSizes.setNumber(number[i]);
                    jdSizes.setSize(sizeCheckbox[x]);
                    jdSizes.setPimgid(Pimgid);
                    prodsService.insertSzies(jdSizes);
                }
                }
            }
        }
        model.addAttribute("length",iname.length);
        model.addAttribute("proimgID",proimgID);
        return "add-prod2";
    }
    @RequestMapping("/addProdUI2")
    public String addProdUI2(HttpServletRequest request,String[] proimgID, String[] imgLength,
                             @RequestParam("img")MultipartFile[] img,Model model)throws Exception{
        int j = 0;
        int length =0;
        for(int i=0;i<proimgID.length;i++){
            length = Integer.parseInt(imgLength[i])+j;
            for(;j<length;j++){

                String path = request.getServletContext().getRealPath("/upload");//图片路径
                String imgname = img[j].getOriginalFilename();//图片原来的名字
                System.out.println("-----------------------------------------------"+path);
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[j].transferTo(newFile);

                JdZoomimg s1 = new JdZoomimg();
                s1.setImg(imgnewName);
                s1.setPimgid(Integer.parseInt(proimgID[i]));
                prodsService.insertZooming(s1);
            }
            j = length;
        }
        return "add-prod";
    }
    @RequestMapping("/s_loginUI")
    public String s_loginUI(HttpServletRequest request, @Validated JdStores jdStores,
                            BindingResult bindingResult,Model model) throws Exception {
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
            System.out.println("----------------------"+jdStores1.getStoid());
            System.out.println("----------------------"+jdStores1.getName());
            System.out.println("----------------------"+jdStores1.getPname());
            HttpSession session = request.getSession();
            session.setAttribute("jdStores", jdStores1);
            return "redirect:/addProd";
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
    @RequestMapping("/s_select")
    public String s_select(String stoid,Model model) throws Exception {
        PageHelper.startPage(1, 6);
        List<JdProds> prods = prodsService.selectJdprods(stoid);
        System.out.println("-------------------------"+prods.get(0).getZimg());
        List<JdProdimg> jdprodimg = new ArrayList();
        for(JdProds s1 : prods) {
            jdprodimg.addAll(prodsService.selectJdProdimg(""+s1.getProid()));
        }
        PageInfo<JdProds> pageInfo = new PageInfo<JdProds>(prods);
        int total = (int) ((pageInfo.getTotal()-1)/6)+1;
        System.out.println("------------------------共有商品信息：" + total);
        System.out.println("------------------------"+jdprodimg.size());
        System.out.println(stoid);
        model.addAttribute("total",total);
        model.addAttribute("page","1");
        model.addAttribute("Img",jdprodimg);
        model.addAttribute("prods",prods);
        return "s_select";
    }
    @RequestMapping("/s_page")
    public void s_page(HttpServletResponse response,String pagenum,String stoid) throws Exception {
        System.out.println("--------------------------"+pagenum);
        System.out.println("--------------------------"+stoid);
        PageHelper.startPage(Integer.parseInt(pagenum), 6);
        List<JdProds> prods = prodsService.selectJdprods(stoid);
        List<JdProdimg> jdprodimg = new ArrayList();
        for(JdProds s1 : prods) {
            jdprodimg.addAll(prodsService.selectJdProdimg(""+s1.getProid()));
        }
        PageInfo<JdProds> pageInfo = new PageInfo<JdProds>(prods);
        int total = (int) ((pageInfo.getTotal()-1)/6)+1;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pagenum",pagenum);
        map.put("prods",prods);
        map.put("total",total);
        map.put("Img",jdprodimg);
        JSONObject json = JSONObject.fromObject(map);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json.toString());
    }
    @RequestMapping("/s_selectP")
    public String s_selectP(String proid,String pimgid,Model model) throws Exception {
        List<JdProdimg> jdprodimg = prodsService.selectJdProdimg(proid);
        if(pimgid!=null&&!"".equals(pimgid)) {
            List<JdZoomimg> jdZoomimgs = prodsService.selectZoomimg(pimgid);
            List<JdSizes> jdSizes = prodsService.selectSizes(pimgid);
            JdProds jdProds = prodsService.selectOjdprods(proid);
            model.addAttribute("prod",jdProds);
            model.addAttribute("jdZoomimgs",jdZoomimgs);
            model.addAttribute("size",jdSizes);
            model.addAttribute("jdProdimg",jdprodimg);
            model.addAttribute("pimgid",pimgid);
            for(JdProdimg s1:jdprodimg){
                if((s1.getPimgid()+"").equals(pimgid)){
                    model.addAttribute("jdProdName",s1.getIname());
                }
            }
        }else{
            String pimgid2 = ""+jdprodimg.get(0).getPimgid();
            List<JdZoomimg> jdZoomimgs = prodsService.selectZoomimg(pimgid2);
            List<JdSizes> jdSizes = prodsService.selectSizes(pimgid2);
            JdProds jdProds = prodsService.selectOjdprods(proid);
            model.addAttribute("prod",jdProds);
            model.addAttribute("jdZoomimgs",jdZoomimgs);
            model.addAttribute("size",jdSizes);
            model.addAttribute("jdProdimg",jdprodimg);
            model.addAttribute("jdProdName",jdprodimg.get(0).getIname());
        }
        return "s_selectP";
    }
    @RequestMapping("/s_updateProds")
    public String s_updateProds(String proid,String pimgid,Model model) throws Exception {
        JdProds s1 = prodsService.selectOjdprods(proid);
        List<JdSizes> s2 = new ArrayList<JdSizes>();
        if(pimgid!=null&&!"".equals(pimgid)) {
            s2 = prodsService.selectSizes(pimgid);
        }else{
            List<JdProdimg> s4 = prodsService.selectJdProdimg(proid);
            s2 = prodsService.selectSizes(s4.get(0).getPimgid()+"");
        }
        String[] s3 = new String[s2.size()];
        for (int i=0;i<s2.size();i++){
            s3[i] = s2.get(i).getSizeid()+"";
        }
        model.addAttribute("prods",s1);
        model.addAttribute("sizes",s2);
        model.addAttribute("sizesId",s3);
        model.addAttribute("pimgid",pimgid);
        System.out.println(s1.getPromessage());
        return "s_updateProds";
    }

    @RequestMapping("/s_updateProdsUI")
    public String s_updateProdsUI(HttpServletRequest request,@Validated JdProds prods, BindingResult bindingResult,
                                  String[] sizeCheckbox,String[] size,String[] number,String[] sizeid,String pimgid,
                                  @RequestParam("img")MultipartFile img,Model model) throws Exception {
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("prods",prods);
            return "s_updateProds";
        }
        if("".equals(img.getOriginalFilename())||img==null){
            prodsService.updateJdprods(prods);
        }else{
            String path = request.getServletContext().getRealPath("/upload");//图片路径
            String imgname = img.getOriginalFilename();//图片原来的名字
            String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
            File newFile = new File(path+"/"+imgnewName);
            img.transferTo(newFile);
            prods.setZimg(imgnewName);
            prodsService.updateJdprods(prods);
        }
        if(sizeid!=null){
        for(int z=0;z<sizeCheckbox.length;z++){
            int num = Integer.parseInt(sizeCheckbox[z]);
            JdSizes s1 = new JdSizes();
            s1.setSize(size[num]);
            s1.setNumber(number[num]);
            s1.setPimgid(Integer.parseInt(pimgid));
            if(sizeCheckbox.length==sizeid.length){
                s1.setSizeid(Integer.parseInt(sizeid[z]));
                prodsService.updateJdsizes(s1);
            }else if (sizeCheckbox.length>sizeid.length){
                if(z<sizeid.length){
                s1.setSizeid(Integer.parseInt(sizeid[z]));
                prodsService.updateJdsizes(s1);
                }else{
                prodsService.insertSzies(s1);
                }
            }else {
                s1.setSizeid(Integer.parseInt(sizeid[z]));
                prodsService.updateJdsizes(s1);
            }
        }
        if(sizeCheckbox.length<sizeid.length){
            for(int z=sizeid.length-1;z>sizeCheckbox.length-1;z--){
                prodsService.deleteJdsizes(Integer.parseInt(sizeid[z]));
            }
        }}else{
            for(int z=0;z<sizeCheckbox.length;z++){
                if(size.length<=sizeCheckbox.length) {
                    JdSizes s1 = new JdSizes();
                    s1.setSize(size[z]);
                    s1.setNumber(number[z]);
                    s1.setPimgid(Integer.parseInt(pimgid));
                    prodsService.insertSzies(s1);
                }else{
                    int num = Integer.parseInt(sizeCheckbox[z]);
                    JdSizes s1 = new JdSizes();
                    s1.setSize(size[num]);
                    s1.setNumber(number[num]);
                    s1.setPimgid(Integer.parseInt(pimgid));
                    prodsService.insertSzies(s1);
                }
            }
        }
        return "forward:s_updateProds?proid="+prods.getProid()+"&pimgid="+pimgid;
    }

    @RequestMapping("/s_updateProdimg")
    public String s_updateProdimg(String proid,Model model) throws Exception {
        List<JdProdimg> s1 = prodsService.selectJdProdimg(proid);
        model.addAttribute("JdProdimg", s1);
        return "s_updateProdimg";
    }
    @RequestMapping("/s_updateProdimgUI")
    public String s_updateProdimgUI(HttpServletRequest request,@RequestParam("img")MultipartFile[] img,
                                    String[] iname,String[] pimgid,String proid,
                                    Model model) throws Exception {
        String path = request.getServletContext().getRealPath("/upload");//图片路径
        if(img.length<pimgid.length){
            for(int i=0;i<img.length;i++){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);

                JdProdimg s1 = new JdProdimg();
                s1.setImg(imgnewName);
                s1.setProid(Integer.parseInt(proid));
                s1.setPimgid(Integer.parseInt(pimgid[i]));
                s1.setIname(iname[i]);
                prodsService.updateJdProdimg(s1);
            }
            for(int i=pimgid.length-1;i>img.length-1;i--){
                prodsService.deleteJdProdimg(i);
            }
        }else if (img.length==pimgid.length){
            for(int i=0;i<img.length;i++){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);
                JdProdimg s1 = new JdProdimg();
                s1.setImg(imgnewName);
                s1.setProid(Integer.parseInt(proid));
                s1.setPimgid(Integer.parseInt(pimgid[i]));
                s1.setIname(iname[i]);
                prodsService.updateJdProdimg(s1);
            }
        }else{
            for(int i=0;i<img.length;i++){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);
                JdProdimg s1 = new JdProdimg();
                s1.setImg(imgnewName);
                s1.setProid(Integer.parseInt(proid));
                s1.setIname(iname[i]);
                if(i<pimgid.length) {
                    s1.setPimgid(Integer.parseInt(pimgid[i]));
                    prodsService.updateJdProdimg(s1);
                }else {
                    prodsService.insertProdimg(s1);
                }
            }
        }
        List<JdProdimg> s2 = prodsService.selectJdProdimg(proid);
        model.addAttribute("JdProdimg", s2);
        return "s_updateProdimg";
    }

    @RequestMapping("/s_updateZooming")
    public String s_s_updateZooming(String pimgid,String proid,Model model) throws Exception {
        List<JdZoomimg> s1 = prodsService.selectZoomimg(pimgid);
        model.addAttribute("JdZooming", s1);
        model.addAttribute("pimgid",pimgid);
        model.addAttribute("proid",proid);
        return "s_updateZooming";
    }

    @RequestMapping("/s_updateZoomingUI")
    public String s_s_updateZoomingUI(HttpServletRequest request,String pimgid,String proid,String[] zoomimgid,
                                      @RequestParam("img")MultipartFile[] img,Model model) throws Exception {
        String path = request.getServletContext().getRealPath("/upload");
        if(zoomimgid!=null){
            if(img.length>zoomimgid.length){
                for(int i=0;i<img.length;i++){
                    String imgname = img[i].getOriginalFilename();//图片原来的名字
                    String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                    File newFile = new File(path+"/"+imgnewName);
                    img[i].transferTo(newFile);

                    if(i<zoomimgid.length) {
                        JdZoomimg s1 = new JdZoomimg();
                        s1.setPimgid(Integer.parseInt(pimgid));
                        s1.setImg(imgnewName);
                        s1.setZoomimgid(Integer.parseInt(zoomimgid[i]));
                        prodsService.updateJdZooming(s1);
                    }else{
                        JdZoomimg s1 = new JdZoomimg();
                        s1.setPimgid(Integer.parseInt(pimgid));
                        s1.setImg(imgnewName);
                        prodsService.insertZooming(s1);
                    }
                }
            }else if (img.length==zoomimgid.length){
                for(int i=0;i<img.length;i++){
                    String imgname = img[i].getOriginalFilename();//图片原来的名字
                    String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                    File newFile = new File(path+"/"+imgnewName);
                    img[i].transferTo(newFile);
                    JdZoomimg s1 = new JdZoomimg();
                    s1.setPimgid(Integer.parseInt(pimgid));
                    s1.setImg(imgnewName);
                    s1.setZoomimgid(Integer.parseInt(zoomimgid[i]));
                    prodsService.updateJdZooming(s1);
                }
            }else{
                for(int i=0;i<img.length;i++){
                    String imgname = img[i].getOriginalFilename();//图片原来的名字
                    String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                    File newFile = new File(path+"/"+imgnewName);
                    img[i].transferTo(newFile);
                    JdZoomimg s1 = new JdZoomimg();
                    s1.setPimgid(Integer.parseInt(pimgid));
                    s1.setImg(imgnewName);
                    s1.setZoomimgid(Integer.parseInt(zoomimgid[i]));
                    prodsService.updateJdZooming(s1);
                    }
                for (int i=zoomimgid.length;i>img.length;i--){
                    prodsService.deleteJdZooming(Integer.parseInt(zoomimgid[i-1]));
                }
            }
        }else{
            JdZoomimg s1 = new JdZoomimg();
            s1.setPimgid(Integer.parseInt(pimgid));
            for(int i=0;i<img.length;i++){
                String imgname = img[i].getOriginalFilename();//图片原来的名字
                String imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[i].transferTo(newFile);
                s1.setImg(imgnewName);
                prodsService.insertZooming(s1);
            }
        }
        List<JdZoomimg> s1 = prodsService.selectZoomimg(pimgid);
        model.addAttribute("JdZooming", s1);
        model.addAttribute("pimgid",pimgid);
        model.addAttribute("proid",proid);
        return "s_updateZooming";
    }

    @RequestMapping("/showImg")
    public void showImg(HttpServletRequest request, HttpServletResponse response,String index,
                        @RequestParam("img")MultipartFile[] img)throws Exception{
//        String imgname = img[0].getOriginalFilename();
//        System.out.println("-------------------"+imgname);
//        System.out.println(img.length);
        System.out.println("-----------------------"+index);
        System.out.println("-----------------------"+img[0].getOriginalFilename());
        String path = request.getServletContext().getRealPath("/upload");//图片路径
        String imgnewName = null;
            if(index!=null) {
                int i = Integer.parseInt(index);
                if (img[i] != null) {
                    String imgname = img[i].getOriginalFilename();//图片原来的名字
                    imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                    File newFile = new File(path + "/" + imgnewName);
                    img[i].transferTo(newFile);
                }
            }else{
                String imgname = img[0].getOriginalFilename();//图片原来的名字
                imgnewName = UUID.randomUUID() + imgname.substring(imgname.lastIndexOf("."));
                File newFile = new File(path+"/"+imgnewName);
                img[0].transferTo(newFile);
            }
        System.out.println("--------------------------"+imgnewName);
        String result = null;
            result = "{\"img\":\""+imgnewName+"\"}";
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/text")
    public String test()throws Exception{
        return "push-pseries";
    }
    @RequestMapping("/textUI")
    public String textUI( HttpServletRequest request,HttpServletResponse response,
                          String name,String passWord,String checkbox,Model model) throws Exception {
//        InputStream is = xls.getInputStream(); //创建工作空间
//        Workbook wb = WorkbookFactory.create(is);
//        Sheet sheet = wb.getSheetAt(0);//获取第一个工作表
//        Row row ;//工作行
//        org.apache.poi.ss.usermodel.Cell cell ;//工作单元格
//        for(int i=0;i<=sheet.getLastRowNum();i++){
//            //sheet.getLastRowNum()获取行数
//            row= sheet.getRow(i);
//            //row.getLastCellNum()获取第i行的列数
//            for (int j=0;j<row.getLastCellNum();j++){
//            cell= row.getCell(j);
//            String str = cell.toString();
//            System.out.println("--------------------------------"+str);
//            }
//        }
        if(checkbox==null) checkbox = "0";
        if("123".equals(name)&&"123".equals(passWord)){
//            MessageDigest m = MessageDigest.getInstance("md5");
//            m.update(passWord.getBytes("UTF8"));
//            byte s[] = m.digest();
//            String loginInfo = name+","+s.toString();
//            System.out.println("--------------------------------"+s.toString());
            if(checkbox.equals("1")) {
                Cookie userCookie = new Cookie("loginInfo", name+","+passWord);
                userCookie.setMaxAge(30 * 24 * 60 * 60);   //存活期为一个月 30*24*60*60
                userCookie.setPath("/");
                response.addCookie(userCookie);
                System.out.println("---------------------------------123");
            }else{
                Cookie[] cookies = request.getCookies();
                System.out.println("---------------------------------"+cookies.length);
                for(Cookie cookie:cookies){
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
            return "text";
        }
        model.addAttribute("message","密码错误");
        return "text";
    }
    @RequestMapping("/text2")
    public void test2()throws Exception{

    }
//    @RequestMapping("/s_selectImg")
//    public void s_selectImg(HttpServletResponse response,String stoid,Model model) throws Exception {
//        List<JdProdimg> jdprodimg = prodsService.selectJdProdimg(stoid);
//        ObjectMapper mapper = new ObjectMapper();
//        String result = mapper.writeValueAsString(jdprodimg);
//        System.out.println(result);
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().print(result);
//    }
}

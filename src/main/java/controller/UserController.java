package controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import po.*;
import service.JedisClient.JedisClient;
import service.ProdService;
import service.ProdsService;
import service.UserService;
import tool.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.nutz.el.El.eval;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
@Controller
public class UserController {
    @Autowired
    private ProdService prodService;
    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private ProdsService prodsService;
    @Autowired
    private UserService userService;
    @RequestMapping("/message")
    public String message(int uid,Model model)throws Exception{
        //分类
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }

        List<JdOrder> s4 = userService.selectJdOrderUser(uid);
        List<JdSizes> s5 = new ArrayList<>();
        int[] s6 = new int[s4.size()];
        for(int i=0;i<s4.size();i++){
            s5.add(prodsService.selectJdSizes(s4.get(i).getSizeid()));
        }
        for(int i=0;i<s4.size();i++){
            s6[i] = userService.selectStoid(s4.get(i).getOid());
        }
        List<JdMessage> s7 = userService.selectMessage2(uid);
        model.addAttribute("JdMessage",s7);
        model.addAttribute("oid",s6);
        model.addAttribute("Sizes",s5);
        model.addAttribute("JdOrder",s4);
        return "/message";
    }
    @RequestMapping("/messageUI")
    public String messageUI(int mid,int uid,int stoid,String message,Model model)throws Exception{
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }
        if(mid==0){
            JdMessage s1 = new JdMessage();
            s1.setMessage(message);
            s1.setUid(uid);
            s1.setStoid(stoid);
            s1.setState("0");
            userService.insertMessage(s1);
        }else{
            JdMessage s2 = new JdMessage();
            s2.setMid(mid);
            s2.setState("1");
            userService.updateMessage(s2);
            JdMessage s1 = new JdMessage();
            s1.setMessage(message);
            s1.setUid(uid);
            s1.setStoid(stoid);
            s1.setState("0");
            userService.insertMessage(s1);
        }
        return "prod";
    }
    @RequestMapping("/OrderUI")
    public String OrderUI(String uid,float zprice,int[] num,String[] pimgid,int[] sizeid,int[] proid,
                          String address,String phonenum,String name,String message) throws Exception {
        System.out.println("---------------------"+num.length);
        System.out.println("---------------------"+pimgid.length);
        System.out.println("---------------------"+sizeid.length);
        JdUser jdUser = userService.selectmoney(uid);
        for (int j=0;j<sizeid.length;j++){
            JdSizes jdSizes = userService.selectOJdSizes(sizeid[j]+"");
            jdSizes.setNumber((Integer.parseInt(jdSizes.getNumber())-num[j])+"");
            userService.updateJdSizes(jdSizes);
        }
        jdUser.setMoney(jdUser.getMoney()-zprice);
        userService.updateUser(jdUser);
        String val2 = "收件人电话号码："+phonenum;
        String val3 = "收件人称呼："+name;
        if(message!=null) {
            message = val2+";<br>"+val3+";<br>"+"备注信息:" + message;
        }else{
            message = val2+";<br>"+val3;
        }
        for(int i=0;i<num.length;i++){
            String messageInfo = null;
            JdOrder s1 = new JdOrder();
            JdOrderStoresKey s2 = new JdOrderStoresKey();
            JdOrderProdsKey s3 = new JdOrderProdsKey();
            s1.setAddress(address);

            JdProdimg jdProdimg = userService.selectOJdProdimg(pimgid[i]);
            int stoid = userService.selectOJdProds(""+proid[i]).getStoid();
            String Prodimgname = jdProdimg.getIname();
            int Pimgid = jdProdimg.getPimgid();

            messageInfo = message+";<br>"+"款式名称："+Prodimgname+"("+Pimgid+")";
            s1.setMessage(messageInfo);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date date=df.parse(df.format(new Date()));
            s1.setDate(date);
            s1.setNum(num[i]);
            s1.setSizeid(sizeid[i]);
            s1.setState("0");
            s1.setUid(Integer.parseInt(uid));
            userService.insertJdOrder(s1);
            int Oid = s1.getOid();
            s2.setOid(Oid);
            s2.setStoid(stoid);
            userService.intsertJdOrderStores(s2);
            s3.setOid(Oid);
            s3.setProid(proid[i]);
            userService.intsertJdOrderProds(s3);
        }
        return "redirect:prod";
    }
    @RequestMapping("/Order")
    public String Order(String zprice,String[] num,String[] pimgid,String[] sizeid,String[] proid,Model model) throws Exception {
        //分类
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }
        List<JdProds> JdProds = new ArrayList<>();
        List<JdSizes> JdSizes = new ArrayList<>();
        List<JdProdimg> JdProdimg = new ArrayList<>();
        System.out.println("-----------------------------"+proid.length);
        for(int i=0;i<proid.length;i++){
            JdProds.add(userService.selectOJdProds(proid[i]));
            JdSizes.add(userService.selectOJdSizes(sizeid[i]));
            JdProdimg.add(userService.selectOJdProdimg(pimgid[i]));
        }
        model.addAttribute("num",num);
        model.addAttribute("zprice",zprice);
        model.addAttribute("JdProds",JdProds);
        model.addAttribute("JdSizes",JdSizes);
        model.addAttribute("JdProdimg",JdProdimg);
        System.out.println("-----------------------------"+JdProds.size());
        System.out.println("-----------------------------"+JdSizes.size());
        System.out.println("-----------------------------"+JdProdimg.size());
        model.addAttribute("sizeid",sizeid);
        model.addAttribute("pimgid",pimgid);
        model.addAttribute("num",num);
        return "Order";
    }
    @RequestMapping("/money")
    public String money(){
        return "money";
    }
    @RequestMapping("/moneyUI")
    public String moneyUI(HttpServletRequest request,JdUser jdUser,Model model) throws Exception {
        JdUser s1 = userService.selectmoney(jdUser.getUid()+"");
        float money = s1.getMoney()+jdUser.getMoney();
        s1.setMoney(money);
        userService.updateUser(s1);
        HttpSession session = request.getSession();
        session.setAttribute("JdUser",s1);
        model.addAttribute("message_money","充值成功!");
        return "money";
    }
    @RequestMapping("/update")
    public String update(){
        return "update";
    }
    @RequestMapping("/updateUI")
    public String updateUI(HttpServletRequest request,JdUser jdUser) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute("JdUser");
        session.invalidate();
        userService.updateUser(jdUser);
        return "login";
    }
    @RequestMapping("/select")
    public String select(String queryString,String mid,String tid,String thid,
                          String sort,String brand,Integer page,Model model) throws Exception {
        System.out.println("============================="+queryString);
        if(jedisClient.get("key")!=null){
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }
        ResultModel resultModel = prodService.query(queryString,brand,sort,page,mid,tid,thid);
        model.addAttribute("result",resultModel);
        model.addAttribute("queryString",queryString);
        model.addAttribute("brand",brand);
        model.addAttribute("sort",sort);
        model.addAttribute("mid",mid);
        model.addAttribute("tid",tid);
        model.addAttribute("thid",thid);
        model.addAttribute("page", resultModel.getCurPage());
        model.addAttribute("total",resultModel.getPageCount());
        return "select";
    }
    @RequestMapping("/selectP")
    public String selectP(String proid,String pimgid,Model model) throws Exception {
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }

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
            for(JdProdimg val1:jdprodimg){
                if((val1.getPimgid()+"").equals(pimgid)){
                    model.addAttribute("jdProdName",val1.getIname());
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
        return "selectP";
    }
    @RequestMapping("/cart")
    public String cart(String uid,String cid,Model model) throws Exception {
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
            if(s1!=null){
                map.put("JdMclass",s1);
            }
            if(s2!=null){
                map.put("JdTwoclass",s2);
            }
            if(s3!=null){
                map.put("JdThreeclass",s3);
            }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }
        if(cid.equals("0")){
            userService.insertCart(uid);
        }else{
            JdCart cart = userService.selectCart(uid);
            String cidnum = cart.getCid()+"";
            //遍历货品
            List<JdProds> prods = userService.selectJdProds(cid);
            model.addAttribute("prods",prods);
            List<JdProdimg> s5 = new ArrayList<>();
            List<JdSizes> s6 = new ArrayList<>();
            for(int i=0;i<prods.size();i++){
                s5.addAll(userService.selectJdProdimg(prods.get(i).getProid()+""));
            }
            model.addAttribute("Img",s5);
            for(int i=0;i<s5.size();i++){
                s6.addAll(userService.selectJdSizes(s5.get(i).getPimgid()+""));
            }
            model.addAttribute("Sizes",s6);
            System.out.println("-------------------------"+prods);
            System.out.println("-------------------------"+s6.size());
        }
        return "cart";
    }
    @RequestMapping("/prod")
    public String prod(Model model) throws Exception {
        if(jedisClient.get("key")!=null){
            System.out.println("--------------redis");
            Map<String, Object> map = JsonUtil.json2Map(jedisClient.get("key"));
            List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
            List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
            List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
        }else{
            List<JdMclass> s1 = userService.selectJdMclass();
            List<JdTwoclass> s2 = userService.selectJdTwoclass();
            List<JdThreeclass> s3 = userService.selectJdThreeclass();
            model.addAttribute("JdMclass",s1);
            model.addAttribute("JdTwoclass",s2);
            model.addAttribute("JdThreeclass",s3);
            Map<String, Object> map = new HashMap<String, Object>();
        if(s1!=null){
            map.put("JdMclass",s1);
        }
        if(s2!=null){
            map.put("JdTwoclass",s2);
        }
        if(s3!=null){
            map.put("JdThreeclass",s3);
        }
            JSONObject json = JSONObject.fromObject(map);
            jedisClient.set("key",json.toString());
        }

        List<JdProds> prods = userService.selectJdProds();
        //款式图
        List<JdProdimg> s5 = new ArrayList<>();
        for(int i=0;i<prods.size();i++){
            s5.addAll(userService.selectJdProdimg(prods.get(i).getProid()+""));
        }
        model.addAttribute("Img",s5);
        model.addAttribute("prods",prods);
        return "prod";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/forget")
    public String forget(){
        return "forget";
    }
    @RequestMapping("/sign_up")
    public String sign_up(){
        return "sign-up";
    }
    @RequestMapping("/loginUI")
    public String loginUI(HttpSession session, String username, String pass, Model model)throws Exception {
        if(username!=null&&!"".equals(username)&&pass!=null&&!"".equals(pass)){
            if(userService.findUser(username,pass)>0){
                JdUser s1 = userService.select_Name(username);
                String cid = "0";
                if(userService.selectCart(s1.getUid()+"")!=null){
                    cid = ""+userService.selectCart(s1.getUid()+"").getCid();
                }else{
                    userService.insertCart(s1.getUid()+"");
                    cid = ""+userService.selectCart(s1.getUid()+"").getCid();
                }
                session.setAttribute("cid",cid);
                session.setAttribute("JdUser",s1);
                return "redirect:prod";
            }else{
                model.addAttribute("message","密码错误");
                model.addAttribute("username", username);
                return "login";
            }
        }else{
            model.addAttribute("message","账号或密码不能为空");
            return "login";
        }
    }
    @RequestMapping("/sign_upUI")
    public String sign_upUI(HttpSession session, @Validated JdUser jdUser, BindingResult bindingResult, Model model)throws Exception {
        System.out.println("-------------------------------"+session.getAttribute("pnum"));
        String pnum = "";
        if(session.getAttribute("pnum")!=null){
            pnum = ""+session.getAttribute("pnum");
        }
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("jdUser",jdUser);
            model.addAttribute("pnum",pnum);
            return "forward:sign_up";
        }
        if(pnum.equals(jdUser.getActicode())) {
            jdUser.setState("0");
            jdUser.setMoney(0f);
            userService.insertUser(jdUser);
            EmailCheck emailCheck = new EmailCheck();
            emailCheck.message(jdUser.getEmail(),jdUser.getName(),jdUser.getActicode());
        }else{
            model.addAttribute("message2","验证码已过期，请重新获取");
            model.addAttribute("jdUser",jdUser);
            model.addAttribute("pnum",pnum);
            return "forward:sign_up";
        }
        return "login";
    }
    @RequestMapping("/checkUname")
    public void Checkname(HttpServletResponse response,String name)throws Exception{
        int x = userService.findUserName(name);
        String result = null;
        if(x>0){
            result = "{\"message\":\"0\"}";
        }else{
            result = "{\"message\":\"1\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/checkEmail")
    public void checkEmail(HttpServletResponse response,String email)throws Exception{
        int x = userService.checkEmail(email);
        String result = null;
        if(x>0){
            result = "{\"message\":\"0\"}";
        }else{
            result = "{\"message\":\"1\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/num")
    public void num(String phonenum,HttpServletResponse response,HttpSession session)throws Exception{
        actiCode actiCode = new actiCode();
        String x = actiCode.number();
        session.setAttribute("pnum", x);
        session.setMaxInactiveInterval(2*60);
//        PhoneCheck s1 = new PhoneCheck();
//        s1.phone(phonenum,x);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print( "{\"pnum\":\""+x+"\"}");
    }
    @RequestMapping("/emailCheck")
    public String emailCheck(String name,String acticode)throws Exception{
        JdUser jdUser = userService.select_Name(name);
        if (acticode.equals(jdUser.getActicode())){
            userService.emailCheck(name);
        }
        return "login";
    }
    @RequestMapping("/forgetPass")
    public void forget(HttpServletResponse response,String email)throws Exception{
        Forget forget = new Forget();
        String result = null;
        JdUser jdUser = userService.select_Email(email);
        if(jdUser!=null){
        forget.forgetPass(email,jdUser.getName());
        result = "{\"message\":\"1\"}";
        }else{
        result = "{\"message\":\"0\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/forgetPass2")
    public String forget2(String name,Model model)throws Exception{
        model.addAttribute("name",name);
        return "forget2";
    }
    @RequestMapping("/forgetPassUI")
    public String forgetUI(@Validated JdUser jdUser,BindingResult bindingResult, Model model)throws Exception{
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for(ObjectError objectError:allErrors){
                System.out.println(objectError.getDefaultMessage());
            }
            model.addAttribute("message",allErrors);
            model.addAttribute("name",jdUser.getName());
            return "forward:forgetPass2";
        }else{
            userService.updateUser_name(jdUser);
        return "login";
        }
    }
    @RequestMapping("/addcart")
    public void addcart(HttpServletResponse response,String uid,String cid,String proid) throws Exception {
        JdProdsCartKey s1 = new JdProdsCartKey();
        s1.setCid(Integer.parseInt(cid));
        s1.setProid(Integer.parseInt(proid));
        String result =null;
        if(userService.selectcart(s1)<=0){
            result = "{\"message\":\"1\"}";
            userService.addcart(s1);;
        }else{
            result = "{\"message\":\"0\"}";
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/selectProdsnum")
    public void selectProdsnum(HttpServletResponse response,String cid) throws Exception {
        int prodsnum = userService.selectProdsnum(cid);
        System.out.println("---------------------------"+prodsnum);
        String result = "{\"prodsnum\":\""+prodsnum+"\"}";
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/delectCart")
    public void delectCart(HttpServletResponse response,String proid,String cid) throws Exception {
        JdProdsCartKey s1 = new JdProdsCartKey();
        s1.setProid(Integer.parseInt(proid));
        s1.setCid(Integer.parseInt(cid));
        userService.delectCart(s1);
        int prodsnum = userService.selectProdsnum(cid);
        String result = "{\"prodsnum\":\""+prodsnum+"\"}";
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(result);
    }
    @RequestMapping("/selectSize")
    public void selectSize(HttpServletResponse response,String pimgid) throws Exception {
        List<JdSizes> s1 = userService.selectSize(pimgid);
        Map<String, Object> map = new HashMap<String, Object>();
        if(s1!=null){
        map.put("Jdsizes",s1);
        }
        JSONObject json = JSONObject.fromObject(map);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json.toString());
    }

}

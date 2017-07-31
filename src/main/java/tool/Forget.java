package tool;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * Created by 曾浩津 on 2017/7/19.
 */
public class Forget {
    public void forgetPass(String email,String name) throws GeneralSecurityException, MessagingException {
        Properties props = new Properties();
        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getInstance(props);
        session.setDebug(true);
        SimpleDateFormat bartDateFormat = new SimpleDateFormat
                ("yyyy-MM-dd");
        Message msg = new MimeMessage(session);
        StringBuffer sb=new StringBuffer("<div style=\"width:660px;overflow:hidden;border-bottom:" +
                "1px solid #bdbdbe;\"><div style=\"height:52px;overflow:" +
                "hidden;border:1px solid #464c51;" +
                "background:#353b3f url(http://w" +
                "ww.lofter.com/rsc/img/email/hdbg.png);" +
                "\"></div>"+"<div style=\"pa" +
                "dding:24px 20px;\">您好，"+email+
                "<br/><br/>欢迎，使用shopping.com购物网！<br/><br/>请点击下面链接修改密码！</br>");
        sb.append("<a href=\"http://localhost:8080/Jd/forgetPass2?name=");
        sb.append(name);
        sb.append("\">http://localhost:8080/Jd/forgetPass2?name=");
        sb.append(name);
        sb.append("</a>"+"<br/>如果以上链接无法点击，请把上面网页地址复制到浏览器地址栏中打开<br/><br/><br/>shopping.com购物网<br/>"+bartDateFormat.format(new Date())+ "</div></div>" );
        msg.setSubject("Sp忘记密码");
        msg.setContent(sb.toString(), "text/html;charset=gbk");
        msg.setFrom(new InternetAddress("814144510@qq.com"));

        Transport transport = session.getTransport();
        transport.connect("smtp.qq.com", "814144510@qq.com", "cgwjgckqhsjybdjb");
        transport.sendMessage(msg, new Address[]{new InternetAddress(email)});
        transport.close();
}
}

package cn.zq.common.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtils {
    public static void sendEmail(String email, String subject, String text) throws MessagingException {
        String USER="xl.niu@zqrail.cn";
        String PASSWORD=".\u0005\u0006\u0015\u001D\u0018DCLL";

        //1.创建一个程序与邮件服务器会话对象 Session
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");//设置访问smtp服务器需要认证
        properties.setProperty("mail.transport.protocol", "smtp"); //设置访问服务器的协议
        Session session = Session.getDefaultInstance(properties);
        session.setDebug(true); //打开debug功能

        //2.创建一个Message，它相当于是邮件内容
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(USER));// 设置发送者
        //msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email!=null?email:USER));//接受者
        msg.setSubject(subject); //主题
        msg.setText(text); //内容
        //3.发送邮件
        Transport trans = session.getTransport();
        try{
        //连接邮箱smtp服务器;25为默认端口;163邮箱;客户端授权密码（注意，不是登录密码）
        trans.connect("smtp.zmail300.cn", 25, USER, MD5.convertMD5(PASSWORD));
        trans.sendMessage(msg, new Address[]{new InternetAddress(email!=null?email:USER)}); //发送邮件
        System.out.println("Sent message successfully....");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }finally {
            trans.close();//关闭连接
        }
    }

    public static void main(String[] args) throws MessagingException{
        MailUtils.sendEmail(null,"测试邮件","测试邮件请忽略");
    }
}

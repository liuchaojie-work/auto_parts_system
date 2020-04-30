package cn.autoparts.util;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class SendMailUtils {
    private static String fromEmail;//发送人邮箱地址
    private static String username;//发件人用户名
    private static String password;//应设置POP3协议，不是登录邮箱的密码
    private static String mailSmtpHostKey;
    private static String mailSmtpHostValue;
    private static String mailSmtpAuthKey;
    private static String mailSmtpAuthValue;
    private static int mailSmtpPort;
    private static String mailTransportProtocolKey;
    private static String mailTransportProtocolValue;
    private static String text;

    private SendMailUtils() {
    }
    static {
        try {
            Properties pros = new Properties();
            ClassLoader classLoader = SendMailUtils.class.getClassLoader();
            URL resource = classLoader.getResource("email.properties");
            String path = resource.getPath();
            pros.load(new FileReader(path));
            fromEmail = pros.getProperty("fromEmail");
            username = pros.getProperty("username");
            password = pros.getProperty("password");
            mailSmtpHostKey = pros.getProperty("mailSmtpHostKey");
            mailSmtpHostValue = pros.getProperty("mailSmtpHostValue");
            mailSmtpAuthKey = pros.getProperty("mailSmtpAuthKey");
            mailSmtpAuthValue = pros.getProperty("mailSmtpAuthValue");
            mailSmtpPort = Integer.parseInt(pros.getProperty("mailSmtpPort"));
            mailTransportProtocolKey = pros.getProperty("mailTransportProtocolKey");
            mailTransportProtocolValue = pros.getProperty("mailTransportProtocolValue");
            text = pros.getProperty("text");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("邮件配置加载异常！");
        }
    }


    /**
     * 给具体的某一个邮箱地址发送邮件
     * @param email
     * @param emailMsg
     * @param subject
     * @return
     */
    public static boolean sendMail(String email, String emailMsg, String subject){
        if(StringUtils.isEmpty(email) || StringUtils.isEmpty(emailMsg)){
            throw new RuntimeException("邮件地址或者邮箱内容为空！发送消息失败!");
        }

        //接收人邮箱地址
        String toEmail = email;

        //定义一个Properties,设置环境变量
        Properties pros = new Properties();
        //设置邮件的服务器地址
        //设置smtp服务器
        pros.setProperty(mailSmtpHostKey,mailSmtpHostValue);
        pros.setProperty(mailSmtpAuthKey,mailSmtpAuthValue);
        //设置发送邮件使用的协议
        pros.setProperty(mailTransportProtocolKey,mailTransportProtocolValue);

        //创建一个Session对象
        Session session = Session.getInstance(pros);

        //MimeMessage的实例表示一封邮件
        MimeMessage mimeMessage = new MimeMessage(session);

        try {
            //设置发件人
            mimeMessage.setFrom(new InternetAddress(fromEmail));
            //设置主题
            mimeMessage.setSubject(subject);
            //设置邮件的文本格式
            mimeMessage.setContent(emailMsg,text);
            //从Session中获取发送邮件的对象
            Transport transport = session.getTransport();
            //连接服务器
            transport.connect(mailSmtpHostValue,mailSmtpPort, username, password);
            //设置收件人地址，并且发送邮件
            transport.sendMessage(mimeMessage, new Address[]{new InternetAddress(toEmail)});
            //关闭
            transport.close();
            return true;
        } catch (AddressException e){
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
}

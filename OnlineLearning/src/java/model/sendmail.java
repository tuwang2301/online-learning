///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package model;
//
//import java.util.Properties;
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import java.util.regex.Pattern;
//import java.util.regex.Matcher;
//
///**
// * /**
// *
// * @author dell
// */
//public class sendmail {
//  private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";
//    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);
//
//    public static boolean isValidEmail(String email) {
//        Matcher matcher = EMAIL_PATTERN.matcher(email);
//        return matcher.matches();
//    }
//
//    public static void sendmail(String host, String port, final String username, final String password, String recipientEmail, String subject, String messageContent) throws MessagingException {
//        // Cấu hình thông tin server email
//        Properties properties = new Properties();
//        properties.put("mail.smtp.host", host);
//        properties.put("mail.smtp.port", port);
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//
//        // Tạo session email với thông tin xác thực
//        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
//            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
//                return new javax.mail.PasswordAuthentication(username, password);
//            }
//        });
//
//        // Tạo đối tượng MimeMessage để thiết lập nội dung email
//        MimeMessage message = new MimeMessage(session);
//        message.setFrom(new InternetAddress(username));
//        message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
//        message.setSubject(subject);
//        message.setText(messageContent);
//
//        // Gửi email
//        Transport.send(message);
//        System.out.println("Email sent successfully!");
//    }
//}
//    

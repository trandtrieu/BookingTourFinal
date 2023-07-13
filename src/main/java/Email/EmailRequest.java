/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Email;

/**
 *
 * @author DELL
 */
import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import model.BookTour;
import model.RequestCreateTour;
import model.Tour;

public class EmailRequest {

    public static void sendConfirmationEmail(String email, RequestCreateTour order) throws MessagingException {
        // Cấu hình thông tin liên quan đến thư
        String host = "smtp.gmail.com";
        String port = "587";
        final String username = "trieudz02@gmail.com";
        final String password = "hylpmfiuezpxbxia";
        String fromEmail = "trieudz02@gmail.com";
        String subject = "Xac nhan yeu cau";
        // Tạo đối tượng Session từ thông tin cấu hình
        java.util.Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", port);
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        String content = "<html><head>"
                + "<style>"
                + "table {"
                + "  border-collapse: collapse;"
                + "  width: 5 0%;"
                + "}"
                + "th, td {"
                + "  padding: 8px;"
                + "  text-align: left;"
                + "  border-bottom: 1px solid #ddd;"
                + "}"
                + "th {"
                + "  background-color: #f2f2f2;"
                + "}"
                + "</style>"
                + "</head><body>"
                //                + "<h1>Xin chào, " + order.getName() + "</h1>"
                + "<p>Yêu cầu của bạn đã gửi thành công.</p>"
                + "<h2>Thông tin tour:</h2>"
                + "<table>"
                + "<tr><th>Tên người đại diện</th><td>" + order.getName() + "</td></tr>"
                + "<tr><th>Tên doanh nghiệp tổ chức</th><td>" + order.getNameGroup() + "</td></tr>"
                + "<tr><th>Tên tour du lịch mong muốn</th><td>" + order.getTourName() + "</td></tr>"
                + "<tr><th>Số điện thoại</th><td>" + order.getPhone() + "</td></tr>"
                + "<tr><th>Ngày khởi hành dự kiến</th><td>" + order.getDateStart() + "</td></tr>"
                + "<tr><th>Ngày kết thúc dự kiến</th><td>" + order.getDateEnd() + "</td></tr>" 
                + "<tr><th>Chi phí ước tính cho mỗi người</th><td>" + order.getName() + "</td></tr>"
                + "<tr><th>Số lượng người lớn tham gia gồm </th><td>" + order.getQuantityAd() + " người lớn và" + order.getQuantityChild()+ " trẻ em </td></tr>"
                + "</table>"
                + "</body></html>";

        // Tạo đối tượng MimeMessage
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject(subject);
        message.setContent(content, "text/html; charset=utf-8");

        // Gửi email
        Transport.send(message);
    }
}

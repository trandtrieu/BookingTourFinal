/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Email;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.MailContent;
import model.RequestCreateTour;

/**
 *
 * @author DELL
 */
public class EmailConfirmRequest {

    public static void sendConfirmCreateTour(String email, MailContent confirm, RequestCreateTour request) throws MessagingException {
        // Cấu hình thông tin liên quan đến thư
        String host = "smtp.gmail.com";
        String port = "587";
        final String username = "trieudz02@gmail.com";
        final String password = "hylpmfiuezpxbxia";
        String fromEmail = "trieudz02@gmail.com";
        String subject = "Xac nhan dong y tao tour";
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
                + "body { font-family: Arial, sans-serif; background-color: #f5f5f5; }"
                + "h2 { color: #333333; }"
                + "p { margin-bottom: 10px; }"
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
                + "<div style='background-color: #ffffff; padding: 20px; border-radius: 5px;'>"
                + "<h2 style='color: #0088cc;'>" + confirm.getTitle() + "</h2>"
                + "<p>Kính gửi anh/chị " + request.getName() + ",</p>"
                + "<p>Trước hết, chúng tôi xin chân thành cảm ơn vì sự quan tâm và yêu thích của anh/chị đối với các tour của chúng tôi.</p>"
                + "<p>Sau khi xem xét kỹ yêu cầu mà anh/chị đã gửi, chúng tôi xin vui lòng thông báo rằng chúng tôi đã đồng ý đáp ứng yêu cầu của anh/chị.</p>"
                + "<p>" + confirm.getContent() + "</p>"
                + "<p>Trong một giờ tới, chúng tôi sẽ liên hệ trực tiếp thông qua số điện thoại di động mà bạn cung cấp.</p>"
                + "<p>Chúng tôi rất hân hạnh được phục vụ anh/chị và sẽ sắp xếp mọi thứ để đảm bảo chuyến đi của anh/chị trở thành một trải nghiệm tuyệt vời.</p>"
                + "<p>Xin chân thành cảm ơn anh/chị đã lựa chọn chúng tôi và chúng tôi rất mong chờ được gặp anh/chị trong chuyến đi sắp tới.</p>"
                + "<p>Trân trọng,</p>"
                + "<table>"
                + "<tr><th>Số thẻ</th><td> 9704198526191432198</td></tr>"
                + "<tr><th>Ngân hàng</th><td> NCB </td></tr>"
                + "<tr><th>Tên chủ thẻ</th><td> NGUYEN VAN A </td></tr>"
                + "<tr><th>Cú pháp</th><td>Tên doanh nghiệp(nếu có) + tên người đại diện </td></tr>"
                + "</table>"
                + "</div>"
                + "</body>"
                + "</html>";

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

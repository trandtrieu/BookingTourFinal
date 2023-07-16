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
public class EmailDeny {

    public static void sendDenyCreateTour(String email, MailContent deny, RequestCreateTour request) throws MessagingException {

        // Cấu hình thông tin liên quan đến thư
        String host = "smtp.gmail.com";
        String port = "587";
        final String username = "trieudz02@gmail.com";
        final String password = "hylpmfiuezpxbxia";
        String fromEmail = "trieudz02@gmail.com";
        String subject = "Tu choi tao tour ";
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
                + "</style>"
                + "</head><body>"
                + "<div style='background-color: #ffffff; padding: 20px; border-radius: 5px;'>"
                + "<h2 style='color: #0088cc;'>" + deny.getTitle() + "</h2>"
                + "<p>Kính gửi anh/chị " + request.getName() + ",</p>"
                + "<p>Trước hết, Explore xin chân thành cảm ơn vì sự quan tâm và yêu thích của anh/chị đối với các tour của chúng tôi.</p>"
                + "<p>Sau khi xem xét kỹ yêu cầu mà anh/chị đã gửi, chúng tôi rất tiếc phải thông báo rằng không thể đáp ứng yêu cầu này vào thời điểm hiện tại.</p>"
                + "<p>" + deny.getContent() + "</p>"
                + "<p>Chúng tôi rất tiếc vì sự bất tiện này và xin lỗi vì không thể đáp ứng mong đợi của anh/chị. Chúng tôi hiểu rằng đây có thể làm anh/chị cảm thấy thất vọng.</p>"
                + "<p>Chúng tôi rất mong được phục vụ anh/chị trong tương lai và hy vọng rằng sẽ có cơ hội hợp tác trong những chuyến đi sắp tới.</p>"
                + "<p>Xin chân thành cảm ơn anh/chị đã lựa chọn chúng tôi và chúc anh/chị có những trải nghiệm tuyệt vời trong các chuyến đi tiếp theo.</p>"
                + "<p>Trân trọng,</p>"
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

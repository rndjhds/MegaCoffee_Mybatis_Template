package com.cafe.megacoffee.util.mailsender;

import com.cafe.megacoffee.member.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@RequiredArgsConstructor
@Component
public class MailService {

    private final JavaMailSender javaMailSender;

    public void createEmail(MemberDTO memberDTO, String sender) {

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, "UTF-8");

        String content = "<!DOCTYPE html>\n" +
                "<html lang=\"ko\">\n" +
                "<head>\n" +
                "    <meta name=\"description\" content=\"\">\n" +
                "    <meta name=\"keywords\" content=\"\">\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <link rel=\"stylesheet\" href=\"../../resources/statics/style/reset.css\">\n" +
                "    <link rel=\"stylesheet\" href=\"../../resources/statics/style/email.css\">\n" +
                "    <title>회원가입메일</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <main>\n" +
                "        <h1>MGC</h1>\n" +
                "        <p class=\"subtitle\">\n" +
                "            회원가입이 완료되었습니다..\n" +
                "        </p>\n" +
                "        <span class=\"span1\"></span>\n" +
                "        <p class=\"sub\">\n" +
                "            <em>안녕하세요 " + memberDTO.getUsername() + "님</em><br>\n" +
                "            회원가입이 정상 완료되었습니다.<br>\n" +
                "            이후 상품 주문시 로그인후 부탁드리겠습니다.\n" +
                "            감사합니다<br> \n" +
                "        </p>\n" +
                "        <div>\n" +
                "            <p>주문내역</p>\n" +
                "            <span class=\"span2\"></span>\n" +
                "        </div>\n" +
                "    </main>\n" +
                "</body>\n" +
                "</html>";

        try {
            mimeMessageHelper.setFrom(sender);
            mimeMessageHelper.setTo(memberDTO.getEmail());
            mimeMessageHelper.setSubject("회원가입이 정상 완료되었습니다.");
            mimeMessageHelper.setText(content, true);

            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {

        }
    }
}

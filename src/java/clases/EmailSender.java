package clases;

import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author CHANGE Gate
 * 
 * Clase que representa un manejador para enviar emails.
 * 
 */
public class EmailSender extends ActionSupport {

    private String userName;
    private String password;
    private String host;
    private String port;
    private String recipient;
    private String subject;
    private String message;

    /**
     *
     * @param to
     * @param sub
     * @param body
     * 
     * Constructor de la clase. Siempre con el mismo puerto, servidor y usuario.
     * 
     */
    public EmailSender(String to, String sub, String body) {
        this.userName = "cambiocarrera@gmail.com";
        this.password = "c4mb10c4rr3r4";
        this.host = "smtp.gmail.com";
        this.port = "587";
        this.recipient = to;
        this.subject = sub;
        this.message = body;
    }

    /**
     *
     * @throws AddressException
     * @throws MessagingException
     * 
     * Envía el email. Debe conectarse al servidor elegido con el usuario y su
     * contraseña. Luego crea un mensaje como ese usuario y lo envía al
     * destinatario correspondiente.
     * 
     */
    public void sendEmail() throws AddressException, MessagingException {
        
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", userName);
        properties.put("mail.password", password);

        // Autentica en el servidor
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(properties, auth);

        // Crea mensaje
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(recipient)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());

        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);

        msg.setContent(multipart);

        // Envía el mensaje
        Transport.send(msg);
    }
}
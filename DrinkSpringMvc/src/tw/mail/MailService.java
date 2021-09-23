package tw.mail;

import java.util.Properties;

import javax.mail.internet.*;
import javax.mail.*;

public class MailService { 
	String email;
	String content;

	public void sendMail(String email, String content) {

		this.email = email;
		this.content = content;
		// Recipient's email ID needs to be mentioned.
		String toEmail = email;

		// Sender's email ID needs to be mentioned
		String from = "ordermealsystem@gmail.com";
		final String username = "ordermealsystem";// change accordingly
		final String password = "asd123654asd";// change accordingly

		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";

		// fill props with any information
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// Get the Session object.

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

			// Set Subject: header field
			message.setSubject("Order a Meal System Find Password");

			// Now set the actual message
			message.setText("New Password:"+content);

			// Send message
			Transport.send(message);

			System.out.println("Sent message successfully....");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

}

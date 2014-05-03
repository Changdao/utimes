package com.utimes.study.service;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * Created by nevernew on 14-5-1.
 */
public class MailServiceImpl implements MailService {

    private MailSender mailSender;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public boolean sendService(String from, String dest, String topic, String content) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(from);
        message.setTo(dest);
        message.setSubject(topic);
        message.setText(content);
        mailSender.send(message);

        return true;
    }
}

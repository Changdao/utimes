package com.utimes.study.service;

/**
 * Created by nevernew on 14-5-1.
 */
public interface MailService {

    public boolean sendService(String from, String dest, String topic, String content);
}

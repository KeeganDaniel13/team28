package com.example.chuck.ciroapp;

/**
 * Created by chuck on 16/07/25.
 */
public class Messages {

    private String title, textmessage,textTime;

    public Messages(){}

    public Messages(String title, String textmessage) {
        this.title = title;
        this.textmessage = textmessage;

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTextmessage() {
        return textmessage;
    }

    public void setTextmessage(String textmessage) {
        this.textmessage = textmessage;
    }

}

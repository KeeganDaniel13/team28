package com.example.chuck.ciroapp;

import java.io.Serializable;

/**
 * Created by chuck on 16/07/28.
 */
public class Inventory implements Serializable {
    final String title;
    final String author;
    final String imageUrl;

    Inventory(final String title, final String author, final String imageUrl) {
        this.title = title;
        this.author = author;
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getImageUrl() {
        return imageUrl;
    }
}

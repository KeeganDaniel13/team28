package com.example.chuck.ciroapp;

import android.app.Activity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;
import java.util.ArrayList;

/**
 * Created by chuck on 16/08/07.
 */
public class Ownerships {
    public String title;
    public String description;
    public String status;

    public Ownerships(){}

    public static ArrayList<Ownerships> getRecipesFromFile(String filename, Activity activity){
        final ArrayList<Ownerships> ownershipList = new ArrayList<>();

        try {
            // Load data
            String jsonString = loadJsonFromAsset("ownerships.json", activity);
            JSONObject json = new JSONObject(jsonString);
            JSONArray recipes = json.getJSONArray("ownership");

            // Get Recipe objects from data
            for(int i = 0; i < recipes.length(); i++){
                Ownerships ownerships = new Ownerships();

                ownerships.title = recipes.getJSONObject(i).getString("title");
                ownerships.description = recipes.getJSONObject(i).getString("description");
                ownerships.status = recipes.getJSONObject(i).getString("dietLabel");

                ownershipList.add(ownerships);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return ownershipList;
    }

    private static String loadJsonFromAsset(String filename, Activity activity) {
        String json = null;

        try {
            InputStream is = activity.getAssets().open(filename);
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        }
        catch (java.io.IOException ex) {
            ex.printStackTrace();
            return null;
        }

        return json;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}

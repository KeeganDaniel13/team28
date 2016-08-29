package com.example.chuck.ciroapp;

import android.app.Activity;
import android.content.Context;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;
import java.util.ArrayList;

/**
 * Created by chuck on 16/07/27.
 */
public class Transfers {
    public String title;
    public String description;
    public String label;



    public static ArrayList<Transfers> getRecipesFromFile(String filename, Activity activity){
        final ArrayList<Transfers> transferList = new ArrayList<>();

        try {
            // Load data
            String jsonString = loadJsonFromAsset("transfers.json", activity);
            JSONObject json = new JSONObject(jsonString);
            JSONArray recipes = json.getJSONArray("transfers");

            // Get Recipe objects from data
            for(int i = 0; i < recipes.length(); i++){
                Transfers transfers = new Transfers();

                transfers.title = recipes.getJSONObject(i).getString("title");
                transfers.description = recipes.getJSONObject(i).getString("description");
                transfers.label = recipes.getJSONObject(i).getString("dietLabel");

                transferList.add(transfers);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return transferList;
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

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }


}

package com.example.chuck.ciroapp;

import android.app.Activity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;
import java.util.ArrayList;

/**
 * Created by chuck on 16/07/30.
 */
public class Traders {
    public String title;
    public String description;
    public String imageUrl;
    public String instructionUrl;
    public String label;
    public static ArrayList<Traders> getRecipesFromFile(String filename, Activity activity){
        final ArrayList<Traders> recipeList = new ArrayList<>();

        try {
            // Load data
            String jsonString = loadJsonFromAsset("traders.json", activity);
            JSONObject json = new JSONObject(jsonString);
            JSONArray recipes = json.getJSONArray("traders");

            // Get Recipe objects from data
            for(int i = 0; i < recipes.length(); i++){
                Traders traders = new Traders();

                traders.title = recipes.getJSONObject(i).getString("title");
                traders.description = recipes.getJSONObject(i).getString("description");
                traders.label = recipes.getJSONObject(i).getString("dietLabel");

                recipeList.add(traders);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return recipeList;
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


}

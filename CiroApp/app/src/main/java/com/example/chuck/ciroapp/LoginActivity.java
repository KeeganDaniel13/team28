package com.example.chuck.ciroapp;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class LoginActivity extends Activity {
    EditText username,password;
    String user="";
    String pass="";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        username = (EditText)findViewById(R.id.etUsername);
        password = (EditText)findViewById(R.id.etPassword);
        Button btnSignup = (Button) findViewById(R.id.btnSignIn);

        btnSignup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                new syncData().execute("http://192.168.8.104:2020/Service1.svc/login");
                //http://10.211.55.4:2020/Service1.svc/login
                onLogin();

            }
        });
    }
    public void onLogin(){
        user = username.getText().toString();
        pass = password.getText().toString();

    }
    private class syncData extends AsyncTask<String,Void,String> {
        ProgressDialog pDialog;

        @Override
        protected String doInBackground(String... strings) {
            String stream;
            String urlString = strings[0];
            Proxy proxyHandler = new Proxy();
            JSONObject sender = new JSONObject();
            JSONObject login = new JSONObject();
            try {
                login.put("name", user);
                login.put("password", pass);

                sender.put("login",login);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            stream = proxyHandler.sendPOST(urlString, sender);
            return stream;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

        }

        @Override
        protected void onPostExecute(String result) {

            JSONObject reader=null;
            JSONObject loginResult;


            if (result != null) {
                try {
                    reader = new JSONObject(result);

                    // Get the full HTTP Data as JSONObject
                    if (reader.isNull("loginResult"))
                    {
                        Toast.makeText(LoginActivity.this, "Incorrect combination of Username or Password,Try Again",
                                Toast.LENGTH_LONG).show();
                        return;
                    }
                    loginResult = (JSONObject) reader.get("loginResult");

                    if(loginResult!=null)
                    {


                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(i);
                        finish();
                       //Snackbar snackbar = Snackbar.make(findViewById(android.R.id.content), "Welcome to AndroidHive", Snackbar.LENGTH_LONG).show();

                        //snackbar.show();
                        Toast.makeText(LoginActivity.this, "Welcome, "+ username.getText().toString(),
                                Toast.LENGTH_LONG).show();
                    }








                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }


        }

    }
}


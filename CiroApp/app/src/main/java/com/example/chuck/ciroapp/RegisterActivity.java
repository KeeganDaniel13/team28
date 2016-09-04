package com.example.chuck.ciroapp;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterActivity extends AppCompatActivity {

    EditText username,password,email;
    String user="";
    String pass="";
    String mail="";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        username = (EditText)findViewById(R.id.RetUsername);
        password = (EditText)findViewById(R.id.RetPassword);
        email= (EditText)findViewById(R.id.RetPassword);
        Button btnRegister = (Button) findViewById(R.id.btnSignUp);
        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                new syncData().execute("");
                onSignup();

            }
        });

    }
    public void onSignup(){
        user = username.getText().toString();
        pass = password.getText().toString();
        mail = email.getText().toString();
    }
    private class syncData extends AsyncTask<String,Void,String> {
        ProgressDialog pDialog;

        @Override
        protected String doInBackground(String... strings) {
            String stream;
            String urlString = strings[0];
            Proxy proxyHandler = new Proxy();
            JSONObject sender = new JSONObject();
            try {
                sender.put("name", user);
                sender.put("password", pass);
                sender.put("email",mail);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            stream = proxyHandler.sendPOST(urlString, sender);
            return stream;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            pDialog = new ProgressDialog(RegisterActivity.this);
            pDialog.setMessage("Registering User");
            pDialog.setIndeterminate(false);
            pDialog.setCancelable(true);
            pDialog.show();
        }

        @Override
        protected void onPostExecute(String result) {

            JSONObject reader=null;
            if (result != null) {
                try {
                    reader = new JSONObject(result);
                    // Get the full HTTP Data as JSONObject
                    if(reader!=null)
                    {
                        Intent i = new Intent(getApplicationContext(), LoginActivity.class);
                        startActivity(i);
                        finish();
                        Toast.makeText(RegisterActivity.this, "User, "+ username.getText().toString()+" Successfully Registered",
                                Toast.LENGTH_LONG).show();
                    }
                    else
                    {
                        Toast.makeText(RegisterActivity.this, "Error occurred,Try Again",
                                Toast.LENGTH_LONG).show();

                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }


        }

    }
}

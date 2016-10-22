package app.ciro.chuck.betaapp;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Authenticator;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.PasswordAuthentication;
import java.net.URL;

/**
 * Created by chuck on 16/07/19.
 */
public class Proxy {

    public String sendGET(String str){
        try {
            URL url = new URL(str);
            System.out.println("URL created url");
            HttpURLConnection connector = (HttpURLConnection)url.openConnection();
            connector.setRequestMethod("GET");
            connector.setRequestProperty("Accept", "application/json");
            connector.setRequestProperty("Content-Type","application/json");
            connector.setRequestProperty("Content-Type","charset=utf-8");
            connector.setConnectTimeout(10000);
            connector.setReadTimeout(10000);
            Authenticator.setDefault(new ProxyAuthenticator("201473496", "201473496"));
            System.setProperty("http.proxyHost", "10.200.254.1");
            System.setProperty("http.proxyPort", "3128");
            //System.out.println("Connection failed ");

            connector.connect();
            System.out.println("Connection successful ");


            if (connector.getResponseCode() == 200) {
                System.out.println("Status " + connector.getResponseCode() + "header: \n" + connector.getHeaderFields());
                BufferedReader bf = new BufferedReader(new InputStreamReader(connector.getInputStream()));
                StringBuffer sb = new StringBuffer();
                String line;
                while ((line = bf.readLine()) != null) {
                    sb.append(line);
                }
                System.out.println(sb);
                return sb.toString();
            } else {

                System.out.println("Status " + connector.getResponseCode() + "header: \n" + connector.getHeaderFields());
                if (connector.getResponseCode() == 202) {
                    BufferedReader bf = new BufferedReader(new InputStreamReader(connector.getInputStream()));
                    StringBuffer sb = new StringBuffer();
                    String line;
                    while ((line = bf.readLine()) != null) {
                        sb.append(line);
                    }
                    System.out.println(sb);
                }


            }
        }catch(MalformedURLException e){
            e.printStackTrace();
        }
        catch(IOException e){
            e.printStackTrace();
        }
        return " ";
    }
    public String sendPOST(String str,JSONObject sender){
        try {
            URL url = new URL(str);
            System.out.println("URL created url");
            HttpURLConnection connector = (HttpURLConnection)url.openConnection();
            connector.setRequestMethod("POST");
            connector.setRequestProperty("Accept", "application/json");
            connector.setRequestProperty("Content-Type","application/json");
            //Authenticator.setDefault(new ProxyAuthenticator("201473496", "201473496"));
            //System.setProperty("http.proxyHost", "10.200.254.1");
           // System.setProperty("http.proxyPort", "3128");
            //System.out.println("Connection successful ");
            //connector.setRequestProperty("Content-Type","charset=utf-8");

            // String urlParameters = "name=chuck&surname=mulatto";
            //JSONObject sender = new JSONObject();
            //sender.put("name","chuck");
            //sender.put("password","pass");

            // Send post request
            connector.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(connector.getOutputStream());
            wr.writeBytes(sender.toString());
            wr.flush();
            wr.close();
            connector.setConnectTimeout(10000);
            connector.setReadTimeout(10000);
            connector.connect();
            int responseCode = connector.getResponseCode();

            System.out.println(responseCode);
            if (connector.getResponseCode() == 200) {
                System.out.println("Status " + connector.getResponseCode() + "headers: \n" + connector.getHeaderFields());
                BufferedReader bf = new BufferedReader(new InputStreamReader(connector.getInputStream()));
                StringBuffer sb = new StringBuffer();
                String line;
                while ((line = bf.readLine()) != null) {
                    sb.append(line);
                }
                System.out.println(sb);
                return sb.toString();
            } else {

                System.out.println("Status " + connector.getResponseCode() + "header: \n" + connector.getHeaderFields());
                if (connector.getResponseCode() == 202) {
                    BufferedReader bf = new BufferedReader(new InputStreamReader(connector.getInputStream()));
                    StringBuffer sb = new StringBuffer();
                    String line;
                    while ((line = bf.readLine()) != null) {
                        sb.append(line);
                    }
                    System.out.println(sb);
                }


            }
        }catch(MalformedURLException e){
            e.printStackTrace();
        }
        catch(IOException e){
            e.printStackTrace();
        }
        return " ";
    }

}


class ProxyAuthenticator extends Authenticator {
    private String user, password;

    public ProxyAuthenticator(String user, String password) {
        this.user = user;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, password.toCharArray());
    }

}

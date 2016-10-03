package app.ciro.chuck.betaapp;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.provider.Settings;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class IncidentsActivity extends AppCompatActivity {

    private ImageButton capture ;
    private ImageView imgPreview;
    private static final int CAMERA_CAPTURE_IMAGE_REQUEST_CODE=100;
    private static final String IMAGE_DIRECTORY="hello";
    public static final int MEDIA_TYPE_IMAGE = 1;
    private Uri fileUri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.incidents_layout);

        capture = (ImageButton) findViewById(R.id.btnCapture);
        imgPreview = (ImageView) findViewById(R.id.myIV);

        capture.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.out.println("Yeahs");
                captureImage();
            }
        });

    }

    private boolean isDeviceSupportCam(){
        if(getApplicationContext().getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA))
        {
            return true;
        }else
        {
            return false;
        }
    }

    private void captureImage(){
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        fileUri = getOutputMediaFileUri(MEDIA_TYPE_IMAGE);
        intent.putExtra(MediaStore.EXTRA_OUTPUT,fileUri);
        startActivityForResult(intent,CAMERA_CAPTURE_IMAGE_REQUEST_CODE);
    }

    private void previewCaturedImage(){
        try{
            imgPreview.setVisibility(View.VISIBLE);
            BitmapFactory.Options options = new BitmapFactory.Options();

            options.inSampleSize=8;
            final Bitmap bitmap = BitmapFactory.decodeFile(fileUri.getPath(),options);

            imgPreview.setImageBitmap(bitmap);
        }catch (NullPointerException e){
            e.printStackTrace();
        }
    }

    public static File getOutputMediaFile(int type){
        File mediaStorage=new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),IMAGE_DIRECTORY);
        if(!mediaStorage.exists()){
            if (!mediaStorage.mkdirs()) {
                Log.d(IMAGE_DIRECTORY, "Oops! Failed to create" + IMAGE_DIRECTORY + " directory");

                return null;
            }
        }

        String timestamp= new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(new Date());

        File mediaFile;
        if(type==MEDIA_TYPE_IMAGE){
            mediaFile= new File(mediaStorage.getPath() + File.separator+"IMG_"+timestamp+".jpg");

        }else{
            return null;
        }
        return mediaFile;
    }


    public Uri getOutputMediaFileUri(int type){
        return Uri.fromFile(getOutputMediaFile(type));
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(requestCode==CAMERA_CAPTURE_IMAGE_REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                previewCaturedImage();


            } else if (requestCode == RESULT_CANCELED) {
                Toast.makeText(getApplicationContext(), "Image capture cacelled", Toast.LENGTH_SHORT).show();

            } else {
                Toast.makeText(getApplicationContext(), "Sorry! Failed to capture image", Toast.LENGTH_SHORT).show();
            }
        }

    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelable("file_uri",fileUri);
    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        fileUri=savedInstanceState.getParcelable("file_uri");
    }
}

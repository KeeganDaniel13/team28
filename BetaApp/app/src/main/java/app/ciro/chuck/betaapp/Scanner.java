package app.ciro.chuck.betaapp;


import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;


/**
 * A simple {@link Fragment} subclass.
 */
public class Scanner extends Fragment {


    public Scanner() {
        // Required empty public constructor
    }

    TextView btnScanner;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        // Inflate the layout for this fragment
        View v =inflater.inflate(R.layout.scanner_layout, container, false);
        btnScanner=(TextView) v.findViewById(R.id.btnscan);

        btnScanner.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(),ScannerActivity.class);
                startActivity(intent);
            }
        });
        return v;
    }

}

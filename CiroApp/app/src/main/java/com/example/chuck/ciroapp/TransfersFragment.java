package com.example.chuck.ciroapp;


import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTabHost;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TabHost;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class TransfersFragment extends Fragment {

    public TransfersFragment() {
        // Required empty public constructor
    }
    public static final String TAG = TransfersFragment.class.getSimpleName();

    private ListView mListView;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_transfers,container, false);
        // Get data to display
        final ArrayList<Transfers> recipeList = Transfers.getRecipesFromFile("transfers.json", getActivity());

        // Create adapter
        TransferAdapter adapter = new TransferAdapter(getActivity(), recipeList);

        // Create list view
        mListView = (ListView) rootView.findViewById(R.id.transfer_list_view);
        mListView.setAdapter(adapter);

        // Set what happens when a list view item is clicked
        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Transfers selectedTrasnfer = recipeList.get(position);

                //Intent detailIntent = new Intent(getActivity(), RecipeDetailActivity.class);


                //startActivity(detailIntent);
            }
        });
        return rootView;

    }


}

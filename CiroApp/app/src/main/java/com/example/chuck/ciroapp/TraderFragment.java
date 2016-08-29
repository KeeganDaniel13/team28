package com.example.chuck.ciroapp;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class TraderFragment extends Fragment {


    public TraderFragment() {
        // Required empty public constructor
    }
    public static final String TAG = TraderFragment.class.getSimpleName();

    private ListView mListView;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_trader,container, false);
        // Get data to display
        final ArrayList<Traders> recipeList = Traders.getRecipesFromFile("traders.json", getActivity());

        // Create adapter
        TraderAdapter adapter = new TraderAdapter(getActivity(), recipeList);

        // Create list view
        mListView = (ListView) rootView.findViewById(R.id.recipe_list_view);
        mListView.setAdapter(adapter);

        // Set what happens when a list view item is clicked
        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Traders selectedTrasnfer = recipeList.get(position);

                //Intent detailIntent = new Intent(getActivity(), RecipeDetailActivity.class);


                //startActivity(detailIntent);
            }
        });
        return rootView;
    }

}

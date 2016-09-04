package com.example.chuck.ciroapp;


import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 */
public class OwnershipFragment extends Fragment {



    public static final String TAG = OwnershipFragment.class.getSimpleName();

    private ListView mListView;

    public OwnershipFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_ownership, container, false);

        final ArrayList<Ownerships> ownershipList = Ownerships.getRecipesFromFile("recipes.json", getActivity());

        OwnershipsAdapter ownershipsAdapter = new OwnershipsAdapter(getActivity(), ownershipList);

        // Create list view
        mListView = (ListView) rootView.findViewById(R.id.ownership_list_view);
        mListView.setAdapter(ownershipsAdapter);
        // Set what happens when a list view item is clicked
        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Ownerships selectedChange = ownershipList.get(position);
                Toast.makeText(getActivity(), selectedChange.getTitle() + " is selected!", Toast.LENGTH_SHORT).show();
                //Intent detailIntent = new Intent(getActivity(), RecipeDetailActivity.class);

            }
        });


        return rootView;
    }
}

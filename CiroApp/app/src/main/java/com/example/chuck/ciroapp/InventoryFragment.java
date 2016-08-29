package com.example.chuck.ciroapp;


import android.app.ActivityOptions;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 */
public class InventoryFragment extends Fragment {

    public static final String TAG = TransfersFragment.class.getSimpleName();

    private List<Inventory> inventoryList = new ArrayList<>();
    private RecyclerView recyclerView;
    private InventoryAdapter iAdapter;

    public InventoryFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView =  inflater.inflate(R.layout.fragment_inventory, container, false);
        recyclerView = (RecyclerView) rootView.findViewById(R.id.recycler_view);


        iAdapter = new InventoryAdapter(inventoryList);
        recyclerView.setHasFixedSize(true);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.addItemDecoration(new DividerItemDeco(getActivity(), LinearLayoutManager.VERTICAL));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(iAdapter);

        recyclerView.addOnItemTouchListener(new RecyclerTouchListener(getActivity(), recyclerView, new ClickListener() {
            @Override
            public void onClick(View view, int position) {
                Inventory inventory = inventoryList.get(position);
                Toast.makeText(getActivity(), inventory.getTitle() + " is selected!", Toast.LENGTH_SHORT).show();


            }

            @Override
            public void onLongClick(View view, int position) {

            }
        }));



        createData();
        return rootView;

    }
    private void navigateToDetails(final Inventory inventory, final View inventoryView) {
        final ActivityOptions options =
                ActivityOptions.makeSceneTransitionAnimation(getActivity(), inventoryView, inventoryView.getTransitionName());
        final Intent i = new Intent(getActivity(), InventoryDetails.class);
        startActivity(i, options.toBundle());

    }

    private void createData() {

                Inventory inventory= new Inventory("Accord Plus", "WV-76BLK", "http://i.imgur.com/dyyP2iO.jpg");
                inventoryList.add(inventory);
         inventory=new Inventory("Best Fine Foods", "WV-76BLK", "http://i.imgur.com/da6QIlR.jpg");
        inventoryList.add(inventory);
        inventory=new Inventory("Costra Contracting", "FV-75DK", "http://i.imgur.com/YHoOJh4.jpg");
        inventoryList.add(inventory);
        inventory= new Inventory("Design Kitchens", "BV-08LYK", "http://i.imgur.com/3jxqrKP.jpg");
        inventoryList.add(inventory);
        inventory= new Inventory("Microsoft", "DV-34BLK", "http://i.imgur.com/AZRynvM.jpg");
        inventoryList.add(inventory);
        inventory=new Inventory("Group 5", "EF-55RTK", "http://i.imgur.com/IvhOJcw.jpg");
        inventoryList.add(inventory);
        inventory=new Inventory("MRP Mechanical", "4V-5MLK", "http://i.imgur.com/pxgI1b4.png");
        inventoryList.add(inventory);
        inventory=new Inventory("R&G Interior ", "WV-32ELK", "http://i.imgur.com/oT1WYX9.jpg");
        inventoryList.add(inventory);
        inventory=new Inventory("INC Construction", "WD-7FLK", "http://i.imgur.com/CLLDz.jpg");
        inventory=new Inventory("Plains In The Night", "QV-455LK", "http://i.imgur.com/7MrSvXE.jpg?1");
        inventoryList.add(inventory);
        inventory=new Inventory("Seewood and Co.", "RV-56GLK", "http://i.imgur.com/3mkUuux.jpg");
        inventoryList.add(inventory);
        inventory=new Inventory("Midsoft UK.", "VB-5HBLK", "http://i.imgur.com/LzYAfFL.jpg");
        inventoryList.add(inventory);
    }
    public static class RecyclerTouchListener implements RecyclerView.OnItemTouchListener {

        private GestureDetector gestureDetector;
        private InventoryFragment.ClickListener clickListener;

        public RecyclerTouchListener(Context context, final RecyclerView recyclerView, final InventoryFragment.ClickListener clickListener) {
            this.clickListener = clickListener;
            gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onSingleTapUp(MotionEvent e) {
                    return true;
                }

                @Override
                public void onLongPress(MotionEvent e) {
                    View child = recyclerView.findChildViewUnder(e.getX(), e.getY());
                    if (child != null && clickListener != null) {
                        clickListener.onLongClick(child, recyclerView.getChildPosition(child));
                    }
                }
            });
        }

        @Override
        public boolean onInterceptTouchEvent(RecyclerView rv, MotionEvent e) {

            View child = rv.findChildViewUnder(e.getX(), e.getY());
            if (child != null && clickListener != null && gestureDetector.onTouchEvent(e)) {
                clickListener.onClick(child, rv.getChildPosition(child));
            }
            return false;
        }

        @Override
        public void onTouchEvent(RecyclerView rv, MotionEvent e) {
        }

        @Override
        public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {

        }
    }

    public interface ClickListener {
        void onClick(View view, int position);

        void onLongClick(View view, int position);
    }


}

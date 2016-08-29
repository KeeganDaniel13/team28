package com.example.chuck.ciroapp;

import android.content.Context;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.GestureDetector;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MessagesActivtity extends AppCompatActivity {
    private List<Messages> messagesList = new ArrayList<>();
    private RecyclerView recyclerView;
    private MessagesAdapter mAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_messages_activtity);
        prepareMessagesData();
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view1);
        mAdapter = new MessagesAdapter(messagesList);
        getSupportActionBar().setTitle("Messages");
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(true);
      //  recyclerView.setHasFixedSize(true);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.addItemDecoration(new DividerItemDeco(getApplicationContext(), LinearLayoutManager.VERTICAL));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(mAdapter);
/*
        recyclerView.addOnItemTouchListener(new MessagesActivtity.RecyclerTouchListener(getApplicationContext(), recyclerView, new MessagesActivtity.ClickListener() {
            @Override
            public void onClick(View view, int position) {
                Messages messages = messagesList.get(position);
                Toast.makeText(getApplicationContext(), messages.getTitle() + " is selected!", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onLongClick(View view, int position) {

            }
        }));

*/


    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                NavUtils.navigateUpFromSameTask(this);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private void prepareMessagesData() {
        Messages messages = new Messages("Customs Official", "Package 109 looking suspicious");
        messagesList.add(messages);

        messages = new Messages("Admin", "Warehouse getting full, check it out!");
        messagesList.add(messages);

        messages = new Messages("Search Officer", "Risky client identified, packages being delivered");
        messagesList.add(messages);

        messages = new Messages("Customs Official", "Your request transfer is being assessed");
        messagesList.add(messages);

        messages = new Messages("Lanseria Port", "How is it going that side of the world");
        messagesList.add(messages);

        messages = new Messages("Admin", "Warehouse getting full, check it out!");
        messagesList.add(messages);

        messages = new Messages("Search Officer", "Risky client identified, packages being delivered");
        messagesList.add(messages);

        messages = new Messages("Customs Official", "Your request transfer is being assessed");
        messagesList.add(messages);

        messages = new Messages("Lanseria Port", "How is it going that side of the world");
        messagesList.add(messages);

        messages = new Messages("Admin", "Warehouse getting full, check it out!");
        messagesList.add(messages);

        messages = new Messages("Search Officer", "Risky client identified, packages being delivered");
        messagesList.add(messages);

        messages = new Messages("Customs Official", "Your request transfer is being assessed");
        messagesList.add(messages);

        messages = new Messages("Lanseria Port", "How is it going that side of the world");
        messagesList.add(messages);

//        mAdapter.notifyDataSetChanged();
    }

    public static class RecyclerTouchListener implements RecyclerView.OnItemTouchListener {

        private GestureDetector gestureDetector;
        private MessagesActivtity.ClickListener clickListener;

        public RecyclerTouchListener(Context context, final RecyclerView recyclerView, final MessagesActivtity.ClickListener clickListener) {
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

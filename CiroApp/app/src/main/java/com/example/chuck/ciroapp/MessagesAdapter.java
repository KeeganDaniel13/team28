package com.example.chuck.ciroapp;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by chuck on 16/07/25.
 */
public class MessagesAdapter extends RecyclerView.Adapter<MessagesAdapter.MyViewHolder>{

    private List<Messages> messagesList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView title, textmessage,textTime;

        public MyViewHolder(View view) {
            super(view);
            title = (TextView) view.findViewById(R.id.titles);
            textmessage = (TextView) view.findViewById(R.id.date);
            //textTime = (TextView) view.findViewById(R.id.date);
        }
    }

    public MessagesAdapter(List<Messages> messagesList) {
        this.messagesList = messagesList;
    }


    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType)
    {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.messages_row, parent, false);

        return new MyViewHolder(itemView);

    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Messages messages = messagesList.get(position);
        holder.title.setText(messages.getTitle());
        holder.textmessage.setText(messages.getTextmessage());
        //holder.textmessage.setText(messages.getTextTime());
    }

    @Override
    public int getItemCount() {
        return messagesList.size();
    }



}

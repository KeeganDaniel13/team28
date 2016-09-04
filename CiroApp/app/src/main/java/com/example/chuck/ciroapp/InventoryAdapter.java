package com.example.chuck.ciroapp;

import android.app.Activity;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by chuck on 16/07/28.
 */
public class InventoryAdapter extends RecyclerView.Adapter<InventoryAdapter.MyViewHolder>{
    private List<Inventory> inventoryList;


    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView title, descriptions;
        public ImageView imageView;
        public MyViewHolder(View view) {
            super(view);
            title = (TextView) view.findViewById(R.id.title);
            descriptions = (TextView) view.findViewById(R.id.desciptions);
            imageView = (ImageView) view.findViewById(R.id.images);
            //textTime = (TextView) view.findViewById(R.id.date);
        }
    }
    public InventoryAdapter(List<Inventory> inventoryList) {

        this.inventoryList = inventoryList;


    }

    @Override
    public InventoryAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.simple_card_item, parent, false);

        return new MyViewHolder(itemView);

    }

    @Override
    public void onBindViewHolder(InventoryAdapter.MyViewHolder holder, int position) {
        final Inventory inventory= inventoryList.get(position);
        holder.title.setText(inventory.getTitle());
        holder.descriptions.setText(inventory.getAuthor());
        holder.imageView.setImageBitmap(null);
        //Picasso.with(holder.imageView.getContext()).cancelRequest(holder.imageView);
        //Picasso.with(holder.imageView.getContext()).load(inventory.getImageUrl()).into(holder.imageView);
        //holder.itemView.setTag(inventory);



    }

    @Override
    public int getItemCount() {
        return inventoryList.size();
    }


}

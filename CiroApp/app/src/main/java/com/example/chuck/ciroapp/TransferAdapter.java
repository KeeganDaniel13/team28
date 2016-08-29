package com.example.chuck.ciroapp;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by chuck on 16/07/27.
 */
public class TransferAdapter extends BaseAdapter {

    public static final String TAG = TransferAdapter.class.getSimpleName();
    private Context mContext;
    private LayoutInflater mInflater;
    private ArrayList<Transfers> mDataSource;


    public TransferAdapter(Context context, ArrayList<Transfers> items) {
        mContext = context;
        mDataSource = items;
        mInflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getCount() {
        return mDataSource.size();
    }

    @Override
    public Object getItem(int position) {
        return mDataSource.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        // check if the view already exists if so, no need to inflate and findViewById again!
        if (convertView == null) {

            // Inflate the custom row layout from your XML.
            convertView = mInflater.inflate(R.layout.item_recycler, parent, false);

            // create a new "Holder" with subviews
            holder = new ViewHolder();
            holder.thumbnailImageView = (ImageView) convertView.findViewById(R.id.image1);
            holder.titleTextView = (TextView) convertView.findViewById(R.id.TransferName);
            holder.locationTextView = (TextView) convertView.findViewById(R.id.locatioName);
            holder.destinationTextView = (TextView) convertView.findViewById(R.id.destinationName);

            // hang onto this holder for future recyclage
            convertView.setTag(holder);
        }
        else {


            holder = (ViewHolder) convertView.getTag();
        }


        TextView titleTextView = holder.titleTextView;
        TextView locationTextView = holder.locationTextView;
        TextView destinationTextView = holder.destinationTextView;
        ImageView thumbnailImageView = holder.thumbnailImageView;


        Transfers transfers = (Transfers) getItem(position);


        titleTextView.setText(transfers.title);
        locationTextView.setText(transfers.description);
        destinationTextView.setText(transfers.label);
        thumbnailImageView.setImageResource(R.drawable.male);



        return convertView;

    }
    private static class ViewHolder {
        public TextView titleTextView;
        public TextView locationTextView;
        public TextView destinationTextView;
        public ImageView thumbnailImageView;
    }

}

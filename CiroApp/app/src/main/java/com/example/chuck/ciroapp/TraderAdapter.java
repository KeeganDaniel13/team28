package com.example.chuck.ciroapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by chuck on 16/07/30.
 */
public class TraderAdapter extends BaseAdapter {
    public static final String TAG = TraderAdapter.class.getSimpleName();
    /*
    public static final HashMap<String, Integer> LABEL_COLORS = new HashMap<String, Integer>()
    {{
        put("Low-Carb", R.color.colorLowCarb);
        put("Low-Fat", R.color.colorLowFat);
        put("Low-Sodium", R.color.colorLowSodium);
        put("Medium-Carb", R.color.colorMediumCarb);
        put("Vegetarian", R.color.colorVegetarian);
        put("Balanced", R.color.colorBalanced);
    }};
    */
    private Context mContext;
    private LayoutInflater mInflater;
    private ArrayList<Traders> mDataSource;


    public TraderAdapter(Context context, ArrayList<Traders> items) {
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
            convertView = mInflater.inflate(R.layout.trader_row, parent, false);

            // create a new "Holder" with subviews
            holder = new ViewHolder();
            holder.thumbnailImageView = (ImageView) convertView.findViewById(R.id.TraderImage);
            holder.titleTextView = (TextView) convertView.findViewById(R.id.TraderName);
            holder.subtitleTextView = (TextView) convertView.findViewById(R.id.TraderLocation);


            // hang onto this holder for future recyclage
            convertView.setTag(holder);
        }
        else {

            // skip all the expensive inflation/findViewById and just get the holder you already made
            holder = (ViewHolder) convertView.getTag();
        }

        // Get relevant subviews of row view
        TextView titleTextView = holder.titleTextView;
        TextView subtitleTextView = holder.subtitleTextView;
      //  TextView detailTextView = holder.detailTextView;
        ImageView thumbnailImageView = holder.thumbnailImageView;

        Traders traders = (Traders) getItem(position);

        titleTextView.setText(traders.title);
        subtitleTextView.setText(traders.description);
      // detailTextView.setText(traders.label);
        thumbnailImageView.setImageResource(R.drawable.male);



        return convertView;

    }
    private static class ViewHolder {
        public TextView titleTextView;
        public TextView subtitleTextView;
      //  public TextView detailTextView;
        public ImageView thumbnailImageView;
    }
}

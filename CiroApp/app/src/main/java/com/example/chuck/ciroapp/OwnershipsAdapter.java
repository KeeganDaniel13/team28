package com.example.chuck.ciroapp;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by chuck on 16/08/07.
 */
public class OwnershipsAdapter extends BaseAdapter {
    public static final String TAG = OwnershipsAdapter.class.getSimpleName();

    private Context mContext;
    private LayoutInflater mInflater;
    private ArrayList<Ownerships> mDataSource;


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

    public OwnershipsAdapter(Context context, ArrayList<Ownerships> items) {
        mContext = context;
        mDataSource = items;
        mInflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        if (convertView == null) {

            convertView = mInflater.inflate(R.layout.ownership_row, parent, false);
            holder = new ViewHolder();

            holder.thumbnailImageView = (ImageView) convertView.findViewById(R.id.Oimage);
            holder.titleTextView = (TextView) convertView.findViewById(R.id.Oname);
            holder.DetailTextView = (TextView) convertView.findViewById(R.id.Odetails);
            holder.StatusTextView = (TextView) convertView.findViewById(R.id.Ostatus);

            convertView.setTag(holder);

        }
        else {
            holder = (ViewHolder) convertView.getTag();
        }
        // Get relevant subviews of row view
        TextView titleTextView = holder.titleTextView;
        TextView statusTextView = holder.StatusTextView;
        TextView detailTextView = holder.DetailTextView;
        ImageView thumbnailImageView = holder.thumbnailImageView;

        Ownerships ownerships = (Ownerships) getItem(position);

        titleTextView.setText(ownerships.title);
        statusTextView.setText(ownerships.description);
        detailTextView.setText(ownerships.status);
        thumbnailImageView.setImageResource(R.drawable.male);
        return convertView;
    }
    public static class ViewHolder  {
        TextView titleTextView ;
        TextView DetailTextView;
        TextView StatusTextView ;
        ImageView thumbnailImageView;
    }

}

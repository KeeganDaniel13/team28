package com.example.chuck.ciroapp;


import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;


/**
 * A simple {@link Fragment} subclass.
 */
public class TransferDetailFragment extends Fragment implements OnMapReadyCallback{

    SupportMapFragment mapFragment;
    GoogleMap googleMap;
    LatLng latLng;
    Marker currLocationMarker;

    public TransferDetailFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView= inflater.inflate(R.layout.fragment_transfersdetail, container, false);
        mapFragment = ((SupportMapFragment) getChildFragmentManager().findFragmentById(R.id.map));
        mapFragment.getMapAsync(this);

        return rootView;


    }
    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setUpMapIfNeeded();
    }

    private void setUpMapIfNeeded() {
        // Do a null check to confirm that we have not already instantiated the map.
        if (mapFragment == null) {
            mapFragment = ((SupportMapFragment) getChildFragmentManager().findFragmentById(R.id.map));
            // Check if we were successful in obtaining the map.
            if (mapFragment != null) {
                mapFragment.getMapAsync(new OnMapReadyCallback() {
                    @Override
                    public void onMapReady(GoogleMap map) {
                        onMapReady(map);
                    }
                });
            }
        }
    }

    // The Map is verified. It is now safe to manipulate the map.
    /*
    private void loadMap(GoogleMap googleMap) {
        if (googleMap != null) {
            // Use green marker icon
            BitmapDescriptor defaultMarker = BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE);
            // listingPosition is a LatLng point
            LatLng sceneryPosition = new LatLng(44.22438242, 6.944561);
            // Create the marker on the fragment
            mapFragment.getMapAsync().addMarker(new MarkerOptions()
                    .position(sceneryPosition)
                    .icon(defaultMarker));
        }
    }
*/

    @Override
    public void onMapReady(GoogleMap googleMap) {
        if (googleMap != null) {
            // Use green marker icon
            BitmapDescriptor defaultMarker = BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE);
            // listingPosition is a LatLng point
            LatLng sceneryPosition = new LatLng(44.22438242, 6.944561);
            // Create the marker on the fragment

            try {
                googleMap.setMyLocationEnabled(true);
                googleMap.addMarker(new MarkerOptions().position(sceneryPosition).icon(defaultMarker));
               googleMap.moveCamera(CameraUpdateFactory.newLatLng(sceneryPosition));
               // googleMap.addMarker(new MarkerOptions().position(sceneryPosition).icon(defaultMarker));
            } catch (SecurityException e) {
                e.printStackTrace(); // lets the user know there is a problem with the gps
            }

        }
    }


}

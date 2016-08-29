package com.example.chuck.ciroapp;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentStatePagerAdapter;

/**
 * Created by chuck on 16/08/09.
 */
public class ViewPagerAdapter extends FragmentPagerAdapter {
    final int PAGE_COUNT = 2;
    // Tab Titles
    private String tabtitles[] = new String[] { "Ownerships", "Transfers" };
    Context context;

    public ViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public int getCount() {
        return PAGE_COUNT;
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {

            // Open FragmentTab1.java
            case 0:
                OwnershipFragment ownershipFragment = new OwnershipFragment();
                return ownershipFragment;

            // Open FragmentTab2.java
            case 1:
                //TransfersFragment transfersFragment = new TransfersFragment();
                //return transfersFragment;


        }
        return null;
    }

    @Override
    public CharSequence getPageTitle(int position) {
        return tabtitles[position];
    }
}

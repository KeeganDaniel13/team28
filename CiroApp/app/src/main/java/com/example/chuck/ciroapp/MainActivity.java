package com.example.chuck.ciroapp;

import android.app.ActionBar;
import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SearchView;
import android.widget.TextView;

import com.roughike.bottombar.BottomBar;
import com.roughike.bottombar.OnMenuTabClickListener;

public class MainActivity extends AppCompatActivity {
    // action bar
   // private ActionBar actionBar;
    private BottomBar mBottomBar;
    // Refresh menu item
    private MenuItem refreshMenuItem;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mBottomBar = BottomBar.attach(this, savedInstanceState);
        mBottomBar.setItems(R.menu.bottombar_menu);
        mBottomBar.setOnMenuTabClickListener(new OnMenuTabClickListener() {
            @Override
            public void onMenuTabSelected(@IdRes int menuItemId) {
                if (menuItemId == R.id.bottomBarItemOne) {
                    // The user selected item number one.
                    FeedFragment feedFragment = new FeedFragment();
                    getSupportFragmentManager().beginTransaction().replace(R.id.content_id,feedFragment).commit();
                    getSupportActionBar().setTitle("Feed");
                }
                if (menuItemId == R.id.bottomBarItemTwo) {
                    // The user selected item number one.
                    TraderFragment traderFragment = new TraderFragment();
                    getSupportFragmentManager().beginTransaction().replace(R.id.content_id,traderFragment).commit();
                    getSupportActionBar().setTitle("Traders");
                }
                if (menuItemId == R.id.bottomBarItemThree) {
                    // The user selected item number one.
                    ScanFragment scanFragment = new ScanFragment();
                    getSupportFragmentManager().beginTransaction().replace(R.id.content_id,scanFragment).commit();
                    getSupportActionBar().setTitle("Scan Goods");
                }
                if (menuItemId == R.id.bottomBarItemFour) {
                    // The user selected item number one.
                    InventoryFragment inventoryFragment = new InventoryFragment();
                    getSupportFragmentManager().beginTransaction().replace(R.id.content_id,inventoryFragment).commit();
                    getSupportActionBar().setTitle("Inventory");
                }
                if (menuItemId == R.id.bottomBarItemFive) {
                    // The user selected item number one.
                    ReportsFragment reportsFragment = new ReportsFragment();
                    getSupportFragmentManager().beginTransaction().replace(R.id.content_id,reportsFragment).commit();
                    getSupportActionBar().setTitle("Reports");
                }
            }

            @Override
            public void onMenuTabReSelected(@IdRes int menuItemId) {
                if (menuItemId == R.id.bottomBarItemOne) {
                    // The user reselected item number one, scroll your content to top.
                }
            }

        });

        // Setting colors for different tabs when there's more than three of them.
        // You can set colors for tabs in three different ways as shown below.
        mBottomBar.mapColorForTab(0, ContextCompat.getColor(this, R.color.colorPrimary));
        mBottomBar.mapColorForTab(1, ContextCompat.getColor(this, R.color.colorPrimary));
        mBottomBar.mapColorForTab(2, ContextCompat.getColor(this, R.color.colorPrimary));
        mBottomBar.mapColorForTab(3, ContextCompat.getColor(this, R.color.colorPrimary));
        mBottomBar.mapColorForTab(4, ContextCompat.getColor(this, R.color.colorPrimary));


    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main, menu);

        return super.onCreateOptionsMenu(menu);
    }

    /**
     * On selecting action bar icons
     * */
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Take appropriate action for each action item click
        switch (item.getItemId()) {
            case R.id.action_messages:
                // search action

                Intent intMess = new Intent(this, MessagesActivtity.class);
                this.startActivity(intMess);

                break;
            case R.id.action_activities:
                // check for updates action

                Intent intent = new Intent(this, ReportIncidentActivity.class);
                this.startActivity(intent);

                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }

    public boolean onNavigationItemSelected(int itemPosition, long itemId) {
        return false;
    }
}


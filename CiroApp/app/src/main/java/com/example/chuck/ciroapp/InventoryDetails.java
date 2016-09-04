package com.example.chuck.ciroapp;

import android.animation.Animator;
import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by chuck on 16/07/28.
 */
public class InventoryDetails extends AppCompatActivity {
/*
    public static final String EXTRA_ARTICLE = "inventory";

    @BindView(R.id.toolbar)
    Toolbar mToolbar;

    @BindView(R.id.title)
    TextView mTitle;

    @BindView(R.id.date)
    TextView mDate;

    @BindView(R.id.dark_title)
    TextView mDarkTitle;

    @BindView(R.id.dark_date)
    TextView mDarkDate;

    @BindView(R.id.header)
    ImageView mHeader;

    @BindView(R.id.toolbar_layout)
    CollapsingToolbarLayout mToolbarLayout;

    @BindView(R.id.dark_title_container)
    FrameLayout mDarkTitleContainer;

    @BindView(R.id.dark_title_content)
    LinearLayout mDarkTitleContent;

    @BindView(R.id.detail)
    TextView mDetail;

    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inventorydetail);
        ButterKnife.bind(this);
        setSupportActionBar(mToolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        bindArticleDatas();

        beginEnterTransition();
    }
    @Override
    public View onCreateView(String name, Context context, AttributeSet attrs) {
        return super.onCreateView(name, context, attrs);
    }

    @Override
    public boolean onCreateOptionsMenu(final Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    private void beginEnterTransition() {
        mHeader.post(new Runnable() {
            @Override
            public void run() {

                final Animator circularReveal = ViewAnimationUtils.createCircularReveal(mHeader, mHeader.getWidth() / 2, 0, 0, mHeader.getWidth());
                circularReveal.setInterpolator(new AccelerateInterpolator(1.5f));
                circularReveal.setDuration(500);
                circularReveal.start();

                mDarkTitleContent.startAnimation(AnimationUtils.loadAnimation(InventoryDetails.this, R.anim.translatedownandfadein));
                mDarkTitleContainer.startAnimation(AnimationUtils.loadAnimation(InventoryDetails.this, R.anim.scaleheight));
                mDetail.startAnimation(AnimationUtils.loadAnimation(InventoryDetails.this, R.anim.fadein));

            }
        });
    }

    private void bindArticleDatas() {
        final Inventory inventory = (Inventory) getIntent().getExtras().get(EXTRA_ARTICLE);
        mHeader.setImageResource(R.drawable.header1);
        mTitle.setText(inventory.getTitle());
        mDarkTitle.setText(inventory.getTitle());
        mDate.setText(inventory.getAuthor());
        mDarkDate.setText(inventory.getAuthor());
    }

*/
}

package com.pulsatehq.cordova;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.multidex.MultiDex;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import com.pulsatehq.internal.Pulsate;
import com.pulsatehq.internal.PulsateApp;
import com.pulsatehq.external.pulsate.factory.PulsateFactory;
import com.pulsatehq.external.pulsate.manager.IPulsateManager;

/**
 * Created by adrian on 29/10/16.
 */

public class MyApplication extends PulsateApp {

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(base);
    }

    @Override
    public void onCreate() {
        super.onCreate();
        Pulsate.install(this);
        getPulsate();
    }

    public IPulsateManager getPulsate() {
        return PulsateFactory.getInstance();
    }
}

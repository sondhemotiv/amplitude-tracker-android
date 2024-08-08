package com.emotiv.consumerapp;

import android.util.Log;
import org.qtproject.qt.android.bindings.QtActivity;
import android.os.Bundle;
import com.amplitude.android.Amplitude;
import com.amplitude.core.Configuration;
import com.amplitude.core.events.Identify;

public class MainActivity extends QtActivity {

    private static final String TAG = "MainActivity";
    private static final String AMPLITUDE_API_KEY = "a0aa0c5a63758c5a231377a7e6a84648";
    private static Amplitude client;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.d(TAG, "onCreate");

        client = new Amplitude(new Configuration(
            AMPLITUDE_API_KEY,
            getApplicationContext()
        ));

        Identify identify = new Identify().set("user-platform", "android");
        client.identify(identify);
    }

    public static void trackEvent(String eventName) {
        // Log the event tracking
        Log.d(TAG, "Tracking event: " + eventName);

        if (client != null) {
            client.logEvent(eventName);
        }
    }
}

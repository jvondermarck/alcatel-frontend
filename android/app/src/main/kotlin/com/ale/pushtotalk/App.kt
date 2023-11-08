package com.ale.pushtotalk

import android.util.Log
import com.ale.rainbow.RBLog
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.app.FlutterApplication
import org.tinylog.Level


class App : FlutterApplication() {
    private val applicationID = "6ec7a6107e7711eeb0c4e7a30078a6db"
    private val applicationSecret =
        "dqZCG1tONopzjXnU8MHRol1dkBbtwJebdoB73gZTwLWBbwhngWCRMZwtENeBdvrf"

    override fun onCreate() {
        super.onCreate()
        RainbowSdk.instance().initialize(this, applicationID, applicationSecret);
        RBLog.setLevel(Level.WARN);
        Log.d("RainbowSdk", "onCreate: ${RainbowSdk.instance().isInitialized}");
        RainbowSdk.instance().push().activate(this);
    }
    companion object {

        fun getRainbowSdkInstance(): RainbowSdk {
            return RainbowSdk.instance();
        }
    }

}
package com.ale.pushtotalk

import android.util.Log
import com.ale.rainbow.RBLog
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.app.FlutterApplication
import org.tinylog.Level


class App : FlutterApplication() {
    private val rainbowService = RainbowService()
    companion object {

        fun getRainbowSdkInstance(): RainbowSdk {
            return RainbowSdk.instance();
        }
    }

    private val applicationID = "c40a10407e6311eeb0c4e7a30078a6db"
    private val applicationSecret =
        "NTo25SAvcOKf00TnamieEVWuei5V1HiS9dCtr8sfXPil3MasyQB0B6Q5wLQ9uNOP"

    override fun onCreate() {
        super.onCreate()
        RainbowSdk.instance().initialize(this, applicationID, applicationSecret);
        RBLog.setLevel(Level.WARN);
        Log.d("RainbowSdk", "onCreate: ${getRainbowSdkInstance()}");
        RainbowSdk.instance().push().activate(this);
        // just to try if login works properly
        rainbowService.login()
    }
}
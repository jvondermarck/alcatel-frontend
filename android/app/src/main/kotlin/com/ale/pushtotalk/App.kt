package com.ale.pushtotalk

import io.flutter.app.FlutterApplication
import com.ale.rainbowsdk.RainbowSdk
import android.util.Log

class App : FlutterApplication() {
    private val applicationID = "6ec7a6107e7711eeb0c4e7a30078a6db"
    private val applicationSecret =
        "dqZCG1tONopzjXnU8MHRol1dkBbtwJebdoB73gZTwLWBbwhngWCRMZwtENeBdvrf"

    override fun onCreate() {
        super.onCreate()
        RainbowSdk.instance().initialize(this, applicationID, applicationSecret);
        RainbowSdk.instance().push().activate(this);
    }

    companion object {
        private var rainbowSdkInstance: RainbowSdk? = null

        fun getRainbowSdkInstance(): RainbowSdk {
            if (rainbowSdkInstance == null) {
                rainbowSdkInstance = RainbowSdk.instance()
            }
            return rainbowSdkInstance!!
        }
    }

}
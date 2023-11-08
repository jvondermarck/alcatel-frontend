package com.ale.pushtotalk

import android.annotation.SuppressLint
import android.app.Application
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.app.FlutterApplication

class App : Application() {
    companion object {
        @SuppressLint("StaticFieldLeak")
        lateinit var instance: App
            private set
    }
    private val applicationID = "ea200c90c49a11edb7d22fba16605e6b"
    private val applicationSecret = "p1ubzfU2GYGMHMuuYOTssNnnT98YFwCaTMNuCgyuq4ArkIaGS2kslUiYg4yoTR2f"

     override fun onCreate() {
         super.onCreate()
         instance = this
         RainbowSdk.instance().initialize(this, applicationID, applicationSecret)
         RainbowSdk.instance().push().activate(this)
            if (RainbowSdk.instance().isInitialized) {
                print("Rainbow SDK is initialized :)")
            } else {
                print("Rainbow SDK is NOT initialized :(")
            }
     }
}
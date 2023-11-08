package com.ale.pushtotalk

import android.util.Log
import androidx.annotation.NonNull
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.bouncycastle.pqc.jcajce.provider.Rainbow

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.native/helper"

    private val applicationID = "c40a10407e6311eeb0c4e7a30078a6db"
    private val applicationSecret =
        "NTo25SAvcOKf00TnamieEVWuei5V1HiS9dCtr8sfXPil3MasyQB0B6Q5wLQ9uNOP"

    @ExperimentalStdlibApi
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        RainbowSdk.instance().initialize(this.application, applicationID, applicationSecret)
        RainbowSdk.instance().push().activate(this.application)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when {
                call.method.equals("isRainbowSdkInitialized") -> {
                    isRainbowSdkInitialized(result)
                }
            }
        }
    }

    private fun isRainbowSdkInitialized(result: MethodChannel.Result) {
        Log.d("isRainbowSdkInitialized", RainbowSdk.instance().isInitialized.toString())
        result.success(RainbowSdk.instance().isInitialized)
    }
}
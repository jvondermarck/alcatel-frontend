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

    @ExperimentalStdlibApi
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

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
        val appInstance = App.getRainbowSdkInstance()
        Log.d("RainbowSdk", "isRainbowSdkInitialized: ${appInstance.isInitialized}")
        result.success(appInstance.isInitialized)
    }
}
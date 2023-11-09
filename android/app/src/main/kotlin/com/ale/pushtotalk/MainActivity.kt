package com.ale.pushtotalk

import android.util.Log
import androidx.annotation.NonNull
import com.ale.pushtotalk.services.RainbowService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.native/helper"
    private val sdkInstance = App.getRainbowSdkInstance()
    // to access rainbowService method (should be modified with an interface)
    private val rainbowService = RainbowService()


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
                // TODO - adapt this call (it should maybe be modified)
                call.method.equals("login") -> {
                    login(result)
                }
            }
        }
    }

    private fun isRainbowSdkInitialized(result: MethodChannel.Result) {
        Log.d("RainbowSdk", "isRainbowSdkInitialized: $sdkInstance")
        result.success(sdkInstance.isInitialized)
    }

    private fun login(result: MethodChannel.Result) {
        // TODO - to adapt -> return true if connected maybe ?
        // result.success()
    }

}
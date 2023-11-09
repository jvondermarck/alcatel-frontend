package com.ale.pushtotalk

import android.util.Log
import androidx.annotation.NonNull
import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.pushtotalk.services.RainbowServiceImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity(private val rainbowService: RainbowService = RainbowServiceImpl()) :
    FlutterActivity() {

    companion object {
        private const val CHANNEL = "flutter.native/helper"
    }

    @ExperimentalStdlibApi
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // TODO - (refactor) move this inside a router
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
                    login(call, result)
                }
            }
        }
    }

    private fun isRainbowSdkInitialized(result: MethodChannel.Result) {
        Log.d("RainbowSdk", "isRainbowSdkInitialized: ${rainbowService.isSdkInitialized()}")
        result.success(rainbowService.isSdkInitialized())
    }

    private fun login(call: MethodCall, result: MethodChannel.Result) {
        // TODO - to adapt -> return true if connected maybe ?
        // result.success()
    }
}
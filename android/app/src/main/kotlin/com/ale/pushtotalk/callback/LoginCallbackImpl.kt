package com.ale.pushtotalk.callback

import android.util.Log
import com.ale.infra.rest.listeners.RainbowError
import com.ale.pushtotalk.interfaces.LoginCallback
import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.plugin.common.MethodChannel

class LoginCallbackImpl : LoginCallback {
    override fun onLoginSuccess(rainbowService : RainbowService, result: MethodChannel.Result) {
        Log.d("RainbowSdk", "isSignedIn: ${rainbowService.isSignedIn()}")
        result.success(rainbowService.isSignedIn())
    }

    override fun onLoginError(errorCode: RainbowSdk.ErrorCode, error: RainbowError<Unit>, result: MethodChannel.Result) {
        // Gérer les erreurs de connexion si nécessaire
        result.error("LOGIN_FAILED", "Login failed", null)
    }
}

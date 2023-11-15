package com.ale.pushtotalk.interfaces

import com.ale.infra.rest.listeners.RainbowError
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.plugin.common.MethodChannel

interface LoginCallback {
    fun onLoginSuccess(rainbowService: RainbowService, result: MethodChannel.Result)
    fun onLoginError(errorCode: RainbowSdk.ErrorCode, error: RainbowError<Unit>, result: MethodChannel.Result)
}
package com.ale.pushtotalk.interfaces

import com.ale.infra.rest.listeners.RainbowError
import com.ale.rainbowsdk.RainbowSdk

interface LoginCallback {
    fun onLoginSuccess()
    fun onLoginError(errorCode: RainbowSdk.ErrorCode, error: RainbowError<Unit>)
}
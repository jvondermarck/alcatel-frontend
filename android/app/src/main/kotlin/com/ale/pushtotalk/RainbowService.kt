package com.ale.pushtotalk

import android.util.Log
import com.ale.infra.rest.listeners.RainbowError
import com.ale.listener.SigninResponseListener
import com.ale.rainbowsdk.RainbowSdk


class RainbowService {
    private val sdkInstance = App.getRainbowSdkInstance()
    // c'est pour tester frr no malveillance
    private val login = "gaga"
    private val password = "gougou"

    fun login() {
        sdkInstance.connection().signin(
            login,
            password,
            "sandbox.openrainbow.com",
            object: SigninResponseListener() {
                override fun onRequestFailed(
                    errorCode: RainbowSdk.ErrorCode,
                    err: RainbowError<Unit>
                ) {
                    Log.d("Rainbow - Init connection", "onRequestFailed: $errorCode - $err")
                }
                override fun onSigninSucceeded() {
                    Log.d("Rainbow - Init connection", "onSigninSucceeded: Connected - ${sdkInstance.connection().isConnected}")
                }

            })
    }
}
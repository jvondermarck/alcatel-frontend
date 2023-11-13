package com.ale.pushtotalk.services

import android.app.Application
import android.util.Log
import com.ale.infra.rest.listeners.RainbowError
import com.ale.listener.SigninResponseListener
import com.ale.pushtotalk.interfaces.LoginCallback
import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.rainbow.RBLog
import com.ale.rainbowsdk.RainbowSdk
import io.flutter.plugin.common.MethodChannel
import org.tinylog.Level


class RainbowServiceImpl: RainbowService {

    private var isConnected: Boolean = false

    override fun login(email: String, password: String, callback: LoginCallback, result: MethodChannel.Result) {
    RainbowSdk.instance().connection().signin(
        email,
        password,
        "sandbox.openrainbow.com",
        object : SigninResponseListener() {
            override fun onRequestFailed(
                errorCode: RainbowSdk.ErrorCode,
                err: RainbowError<Unit>
            ) {
                Log.d("Rainbow - Init connection", "onRequestFailed: $errorCode - $err")
                isConnected = false
                callback.onLoginError(errorCode, err, result)
            }

            override fun onSigninSucceeded() {
                Log.d("Rainbow - Init connection", "onSigninSucceeded: Connected - ${RainbowSdk.instance().connection().isSignedIn}")
                isConnected = true
                callback.onLoginSuccess(this@RainbowServiceImpl, result)
            }
        })
}


    override fun initializeSdk(app: Application, applicationID: String, applicationSecret: String) {
        RainbowSdk.instance().initialize(app, applicationID, applicationSecret)
        RBLog.setLevel(Level.WARN)
        Log.d("RainbowSdk", "SDK Instance: ${RainbowSdk.instance()}")
        RainbowSdk.instance().push().activate(app)
    }

    override fun isSdkInitialized(): Boolean {
        return RainbowSdk.instance().isInitialized
    }

    override fun isSignedIn(): Boolean {
        // TODO - (refactor) make it the right way with instance
        return isConnected
    }
}
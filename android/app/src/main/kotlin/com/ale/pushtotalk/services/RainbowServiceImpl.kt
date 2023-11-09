package com.ale.pushtotalk.services

import android.app.Application
import android.util.Log
import com.ale.infra.rest.listeners.RainbowError
import com.ale.listener.SigninResponseListener
import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.rainbow.RBLog
import com.ale.rainbowsdk.RainbowSdk
import org.tinylog.Level


class RainbowServiceImpl: RainbowService {
    // c'est pour tester frr no malveillance

    override fun login(email: String, password: String) {
        RainbowSdk.instance().connection().signin(
            email,
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
                    Log.d("Rainbow - Init connection", "onSigninSucceeded: Connected - ${RainbowSdk.instance().connection().isSignedIn}")
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
}
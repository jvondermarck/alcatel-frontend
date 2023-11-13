package com.ale.pushtotalk.interfaces

import android.app.Application


interface RainbowService {
    fun login(email: String, password: String, callback: LoginCallback)
    fun initializeSdk(app: Application, applicationID: String, applicationSecret: String)
    fun isSdkInitialized(): Boolean
    fun isSignedIn(): Boolean
}
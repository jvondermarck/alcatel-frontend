package com.ale.pushtotalk.interfaces

import android.app.Application


interface RainbowService {
    fun login()
    fun initializeSdk(app: Application, applicationID: String, applicationSecret: String)
    fun isSdkInitialized(): Boolean
}
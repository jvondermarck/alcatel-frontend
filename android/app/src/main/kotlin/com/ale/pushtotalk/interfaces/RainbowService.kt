package com.ale.pushtotalk.interfaces

import android.app.Application
import com.ale.infra.contact.IRainbowContact
import io.flutter.plugin.common.MethodChannel


interface RainbowService {
    fun login(email: String, password: String, callback: LoginCallback, result: MethodChannel.Result)
    fun logout()
    fun initializeSdk(app: Application, applicationID: String, applicationSecret: String)
    fun isSdkInitialized(): Boolean
    fun isSignedIn(): Boolean
    fun getRainbowUser(): IRainbowContact
}
package com.ale.pushtotalk

import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.pushtotalk.services.RainbowServiceImpl
import io.flutter.app.FlutterApplication


class App(private val rainbowService: RainbowService = RainbowServiceImpl()) : FlutterApplication() {

    // TODO - Hide ID/Secret (config file)
    private val applicationID = "c40a10407e6311eeb0c4e7a30078a6db"
    private val applicationSecret =
        "NTo25SAvcOKf00TnamieEVWuei5V1HiS9dCtr8sfXPil3MasyQB0B6Q5wLQ9uNOP"

    override fun onCreate() {
        super.onCreate()
        rainbowService.initializeSdk(this, applicationID, applicationSecret)
    }
}
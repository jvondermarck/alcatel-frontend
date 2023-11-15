package com.ale.pushtotalk

import com.ale.pushtotalk.interfaces.RainbowService
import com.ale.pushtotalk.services.RainbowServiceImpl
import io.github.cdimascio.dotenv.dotenv
import io.flutter.app.FlutterApplication


class App(private val rainbowService: RainbowService = RainbowServiceImpl()) : FlutterApplication() {

    private val dotenv = dotenv {
        directory = "/assets"
        filename = "env" // instead of '.env', use 'env'
    }

    // TODO - Hide ID/Secret (config file)
    private val applicationID = dotenv["APPLICATION_ID"]
    private val applicationSecret = dotenv["APPLICATION_SECRET"]

    override fun onCreate() {
        super.onCreate()
        rainbowService.initializeSdk(this, applicationID, applicationSecret)
    }
}
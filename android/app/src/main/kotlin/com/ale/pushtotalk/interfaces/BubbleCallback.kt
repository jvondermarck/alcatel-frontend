package com.ale.pushtotalk.interfaces

import com.ale.infra.manager.room.IRainbowRoom
import io.flutter.plugin.common.MethodChannel

interface BubbleCallback {
    fun onBubbleCreated(bubble: IRainbowRoom, result: MethodChannel.Result)
}
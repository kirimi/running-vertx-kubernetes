package com.kctrl.echo

import io.vertx.core.AbstractVerticle
import java.net.InetAddress


class EchoVerticle : AbstractVerticle() {

    private val HOST_ADDRESS = InetAddress.getLocalHost().getHostAddress()

    override fun start() {
        val inst = vertx.deploymentIDs()
        val eb = vertx.eventBus()

        eb.consumer<Any>("echo").handler { message -> println("Received an incoming message " + message.body()) }

        vertx.setPeriodic(5000) { _ -> eb.publish("echo", "Test message from $HOST_ADDRESS $inst") }
    }
}



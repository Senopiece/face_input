package com.example.face_input

import android.Manifest
import android.app.Activity
import android.os.Build
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import com.example.face_input.FaceInputFactory.*
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel


class FaceInputPlugin: FlutterPlugin, FaceInputFactoryApi, ActivityAware {
  private var salt: Int = 0
  private var mssnger: BinaryMessenger? = null
  private var activity: Activity? = null

  override fun onAttachedToEngine(@NonNull binding: FlutterPluginBinding) {
    mssnger = binding.binaryMessenger
    FaceInputFactoryApi.setup(mssnger, this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  override fun create(result: Result<String>) {
    try {
      val executor = ContextCompat.getMainExecutor(activity)
      val cameraProviderFuture = ProcessCameraProvider.getInstance(activity!!)
      cameraProviderFuture.addListener({
        try {
          val cameraProvider = cameraProviderFuture.get()
          val eventChannelName = "face_input_channel#" + (salt++).toString()
          EventChannel(mssnger, eventChannelName).setStreamHandler(FaceInputHandler(activity!!, cameraProvider, executor))
          result.success(eventChannelName)
        } catch (ex: Exception) {
          result.error(ex)
        }
      }, executor)
    }
    catch (ex: Exception) {
      result.error(ex)
    }
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {
    FaceInputFactoryApi.setup(binding.binaryMessenger, null)
  }
}

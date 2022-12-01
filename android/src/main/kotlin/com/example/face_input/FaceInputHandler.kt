package com.example.face_input

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import android.graphics.Matrix
import android.os.Build
import android.util.Size
import android.view.Surface
import androidx.annotation.RequiresApi
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.camera.mlkit.vision.MlKitAnalyzer
import androidx.lifecycle.LifecycleOwner
import com.example.face_input.models.FaceInput.FaceState
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import io.flutter.plugin.common.EventChannel
import java.util.concurrent.Executor


@RequiresApi(Build.VERSION_CODES.S)
class FaceInputHandler(activity: Activity, cameraProvider: ProcessCameraProvider, executor: Executor) : EventChannel.StreamHandler {
    var sink: EventChannel.EventSink? = null

    init {
        val analyzeOpts = FaceDetectorOptions.Builder()
            .setContourMode(FaceDetectorOptions.CONTOUR_MODE_NONE)
            .setLandmarkMode(FaceDetectorOptions.LANDMARK_MODE_NONE)
            .setClassificationMode(FaceDetectorOptions.CLASSIFICATION_MODE_ALL)
            .setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
            .enableTracking()
            .build()
        val analyzer = FaceDetection.getClient(analyzeOpts)

        val imageAnalysis = ImageAnalysis.Builder()
            .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
            .build()
        imageAnalysis.setAnalyzer(executor, MlKitAnalyzer(
            listOf(analyzer),
            ImageAnalysis.COORDINATE_SYSTEM_ORIGINAL,
            executor
        ) {
            try {
                val t = it.getValue(analyzer)!![0]
                val builder = FaceState.newBuilder()
                    .setHeadEulerAngleY(-t.headEulerAngleY)
                    .setLeftEyeOpenProbability(t.rightEyeOpenProbability!!)
                    .setRightEyeOpenProbability(t.leftEyeOpenProbability!!)
                sink?.success(builder.build().toByteArray())
            }
            catch (ex: Exception) {
                sink?.error("Exception while processing face", ex.toString(), null)
            }
        })

        val cameraSelector = CameraSelector.Builder()
            .requireLensFacing(CameraSelector.LENS_FACING_FRONT)
            .build()

        if (activity.checkSelfPermission(Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            // permission must be granted externally, for example, use permission_handler plugin
            throw Exception("No camera permission granted")
        }
        cameraProvider.bindToLifecycle(activity as LifecycleOwner, cameraSelector, imageAnalysis)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(arguments: Any?) {
        sink = null
    }
}
package com.reactnativecardreader

import android.graphics.Color
import android.view.View
import com.facebook.react.common.MapBuilder
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class CardReaderViewManager : SimpleViewManager<NativeReaderView>() {
  override fun getName() = "CardReaderView"

  override fun createViewInstance(reactContext: ThemedReactContext): NativeReaderView {
    return NativeReaderView(reactContext)
  }

  @ReactProp(name = "color")
  fun setColor(view: View, color: String) {
    view.setBackgroundColor(Color.parseColor(color))
  }

  override fun getExportedCustomDirectEventTypeConstants(): MutableMap<String, Any> {
    return MapBuilder.of(
      "onNumberDetected",
      MapBuilder.of("registrationName", "onNumberDetected")
    )
  }
}

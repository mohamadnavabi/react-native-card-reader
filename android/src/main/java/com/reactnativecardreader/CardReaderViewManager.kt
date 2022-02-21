package com.reactnativecardreader

import android.graphics.Color
import android.view.View
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
}

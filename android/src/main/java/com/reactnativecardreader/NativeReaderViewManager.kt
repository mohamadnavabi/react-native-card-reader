package com.reactnativecardreader

import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext

class NativeReaderViewManager : SimpleViewManager<NativeReaderView>() {
  override fun getName(): String {
    return "NativeViewManagerView";
  }

  override fun createViewInstance(reactContext: ThemedReactContext): NativeReaderView {
    return NativeReaderView(reactContext);
  }
}

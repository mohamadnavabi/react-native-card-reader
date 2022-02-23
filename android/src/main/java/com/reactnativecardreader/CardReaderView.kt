package com.reactnativecardreader

import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.WritableMap
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.events.RCTEventEmitter

class NativeReaderView: LinearLayout {
  var myContext: ThemedReactContext
  var number: Int = 0

  constructor(themedReactContext: ThemedReactContext): super(themedReactContext) {
    this.myContext = themedReactContext
    init()
  }

  private fun init() {
    inflate(myContext, R.layout.reader_layout, this)
    val generateNumberButton: Button = findViewById(R.id.generate)
    val sendToReactNativeButton: Button = findViewById(R.id.sendToRN)

    generateNumberButton.setOnClickListener {
      this.number = (0 until 100).shuffled().last();
      this.updateNumberLabel()
    }

    sendToReactNativeButton.setOnClickListener {
      var args: WritableMap = Arguments.createMap()
      args.putInt("nativeNumber", number)

      this.myContext.getJSModule(RCTEventEmitter::class.java).receiveEvent(getId(), "onNumberDetected", args)
    }
  }

  private fun updateNumberLabel() {
    val randomNumberLabel: TextView = findViewById(R.id.number)
    randomNumberLabel.text = this.number.toString()
  }
}

@objc(CardReaderViewManager)
class CardReaderViewManager: RCTViewManager {

  override func view() -> (CardReaderView) {
    return CardReaderView()
  }
}
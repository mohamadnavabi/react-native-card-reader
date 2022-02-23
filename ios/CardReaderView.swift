import UIKit

class CardReaderView: UIView {
    @objc var onNumberDetected: RCTDirectEventBlock?
    
    var number: Int = 0 {
        didSet {
            randomNumberLabel.text = String(describing: number)
        }
    }

    @objc var color: String = "" {
        didSet {
            self.backgroundColor = hexStringToUIColor(hexColor: color)
        }
    }
    
    var randomNumberLabel: UILabel!
    var randomNumberButton: UIButton!
    var sendToRNButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        randomNumberLabel = UILabel()
        randomNumberLabel.font = .systemFont(ofSize: 40)
        randomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        randomNumberLabel.textAlignment = .right
        randomNumberLabel.text = "0"
        self.addSubview(randomNumberLabel)

        randomNumberButton = UIButton(type: .system)
        randomNumberButton.translatesAutoresizingMaskIntoConstraints = false
        randomNumberButton.setTitle("Generate", for: .normal)
        randomNumberButton.addTarget(self, action: #selector(self.getRandomNumberAction(_:)), for: .touchUpInside)
        self.addSubview(randomNumberButton)
        
        sendToRNButton = UIButton(type: .system)
        sendToRNButton.translatesAutoresizingMaskIntoConstraints = false
        sendToRNButton.setTitle("Send To RN", for: .normal)
        sendToRNButton.addTarget(self, action: #selector(self.onNumberDetectedSendToRN(_:)), for: .touchUpInside)

        self.addSubview(sendToRNButton)
        
        NSLayoutConstraint.activate([
            randomNumberLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            randomNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            randomNumberButton.topAnchor.constraint(equalTo: randomNumberLabel.bottomAnchor, constant: 16),
            randomNumberButton.centerXAnchor.constraint(equalTo: randomNumberLabel.centerXAnchor),
            
            sendToRNButton.topAnchor.constraint(equalTo: randomNumberButton.bottomAnchor, constant: 16),
            sendToRNButton.centerXAnchor.constraint(equalTo: randomNumberButton.centerXAnchor)
        ])
    }
    
    @IBAction func getRandomNumberAction(_ sender: UIButton) {
        number = Int.random(in: 0...100)
    }
    
    @IBAction func onNumberDetectedSendToRN(_ sender: UIButton) {
        if onNumberDetected != nil {
            onNumberDetected!(["nativeNumber": number])
        }
    }

    func hexStringToUIColor(hexColor: String) -> UIColor {
        let stringScanner = Scanner(string: hexColor)

        if(hexColor.hasPrefix("#")) {
            stringScanner.scanLocation = 1
        }
        var color: UInt32 = 0
        stringScanner.scanHexInt32(&color)

        let r = CGFloat(Int(color >> 16) & 0x000000FF)
        let g = CGFloat(Int(color >> 8) & 0x000000FF)
        let b = CGFloat(Int(color) & 0x000000FF)

        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}

import UIKit
import TrueLayerPaymentsSDK

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    let button = UIButton()
    button.addTarget(self, action: #selector(startPayment), for: .touchUpInside)
    button.setTitle("Start payment", for: .normal)
    button.backgroundColor = .red
    
    view.addSubview(button)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    button.widthAnchor.constraint(equalToConstant: 160).isActive = true
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  @objc
  func startPayment() {
    try? TrueLayerPayments.Manager.shared.processPayment(
      context:
          .init(
            paymentId: "SOME PAYMENT ID",
            token: "TOKEN",
            redirectUri: "THE REDIRECT URI ONCE PAYMENT GOES THROUGH",
            presentationStyle: .present(on: self, modalPresentationStyle: .overCurrentContext)
          ),
      callback: nil
    )
  }
}

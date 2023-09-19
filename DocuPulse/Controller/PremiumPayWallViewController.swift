//
//  PremiumPayWallViewController.swift
//  DocuPulse
//
//  Created by Matthew Houston on 9/10/23.
//

import UIKit
import StoreKit

class PremiumPayWallViewController: UIViewController {

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var restorePurchaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Purchases.default.initialize { [weak self] requestProductsResult in
            //Since we've captured self weakly, it's an optional inside the closure
            guard let self = self else { return }
            
            switch requestProductsResult {
            case let .success(products):
                DispatchQueue.main.async {
                    self.updateInterface(products: products)
                }
            default: break
            }
        }
        
    }
    
    @IBAction func aButtonPressed(_ sender: Any) {
    }
    @IBAction func bButtonPressed(_ sender: Any) {
    }
    @IBAction func restorePurchasesPressed(_ sender: Any) {
    }
    
    private func updateInterface(products: [SKProduct]) {
        updateButton(aButton, with: products[0])
        updateButton(bButton, with: products[1])
    }
    
    func updateButton(_ button: UIButton, with product: SKProduct) {
        let title = "\(product.title ?? product.productIdentifier) for \(product.localizedPrice)"
        button.setTitle(title, for: .normal)
    }


}

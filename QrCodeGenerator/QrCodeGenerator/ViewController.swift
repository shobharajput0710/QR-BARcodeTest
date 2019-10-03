//
//  ViewController.swift
//  QrCodeGenerator
//
//  Created by KartRocket iOSOne on 24/09/19.
//  Copyright © 2019 CodesRoom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
        
        if let myStirng = myTextField.text{
            myImageView.image = generateQRCode(from: myTextField.text!)
        }else{
            myImageView.image = generateQRCode(from: "Let's learn swift is the best ios coding tutuorial i've ever watch!")
        }
        
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
        
    }
    
   
    
}


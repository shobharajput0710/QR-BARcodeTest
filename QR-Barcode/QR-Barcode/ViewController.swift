//
//  ViewController.swift
//  QR-Barcode
//
//  Created by KartRocket iOSOne on 24/09/19.
//  Copyright © 2019 CodesRoom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var select: UISegmentedControl!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedGenerate(_ sender: Any) {
             if let myString = txt.text{
                    img.image = generateBarcode(from: txt.text!)
                }else{
                    img.image = generateBarcode(from: "Let's learn swift is the best ios coding tutuorial i've ever watch!")
                }
                
            }
            
            func generateBarcode(from string: String) -> UIImage? {
                let data = string.data(using: String.Encoding.ascii)
                
                if let filter = CIFilter(name: "CICode128BarcodeGenerator")
                 {
                    filter.setValue(data, forKey: "inputMessage")
                    let transform = CGAffineTransform(scaleX: 3, y: 3)

                    if let output = filter.outputImage?.transformed(by: transform) {
                        return UIImage(ciImage: output)
                    }
                }
                    
                return nil
            }
    
      
    }


     



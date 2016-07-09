//
//  ViewController.swift
//  QRCode
//
//  Created by Wojtek Kozlowski on 09/07/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader
import SnapKit

class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    private let qrResultLabel = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        self.view.addSubview(qrResultLabel)
        self.addButton()
        self.addResultLabel()
    }
    
    func addButton(){
        button.snp_makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalTo(button.superview!)
            make.bottom.equalTo(button.superview!).offset(-20)
        }
        button.backgroundColor = .blueColor()
        button.setTitle("QR", forState: .Normal)
        button.addTarget(self, action: #selector(startQR), forControlEvents: .TouchUpInside)
        
    }
    
    func addResultLabel() {
        qrResultLabel.numberOfLines = 0
        qrResultLabel.snp_makeConstraints { make in
            make.centerX.centerY.equalTo(button.superview!)
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
    }
    
    func startQR() {
        let readerVC = QRCodeReaderViewController(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
        readerVC.modalPresentationStyle = .FormSheet
        readerVC.delegate = self
        presentViewController(readerVC, animated: true, completion: nil)
    }
    
    func reader(reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.qrResultLabel.text = result.value
    }
    
    func readerDidCancel(reader: QRCodeReaderViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

struct BPayQRCodeData {
    let billerCode: String
    let customerRefNumber: String
    let amountDue: String
    let dueDate: NSDate
    
    init(result: String){
        billerCode = result.firstMatch("(?<=1=)\\w*")!
        customerRefNumber = result.firstMatch("(?<=2=)\\w*")!
        amountDue = result.firstMatch("(?<=3=)\\w*")!
        dueDate = result.firstMatch("(?<=4=)\\w*")!.dateWithFormat("ddMMyyyy")
    }
}



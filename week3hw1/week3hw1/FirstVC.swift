//
//  FirstVC.swift
//  week3hw1
//
//  Created by Melih Cüneyter on 20.12.2022.
//

import UIKit

let notificationCenterPassDataKey = "passDataKey"

class FirstVC: BaseVC {

    @IBOutlet weak var transferredDataWithProtocolTF: UITextField!
    @IBOutlet weak var transferredDataWithNotificationCenterTF: UITextField!
    @IBOutlet weak var transferredDataWithClosureTF: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(transferredDataWithNotificationCenter(_:)),
                                               name: Notification.Name(rawValue: notificationCenterPassDataKey),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc  func transferredDataWithNotificationCenter(_ notification: NSNotification) {
        transferredDataWithNotificationCenterTF.text = (notification.object as! String)
    }
    
    // MARK: - Actions
    @IBAction func nextVCButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            vc.delegate = self
            
            transferredDataWithProtocolTF.text = ""
            transferredDataWithNotificationCenterTF.text = ""
            transferredDataWithClosureTF.text = ""
            
            vc.transferData = {(toBeTransferredData) -> ()in
                self.transferredDataWithClosureTF.text = toBeTransferredData
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - Data Transfer Delegate
extension FirstVC: TransferDataDelegate {
    func transferData(_ data: String) {
        transferredDataWithProtocolTF.text = data
    }
}

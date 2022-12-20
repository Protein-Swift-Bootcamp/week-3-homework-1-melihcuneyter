//
//  FirstVC.swift
//  week3hw1
//
//  Created by Melih Cüneyter on 20.12.2022.
//

import UIKit

class FirstVC: BaseVC {

    @IBOutlet weak var transferredDataWithProtocolTF: UITextField!
    @IBOutlet weak var transferredDataWithNotificationCenterTF: UITextField!
    @IBOutlet weak var transferredDataWithClosureTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func nextVCButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            vc.delegate = self
            transferredDataWithProtocolTF.text = ""
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

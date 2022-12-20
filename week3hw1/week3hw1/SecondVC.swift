//
//  SecondVC.swift
//  week3hw1
//
//  Created by Melih Cüneyter on 20.12.2022.
//

import UIKit

protocol TransferDataDelegate: BaseVC {
    func transferData(_ data: String)
}

class SecondVC: BaseVC {

    @IBOutlet weak var enterDataWithProtocolTF: UITextField!
    @IBOutlet weak var enterDataWithNotificationCenterTF: UITextField!
    @IBOutlet weak var enterDataWithClosureTF: UITextField!
    
    weak var delegate: TransferDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func transferDataWithProtocolButton(_ sender: Any) {
        delegate?.transferData(enterDataWithProtocolTF.text ?? "No Data!")
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func transferDataWithNotificationCenterButton(_ sender: Any) {
    }
    
    @IBAction func transferDataWithClosureButton(_ sender: Any) {
    }
}

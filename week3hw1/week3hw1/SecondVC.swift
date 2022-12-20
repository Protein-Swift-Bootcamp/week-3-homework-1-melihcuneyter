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

    @IBOutlet weak var enterDataForProtocolTF: UITextField!
    @IBOutlet weak var enterDataForNotificationCenterTF: UITextField!
    @IBOutlet weak var enterDataForClosureTF: UITextField!
    
    weak var delegate: TransferDataDelegate?
    var transferData: ((_ toBeTransferData: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func postNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(notificationCenterPassDataKey),
                                        object: enterDataForNotificationCenterTF.text)
    }
    
    private func dismiss() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func transferDataWithProtocolButton(_ sender: Any) {
        delegate?.transferData(enterDataForProtocolTF.text ?? "")
        dismiss()
    }
    
    @IBAction func transferDataWithNotificationCenterButton(_ sender: Any) {
        postNotification()
        dismiss()
    }
    
    @IBAction func transferDataWithClosureButton(_ sender: Any) {
        guard let transferData = transferData else { return }
        transferData(enterDataForClosureTF.text ?? "")
        dismiss()
    }
}

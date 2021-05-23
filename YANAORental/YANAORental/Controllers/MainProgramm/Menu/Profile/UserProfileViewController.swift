//
//  UserProfileViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 23.05.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTF.setUnderLine()
        lastNameTF.setUnderLine()
        phoneNumberTF.setUnderLine()
        mailTF.setUnderLine()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  UserViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 21.05.2021.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var acceptButton: UIButton!
    var user: User = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        acceptButton.addShadow()
        phoneTF.setFlag()
        acceptButton.layer.cornerRadius = 8
        
        phoneTF.setUnderLine()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func acceptButtonAction(_ sender: UIButton) {
   //      user.sendToCheckNumber(phoneNumber: "+7\(phoneTF.text ?? " ")", completion: { lol in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(identifier: "CheckCodeNavScreen") as? CheckCodeNavViewController else {return}
                self.present(vc, animated: true, completion: nil)
            
     //  })
        
    }
    
    
    @IBAction func unwindSegueToLoginScreen(_ segue: UIStoryboardSegue) {
        
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

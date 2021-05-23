//
//  RegistrationViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 21.05.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationButton.addShadow()
        registrationButton.layer.cornerRadius = 8
    }
    
    @IBAction func registrationButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "CellMenuScreen") as? CellGallaryMenuViewController else {
            print("БЛЯТЬ")
            return
            
        }
        self.present(vc, animated: true, completion: nil)
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

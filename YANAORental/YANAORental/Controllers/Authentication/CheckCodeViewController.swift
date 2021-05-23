//
//  CheckCodeViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 21.05.2021.
//

import UIKit

class CheckCodeViewController: UIViewController {
    @IBOutlet weak var codeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTF.setUnderLine()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegueToLoginScreen(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func NextStepButtonAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "RegNavScreen") as? UIViewController else { return }
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

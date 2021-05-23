//
//  RentViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 23.05.2021.
//

import UIKit

class RentViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var placeTF: UITextField!
    @IBOutlet weak var timeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rentButton.addShadow()
        rentButton.layer.cornerRadius = 8
        nameTF.setUnderLine()
        phoneTF.setUnderLine()
        placeTF.setUnderLine()
        timeTF.setUnderLine()
    }
    
    @IBAction func rentButtonAction(_ sender: UIButton) {
    }
}

extension RentViewController: UITableViewDataSource,  UITabBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

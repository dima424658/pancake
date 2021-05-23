//
//  ViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 21.05.2021.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var userBeutton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBeutton.addShadow()
        userBeutton.layer.cornerRadius = 8
        rentButton.layer.cornerRadius = 8
        rentButton.addShadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func userButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "UserNavScreen") as? UserNavViewController else {return}
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func rentalButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func unwindSegueToLoginScreen(_ segue: UIStoryboardSegue) {
        
    }

}

extension UIButton {
    /// Анимация трясущейся кнопки
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }

}
extension UIView {
    /// Тень для кнопки
  func addShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: -1, height: 2)
    self.layer.shadowRadius = 1.8
    self.layer.shadowOpacity = 0.3
  }
}

extension UITextField {
    /// Нижнее подчеркивание для тектового поля
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 0.5)
        bottomLine.backgroundColor = #colorLiteral(red: 0.2205270361, green: 0.2885239677, blue: 1, alpha: 1).cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func setFlag() {
        let imageView = UIImageView();
        let image = UIImage(named: "russiaEnd");
        imageView.image = image;
        imageView.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        
        self.addSubview(imageView)
        let leftView = UIView.init(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        self.leftView = leftView;
        self.leftViewMode = UITextField.ViewMode.always
    }

}

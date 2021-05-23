//
//  CellGallaryMenuViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 22.05.2021.
//

import UIKit

class CellGallaryMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    private var collectionView = MenuCollectionView()
    var cells = [MenuModel]()
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var rentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rentButton.layer.cornerRadius = 8
        rentButton.addShadow()
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 2).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        //collectionView.cells
        self.cells = MenuModel.fetchSushi()
    }
    
    
    @IBAction func rentButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func unwindSegueToLoginScreen(_ segue: UIStoryboardSegue) {
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellMenuViewController.reuseId, for: indexPath) as! CellMenuViewController
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = cells[indexPath.row].option
        cell.smallDescriptionLabel.text = cells[indexPath.row].smallDescription
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: collectionView.frame.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let userVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UserProfileScreen") as! UserProfileViewController
            self.present(userVC, animated: true)
        case 1:
            let historyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HistoryScreen") as! HistoryViewController
            self.present(historyVC, animated: true)
        case 2:
            let eventVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EventScreen") as! EventViewController
            self.present(eventVC, animated: true)
        default:
            print("Unknown error")
        }
        
    }
}

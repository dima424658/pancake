//
//  MenuModel.swift
//  YANAORental
//
//  Created by Егор Шкарин on 22.05.2021.
//

import Foundation
import UIKit

    struct MenuModel {
        var mainImage: UIImage
        var option: String
        var smallDescription: String
        
        
        static func fetchSushi() -> [MenuModel] {
            let firstItem = MenuModel(mainImage: UIImage(named: "profile") ?? UIImage(),
                                       option: "Личный кабинет",
                                   smallDescription: "")
            let thirdItem = MenuModel(mainImage: UIImage(named: "history") ?? UIImage(),
                                       option: "История заказов",
                                       smallDescription: "")
            let fourthItem = MenuModel(mainImage: UIImage(named: "Event") ?? UIImage(), option: "Мероприятия", smallDescription: "")
            return [firstItem, thirdItem, fourthItem]
        }
    }


struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}

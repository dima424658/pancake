//
//  EventTVC.swift
//  YANAORental
//
//  Created by Егор Шкарин on 22.05.2021.
//

import UIKit

class EventTVC: UITableViewCell {

    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  HistoryViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 23.05.2021.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var historyTableView: UITableView!
    lazy var arrayOfHistory = [History(date: "9 мая. 2021", nameOfInventory: "Велосипед", cost: "95")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.separatorStyle = .none
        historyTableView.showsVerticalScrollIndicator = false
    }


}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as? HistoryTVC else {return UITableViewCell()}
        cell.nameLabel.text = arrayOfHistory[indexPath.row].nameOfInventory
        cell.dateLabel.text = arrayOfHistory[indexPath.row].date
        cell.costLabel.text = "\(arrayOfHistory[indexPath.row].cost) р."
        cell.histroyView.layer.cornerRadius = 10
        cell.histroyView.addShadow()
        
        return cell
    }
    
}

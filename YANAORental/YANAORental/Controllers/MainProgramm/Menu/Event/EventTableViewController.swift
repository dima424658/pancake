//
//  EventTableViewController.swift
//  YANAORental
//
//  Created by Егор Шкарин on 22.05.2021.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var arrayOfEvents = [Event(lantitude: "123456",
                                    longtitude: "123456",
                                    nameEvent: "Ночная гроза",
                                    maxCount: "200",
                                    desc: "павы",
                                    dateStart: "12 авг. 2021")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
       
    }

    // MARK: - Table view data source

    

}
extension EventViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventTVC else {return UITableViewCell()}
        cell.dateLabel.text = arrayOfEvents[indexPath.row].dateStart
        cell.nameLabel.text = arrayOfEvents[indexPath.row].nameEvent
        cell.countLabel.text = "Осталось \(arrayOfEvents[indexPath.row].maxCount) мест"
        cell.eventView.layer.cornerRadius = 10
        cell.eventView.addShadow()
        
        return cell
    }
    
}

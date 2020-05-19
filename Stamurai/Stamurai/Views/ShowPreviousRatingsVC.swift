//
//  ShowPreviousRatingsVC.swift
//  Stamurai
//
//  Created by Pavan Kalyan Jonnadula on 19/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class ShowPreviousRatingsVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var ratingsTableView: UITableView!
    
    var ratings = [Range]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingsTableView.delegate = self
        ratingsTableView.dataSource = self
        ratingsTableView.reloadData()
        ratingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let range = ratings[indexPath.row]
        cell.textLabel?.text = "Min Range : \(range.minrange) \nMax Range : \(range.maxrange) \nDate : \(range.date ?? "")"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratings.count
    }
}

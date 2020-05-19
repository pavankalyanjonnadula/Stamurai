//
//  ViewController.swift
//  Stamurai
//
//  Created by Pavan Kalyan Jonnadula on 19/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var perviousRating: UIButton!
    @IBOutlet weak var giveRatingBtn: UIButton!
    var perviousRatings = [Range]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        perviousRatings = CoreDataHelper.shared.getAllData(entityName: "Range") as? [Range] ?? []
        print("the ratings are",perviousRatings)
        if perviousRatings.count == 0{
            perviousRating.isHidden = true
        }
        else{
            perviousRating.isHidden = false
            let lastRating = perviousRatings[perviousRatings.count - 1]
            giveRatingBtn.setTitle("\(lastRating.minrange) - \(lastRating.maxrange) -> Change Rating", for: .normal)
        }
    }

    @IBAction func giveRatingAction(_ sender: Any) {
        let selectVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SelectRatingViewController") as! SelectRatingViewController
        self.navigationController?.pushViewController(selectVc, animated: true)
    }
 
    @IBAction func perviousRatingsAction(_ sender: Any) {
        let allRatings = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ShowPreviousRatingsVC") as! ShowPreviousRatingsVC
        allRatings.ratings = perviousRatings
        self.navigationController?.pushViewController(allRatings, animated: true)
    }
    
}


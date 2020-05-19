//
//  SelectRatingViewController.swift
//  Stamurai
//
//  Created by Pavan Kalyan Jonnadula on 19/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit
import CoreData

class SelectRatingViewController: UIViewController {
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minSlider: UISlider!
    @IBOutlet weak var maxSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func minSliderValueChange(_ sender: UISlider) {
        minLabel.text = "\(Int(sender.value))"
    }
    @IBAction func maxSliderValueChaged(_ sender: UISlider) {
        maxLabel.text = "\(Int(sender.value))"
    }
    @IBAction func sumbitBtnAction(_ sender: Any) {
        if maxSlider.value > minSlider.value{
            let newRange = Range(context: CoreDataHelper.shared.context)
            newRange.maxrange = Int16(maxSlider.value)
            newRange.minrange = Int16(minSlider.value)
            newRange.date = getDate()
            CoreDataHelper.shared.saveContext()
        }else if maxSlider.value < minSlider.value{
            showAlert(title: "Error", message: "Maximum rating is greater than minimum rating")
            return
        }
        navigationController?.popViewController(animated: true)
    }
    func getDate() -> String{
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour , .minute , .second], from: date)
        return "\(components.day ?? 0)-\(components.month ?? 0)-\(components.year ?? 0) - \(components.hour ?? 0):\(components.minute ?? 0):\(components.second ?? 0)"
    }
}



//MARK : Extensions
extension UIViewController {
    
    func showAlert(title: String?, message messageToShow: String?, buttonTitle: String = "Ok"){
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: title ?? "",
                message: messageToShow ?? "",
                preferredStyle: UIAlertController.Style.alert
            )
            
            let defaultAction = UIAlertAction(
                title: buttonTitle,
                style: UIAlertAction.Style.cancel,
                handler: nil
            )
            
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

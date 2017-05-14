//
//  DetailViewController.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/28/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView:UITableView!
    @IBAction func close(segue: UIStoryboardSegue) {
//        if let retingVC = segue.source as? RateViewController {
//            if let rating = retingVC.rating {
//                rateButton.setImage(UIImage(named: rating), for: UIControlState.normal)
//                restaurant.rating = rating
//            }
//        }
    }
    @IBOutlet weak var rateButton: UIButton!
//    var restaurant: Restaurant!
    var job: Job!
    
    
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Дополнительные действия после загрузки view
//        restaurantImageView.image = UIImage(named: restaurant.image)
        
        // Сменить цвет TableView
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        // Убрать разделители пустых ячеек
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Сменить цвет разделителей
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // Сменить title в navigationBar
        title = job.nameofCompany + " " + job.profession
        
        //autosizing
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
//        rateButton.setImage(UIImage(named: restaurant.rating), for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Data Source Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        
        // Настройка ячейки
        switch (indexPath as NSIndexPath).row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = job.profession
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = job.nameofCompany
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = job.city
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = job.dateOfJob
        
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
  
    
    
}


//
//  LeftSideViewController.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/27/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItems:[String] = ["Поиск работы", "Все вакансии", "Личный кабинет"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NavCell", for: indexPath) as! CustomTableViewCell
        
        cell.menuItemLabel?.text = menuItems[indexPath.row]
        
        if (cell.menuItemLabel?.text?.contains("Все вакансии"))! {
            cell.imgItem.image = UIImage(named: "List-50")
        }
        if (cell.menuItemLabel?.text?.contains("Поиск работы"))! {
            cell.imgItem.image = UIImage(named: "Search-50")
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            
            let centerNavigationController = UINavigationController(rootViewController: centerViewController!)
            
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = centerNavigationController
            appDelegate.centerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
        case 1:
            let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController")
            
            let aboutNavigationController = UINavigationController(rootViewController: aboutViewController!)
            
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = aboutNavigationController
            appDelegate.centerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil)
        case 2:
            let acountViewController = self.storyboard?.instantiateViewController(withIdentifier: "AcountViewController")
            
            let acountNavigationController = UINavigationController(rootViewController: acountViewController!)
            
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = acountNavigationController
            appDelegate.centerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
        default:
            print("\(menuItems[indexPath.row]) is selected")
        }
    }
    
    @IBAction func cancel1 (segue:UIStoryboardSegue) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

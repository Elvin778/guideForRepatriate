//
//  JobDetailViewController.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 3/4/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {

    @IBOutlet weak var nameOfCompany: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var placeOfJob: UILabel!
    @IBOutlet weak var salaryPerDay: UILabel!
    
    @IBOutlet weak var viewforShadow: UIView!
    @IBOutlet weak var responsibilities: UILabel!
    @IBOutlet weak var requirements: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var job: Job!
    
    @IBOutlet weak var dateJob: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Описание работы"
        nameOfCompany.text = job.nameofCompany
        profession.text = job.profession
        placeOfJob.text = "Место работы: " + job.city
        salaryPerDay.text = job.salary + " шк/ч"
        responsibilities.text = job.responsibilities
        requirements.text = job.requirements
        responsibilities.adjustsFontSizeToFitWidth = true
        requirements.adjustsFontSizeToFitWidth = true

        
        let radius: CGFloat = viewforShadow.frame.width / 2.0 //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: viewforShadow.frame.height))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        viewforShadow.layer.cornerRadius = 2
        viewforShadow.layer.shadowColor = UIColor.black.cgColor
        viewforShadow.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        viewforShadow.layer.shadowOpacity = 0.5
        viewforShadow.layer.shadowRadius = 2.0 //Here your control your blur
        viewforShadow.layer.masksToBounds =  false
        viewforShadow.layer.shadowPath = shadowPath.cgPath

        
//        var nameofCompany = ""
//        var profession = ""
//        var city = ""
//        var salary = ""
//        var dateOfJob = ""
//        var responsibilities = ""
//        var requirements = ""
//        var other = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func segments(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0) , animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: 375, y: 0) , animated: true)
        default:
            print("")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDate" {
            let destinationController = segue.destination as!  ChooseDateTableViewController
            destinationController.date = job.dateOfJob
        }
    }
  
    @IBAction func cancelDate (segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveDate (segue: UIStoryboardSegue) {
        let newItemViewController = segue.source as! ChooseDateTableViewController
        
        let name = newItemViewController.date
        
        if name == "" {
//            dateJob.text = name
//            job = job1
        }
        else {
            dateJob.isHidden = false
            dateJob.text = name
            
            
        }
//        self.tableView.reloadData()
    }
    
    @IBAction func btnapp(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Внимание!!!", message: "Соглашаясь на работу вы подтверждаете что выйдете в выбранные дни. Иначе с вас будет вычтен штраф - 200 шк", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Согласиться", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            
//            if segue.identifier == "showDate" {
//                let destinationController = segue.destination as!  ChooseDateTableViewController
//                destinationController.date = job.dateOfJob
//            }
            self.performSegue(withIdentifier: "segAccount", sender: self)
//            menuController?.performSegueWithIdentifier("segAccount", sender: nil) { segue in
//                let controller = segue.destinationViewController as! ChangeMenuItemController
//                controller.viewModel.sourceMenuItem = item
//            }
//            let accountViewController = self.storyboard?.instantiateViewController(withIdentifier: "AcountViewController")
//            self.present(accountViewController!, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
    
        
        // show the alert
        self.present(alert, animated: true, completion: nil)


    }

}

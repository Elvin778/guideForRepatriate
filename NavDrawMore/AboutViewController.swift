//
//  AboutViewController.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/28/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController {

    var job1: [Job] = [Job(nameofCompany: "Аэропорт", profession: "Разнорабочий", city: "Лод", salary: "40", dateOfJob: "08.03.2017", responsibilities: "Чистить магаши.Очищать магаши.Накладывать еду в коробочки и прочее и прочее", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "Три звезды", profession: "Официант", city: "Эйлат", salary: "35", dateOfJob: "07.03.2017", responsibilities: "Чистить магаши.Очищать магаши.Накладывать еду в коробочки и прочее и прочее", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "ДаВинчи", profession: "Официант", city: "Ашеклон", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Чистить магаши.Очищать магаши.Накладывать еду в коробочки и прочее и прочее", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "Книжный магазин", profession: "Продавец1", city: "Ашдод", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Продавать книжки, обслуживать покупателей", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "ДаВинчи", profession: "Официант", city: "Ашеклон", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Чистить магаши.Очищать магаши.Накладывать еду в коробочки и прочее и прочее", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "Книжный магазин", profession: "Продавец", city: "Ашдод", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Продавать книжки, обслуживать покупателей", requirements: "Закрытая черная обувь", other: ""),Job(nameofCompany: "ДаВинчи", profession: "Официант", city: "Ашеклон", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Чистить магаши.Очищать магаши.Накладывать еду в коробочки и прочее и прочее", requirements: "Закрытая черная обувь", other: ""),
        Job(nameofCompany: "Книжный магазин", profession: "Продавец", city: "Ашдод", salary: "30", dateOfJob: "06.03.2017", responsibilities: "Продавать книжки, обслуживать покупателей", requirements: "Закрытая черная обувь", other: "")]
    var job:[Job] = []
    
    @IBOutlet weak var viewListOfJob: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = UIColor.lightGray
        //autosizing
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        job = job1
        // Do any additional setup after loading the view.
        
        let radius: CGFloat = viewListOfJob.frame.width / 2.0 //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: viewListOfJob.frame.height))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        viewListOfJob.layer.cornerRadius = 2
        viewListOfJob.layer.shadowColor = UIColor.black.cgColor
        viewListOfJob.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        viewListOfJob.layer.shadowOpacity = 0.5
        viewListOfJob.layer.shadowRadius = 2.0 //Here your control your blur
        viewListOfJob.layer.masksToBounds =  false
        viewListOfJob.layer.shadowPath = shadowPath.cgPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell2
        
        // Настройка ячейки
        cell.professionlist.text = job[(indexPath as NSIndexPath).row].profession
//        cell.thumbnailImageView.image = UIImage(named: restaurants[(indexPath as NSIndexPath).row].image)
        cell.nameOfCompanyList.text = job[(indexPath as NSIndexPath).row].nameofCompany
        cell.cityList.text = job[(indexPath as NSIndexPath).row].city
        cell.salaryList.text = job[(indexPath as NSIndexPath).row].salary + " " + " шк/ч"
//    cell.imgSave.image = UIImage(cgImage: <#T##CGImage#>)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! JobDetailViewController
                destinationController.job = job[(indexPath as NSIndexPath).row]
            }
        }
    }


    @IBAction func leftSideButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.hidesBarsOnSwipe = true
        
    }

    @IBAction func cancel (segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func save (segue: UIStoryboardSegue) {
        let newItemViewController = segue.source as! FilterTableViewController
        
        let name = newItemViewController.itemName
        
        if name == "" {
            job = job1
        }
        else {
            
            job = job1
            job = job.filter { (job: Job ) -> Bool in
                return job.city.contains(name!) }
            
            
//            for item in job {
//                let even = digits.filter { $0 % 2 == 0 }
//                let indexes = item.city.contains(name!)
//            }
            
//            let array = ["apple", "dog", "log"]
           
            
            
//            var ar2: [Job]
//            for i in job {
//                if i.contains(where: name) {
//                    
//                }
//                }
//            
            //            groceryList.append(name!)
//            
//            let indexToInsert = groceryList.count == 0 ? 0 : groceryList.count - 1
//            
//            let indexPath = IndexPath(row: indexToInsert, section: 0)
//            
//            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        self.tableView.reloadData()
    }
    
}

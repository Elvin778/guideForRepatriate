//
//  Job.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 3/2/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import Foundation

class Job {
    var nameofCompany = ""
    var profession = ""
    var city = ""
    var salary = ""
    var dateOfJob = ""
    var responsibilities = ""
    var requirements = ""
    var other = ""
    
    init(nameofCompany: String, profession: String, city: String, salary: String, dateOfJob: String, responsibilities: String, requirements: String, other: String) {
        self.nameofCompany = nameofCompany
        self.profession = profession
        self.city = city
        self.salary = salary
        self.dateOfJob = dateOfJob
        self.responsibilities = responsibilities
        self.requirements = requirements
        self.other = other
    }
}

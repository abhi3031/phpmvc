//
//  employee.swift
//  phpmvc
//
//  Created by TOPS on 7/6/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class employee: NSObject {
    
    var emp_id :Int?
    var emp_name:String?
    var emp_add:String?
    var emp_mob:String?
    var emp_img :String?
    init(emp_id :Int,emp_name:String,emp_add:String,emp_mob:String,emp_img:String) {
        
        self.emp_id = emp_id
        self.emp_name = emp_name;
        self.emp_add = emp_add;
        self.emp_mob = emp_mob;
        self.emp_img = emp_img;
        
        
        
        
    }
    

}

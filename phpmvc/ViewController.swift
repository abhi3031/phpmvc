//
//  ViewController.swift
//  phpmvc
//
//  Created by TOPS on 7/6/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,employeedelegate ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var tbl: UITableView!
    var finalarr = [Any]() ;
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
   
    @IBOutlet weak var txtempname: UITextField!
    
    @IBOutlet weak var txtempadd: UITextField!
    
    
    @IBOutlet weak var txtempmob: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let str = "http://localhost/morning/images/5b481e4ec824e.png";
        let url = URL(string: str);
        
        do {
            let dt = try Data(contentsOf: url!)
            
            let img3 = UIImage(data: dt);
            
            img2.image = img3;
            
            

        } catch  {
            
            
        }
        
        self.readdata();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func readdata() {
    
    let emp = employeecontroller();
    
    emp.delgate = self;
    
    emp.getdatafromemp();
    
    }
    
    func jsondataresp(arr:[Any])
    {
        
        DispatchQueue.main.async {
            
               self.finalarr = arr;
            self.tbl.reloadData();
            
        }
     
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return  finalarr.count;
        
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) ;
        
        let dic = finalarr[indexPath.section] as! [String:String];
        if indexPath.row == 0 {
            
            
            cell.textLabel?.text = dic["empid"];
            
        }
        if indexPath.row == 1 {
            
            cell.textLabel?.text = dic["emp_name"];
        }
        if indexPath.row == 2 {
            
            cell.textLabel?.text = dic["emp_add"];
            
        }
        if indexPath.row == 3 {
            
            cell.textLabel?.text =  dic["emp_mob"];
            
        }
        
        return cell;
        
        
    }
    
    @IBAction func btnclick(_ sender: Any) {
        
        let imgdata = UIImageJPEGRepresentation(img.image!, 2);
    
        let base64str = imgdata?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters);
        
        
        let emp = employee(emp_id: 0, emp_name: txtempname.text!, emp_add: txtempadd.text!, emp_mob: txtempmob.text!,emp_img:base64str!);
        
        let obj = employeecontroller();
        
        obj.delgate = self;
        
        
        obj.insertempdata(empobj: emp)
        
        
      
        
        
        
        
    }
    
    func getresp(str:String)
    {
        
        DispatchQueue.main.async {
            self.lbl.text = str;

               self.readdata();
            
        }
        
        
       // print(str);
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  employeecontroller.swift
//  phpmvc
//
//  Created by TOPS on 7/6/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

protocol employeedelegate {
    
    func getresp(str:String);
    
    func jsondataresp(arr:[Any]);
    
    
}


class employeecontroller: NSObject {
    
    
    var delgate:employeedelegate?;
    
    func insertempdata(empobj:employee)  {
        
        let url  = URL(string: "http://localhost/morning/indeximage.php");
        
        let dic = ["emp_name":empobj.emp_name,"emp_add":empobj.emp_add,"emp_mob":empobj.emp_mob,"emp_img":empobj.emp_img];
        do {
            
            let jsondata =  try JSONSerialization.data(withJSONObject: dic, options: []);
            
             var request = URLRequest(url: url!);
            
            
            
            request.addValue(String(jsondata.count), forHTTPHeaderField: "Content-Length");
            request.httpBody = jsondata;
            
            request.httpMethod = "POST";
            
            
            let session = URLSession.shared;
            
            
            let datatask = session.dataTask(with: request) { (data1, resp, err) in
                
                
                if err == nil
                {
                    
                    let strep =  String(data: data1!, encoding: String.Encoding.utf8)
                    print(strep ?? "Ok");
                    
                    
                    self.delgate?.getresp(str: strep!);
                    
                    
                    
                }
                
                
                
                
            }
            
            datatask.resume();

            
            
            

        } catch  {
            
            
            
        }
        
        
        
        
        
        
        }
    
    func getdatafromemp()  {
        
        
        let url  = URL(string: "http://localhost/morning/getdata.php");
        
        let request = URLRequest(url: url!);
        
        let session = URLSession.shared;
        
        
        let datatask = session.dataTask(with: request) { (data1, resp, err) in
            
            
            if err == nil
            {
                
              
                
                do
                {
                    let arr = try JSONSerialization.jsonObject(with: data1!, options: []) as! [Any];
                    
                    
                    
                    self.delgate?.jsondataresp(arr: arr)
                }catch
                {
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            
        }
        
        datatask.resume();
        
        
        
        
    }
    
    
}






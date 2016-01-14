//
//  FuncViewController.swift
//  uidemo
//
//  Created by qingqing on 16/1/14.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit

class FuncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        test1("2")
        test2("2", "3")
        
        var t: String?
        
        let s = t ?? "3"
        print("s \(s)")
    }
    
    func test1(s1: String) {
        
    }
    
    func test2(s1: String, _ s2: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TestViewController.swift
//  uidemo
//
//  Created by qingqing on 16/1/11.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "TestViewController"
        
        var a = 3
        var b = 4
        print(">>>>>>>>>>a \(a) b \(b)")
        swapTwoValues(&a, &b)
        print(">>>>>>>>>>a \(a) b \(b)")
        
        
        
    }
    
    func swapTwoValues<T>(inout a: T, inout _ b: T){
        let temp = a
        a = b
        b = temp
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

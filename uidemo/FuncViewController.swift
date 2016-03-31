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
        
        let bounds = minMax([1, 2, 3, 4, 8])
    
    }
    
    func test1(s1: String) {
        
    }
    
    func test2(s1: String, _ s2: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        
        for value in array {
            if value < currentMin {
                currentMin = value
            }
            else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
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

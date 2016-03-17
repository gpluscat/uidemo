//
//  AlamofireViewController.swift
//  uidemo
//
//  Created by qingqing on 16/1/14.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        
        test1()
        
        let imageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, 345, 4831)
        imageView.contentMode = .ScaleAspectFill
        self.view.addSubview(imageView)
    
        Alamofire.request(.GET, "http://180.235.65.220:4869/5d596a429582e230a66251ff4c72abb0").responseData { response -> Void in
            let data: NSData? = response.data
            if let d = data {
                let image: UIImage? = UIImage(data: d)
                if let t = image {
                    print("image width \(t.size.width) height \(t.size.height)")
                }
                imageView.image = image
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test1() {
        Alamofire.request(.GET, "http://pic2.ooopic.com/01/03/51/25b1OOOPIC19.jpg").responseData { response -> Void in
            
            let data: NSData? = response.data
            if let d = data {
                print("d \(d.length)")
                
                let image: UIImage? = UIImage(data: d)
                print("image \(image)")
                
            }
        }
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

//
//  EnumViewController.swift
//  uidemo
//
//  Created by qingqing on 16/1/14.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit

class EnumViewController: UIViewController {
    
    enum CompassPoint {
        case North
        case South
        case East
        case West
    }
    
    enum Planet {
        case Mercury, Venus, Earth, Mars, Jupiter, Statun,Uranus, Neptune
        case Test
    }
    
    enum Barcode {
        case UPCA(Int, Int, Int, Int)
        case QRCode(String)
    }
    
    
    enum ASCIIControlCharacter: Character {
        case Tab = "\t"
        case LineFeed = "\n"
        case CarriageReturn = "\r"
    }
    
    enum Planet1: Int {
        case Mercury = 1
        case Venus
    }
    
    enum CompassPoint1: String {
        case North, South, East, West
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        var directionToHead = CompassPoint.West
        directionToHead = .East
        print("directionToHead \(directionToHead)")
        
        let productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
        print("productBarcode \(productBarcode)")
        
        let earthsOrder = Planet1.Mercury.rawValue
        print("earthsOrder \(earthsOrder)")
        
        print("compassPoint \(CompassPoint1.West.rawValue)")
        
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

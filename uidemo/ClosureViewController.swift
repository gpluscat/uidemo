//
//  ClosureViewController.swift
//  uidemo
//
//  Created by qingqing on 16/1/13.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {
    
    struct Resolution {
        var width = 0
        var height = 0
    }
    
    class VideoMode {
        var resolution = Resolution()
        
        var interlaced = false
        var name: String?
    }
    
    enum CompassPoint {
        case North,South,East, West
    }
    
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set {
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
        }
    }
    
    struct Cuboid {
        var width = 0.0, height = 0.0, depth = 0.0
        var volume: Double {
            return width * height * depth
        }
    }
    
    class StepCounter {
        var totalSteps: Int = 0 {
            willSet {
                print("About to set totalSteps to \(newValue)")
            }
            
            didSet {
                if totalSteps > oldValue {
                    print("Added \(totalSteps - oldValue)")
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversed = names.sort(backwards)
        print("\(reversed)")
        
        reversed = names.sort({ (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print("\(reversed)")
        
        reversed = names.sort({ s1, s2 in return s1 > s2})
        print("\(reversed)")
        
        reversed = names.sort({s1, s2 in s1 > s2})
        
        reversed = names.sort({$0 > $1})
        
        test1({ (s1: String, s2: String, i3: Int) -> Bool in
            return s1 > s2
        })
        
        test1({s1, s2, i3 in
            print("\(i3)")
            return s1 > s2
        })
        
        test1({
            print("\($2)")
            print("count \($0.characters.count)")
            return $0 > $1
        })
        
        test1() { s1, s2, i3 in
            return s1 > s2
        }
        
        test1(){
            print("\($2)")
            return $0 > $1
        }
        
        test1 {
            print("\($2)")
            return $0 > $1
        }
        
        let clo: () -> Int = makeIncrementor(forIncrement: 3)
        clo()
        clo()
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        
        print("Width \(someResolution.width)")
        print("Width \(someVideoMode.resolution.width)")
        
        someVideoMode.resolution.width = 1280
        print("Width \(someVideoMode.resolution.width)")
        
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        
        cinema.width = 2048
        print("cinema width \(cinema.width)")
        print("hd width \(hd.width)")
        
        var currentDirection = CompassPoint.West
        let rememberedDirection = currentDirection
        
        currentDirection = .East
        
        if rememberedDirection == .West {
            print("The remembered direction is still .West")
        }
        
        var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
        
        let initialSquareCenter = square.center
        
        print("\(initialSquareCenter)")
        
        square.center = Point(x: 15, y: 15)
        
        print("square.origin is now at \(square.origin.x) \(square.origin.y)")
        
        let foruByFiveByTow = Cuboid(width: 4, height: 5, depth: 2)
        print("the volume of \(foruByFiveByTow.volume)")
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
    }
    
    func test1(clo: (s1: String, s2: String, i3: Int) -> Bool) {
        
    }
    
    func test2() {
        self.dismissViewControllerAnimated(true){ [weak self] () -> Void in
            self?.didReceiveMemoryWarning()
        }
    }
    
    func makeIncrementor(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            print("runningTotal \(runningTotal)")
            return runningTotal
        }
        return incrementor
    }
    
    func backwards(s1: String, s2: String) -> Bool {
        return s1 > s2
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

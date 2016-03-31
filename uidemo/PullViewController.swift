//
//  PullViewController.swift
//  uidemo
//
//  Created by qingqing on 16/3/17.
//  Copyright © 2016年 qingqing. All rights reserved.
//

import UIKit

class PullViewController: UIViewController, UITableViewDataSource {
    var iTableView: UITableView!

    private var list: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.iTableView = UITableView()
        self.iTableView.translatesAutoresizingMaskIntoConstraints = false
        self.iTableView.dataSource = self
        self.view.addSubview(self.iTableView)
        
        let cView = self.iTableView
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[cView]|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["cView": cView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[cView]|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["cView": cView]))
        
        self.iTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "kCell")
    }
    
    private func refresh() {
        list.removeAll()
        for var i = 0; i < 20; i++ {
            list.append("refresh \(i)")
        }
        self.iTableView.reloadData()
        self.iTableView.pullToRefreshView.stopAnimating()
    }
    
    private func loadMore() {
        list.append("4")
        
        self.iTableView.reloadData()
        self.iTableView.infiniteScrollingView.stopAnimating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.iTableView.addPullToRefreshWithActionHandler { [weak self] () -> Void in
            if let weakSelf = self {
                weakSelf.refresh()
            }
        }
        
        self.iTableView.addInfiniteScrollingWithActionHandler { [weak self] () -> Void in
            if let weakSelf = self {
                weakSelf.loadMore()
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("kCell")
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }

}

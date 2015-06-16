//
//  TableViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 6/16/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import PullToRefresh

class TableViewController: PullToRefresh.TableViewController {

    var count = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = indexPath.row.description

        return cell
    }

    func refreshControlEndRefresh() {
        refreshControl?.endRefreshing()
    }

    override func willLoadRequest() {
        println("will load request")
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.loadRequestControlEndRefresh()
        })
    }

    func loadRequestControlEndRefresh() {
        loadRequestControl.endRefreshing()
    }

}

//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 4/1/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = "\(indexPath.row)"

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var viewController: UIViewController?
        switch indexPath.row {
        case 0:
            viewController = TableViewController()
        case 1:
            viewController = CollectionViewController()
        default:
            break
        }

        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}


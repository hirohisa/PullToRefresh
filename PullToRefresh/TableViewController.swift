//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by Hirohisa Kawasaki on 6/16/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

public class TableViewController: UITableViewController {

    public var loadRequestControl = UIRefreshControl()

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func willLoadRequest() {
    }

    public override func scrollViewDidScroll(scrollView: UIScrollView) {

        let overtop = scrollView.contentOffset.y + scrollView.contentInset.top < 0
        if refreshControl == nil && overtop {
            requestOvertop()
        }

        let bottom = scrollView.contentOffset.y + scrollView.frame.height
        if bottom >= view.frame.height && bottom >= scrollView.contentSize.height && state == .Ready {
            _willLoadRequest()
        }
    }

    private var state: State {
        if loadRequestControl.refreshing {
            return .Requesting
        }
        return .Ready
    }

    public func requestOvertop() {
    }

}

extension TableViewController {

    enum State {
        case Ready
        case Requesting
    }

    func _willLoadRequest() {
        loadRequestControl.beginRefreshing()
        self.willLoadRequest()
    }

}

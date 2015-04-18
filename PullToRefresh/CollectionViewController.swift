//
//  CollectionViewController.swift
//  PullToRefresh
//
//  Created by Hirohisa Kawasaki on 4/1/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

enum State {
    case Ready
    case Reqesting
}

public class CollectionViewController: UICollectionViewController {

    var refreshControl = UIRefreshControl()
    var state: State = .Ready

    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.addSubview(refreshControl)
        refreshControl.addTarget(self, action: "viewWillRefresh", forControlEvents: UIControlEvents.ValueChanged)
    }

    public func viewWillRefresh() {
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.viewDidRefresh()
        })
    }

    public func viewDidRefresh() {
        refreshControl.endRefreshing()
    }

    public func viewWillRequest() {
        println("will")
        state = .Reqesting
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.viewDidRequest()
        })
    }

    public func viewDidRequest() {
        state = .Ready
        println("did")
    }

    public override func scrollViewDidScroll(scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.height
        if bottom >= scrollView.contentSize.height && state == .Ready {
            viewWillRequest()
        }
    }
}
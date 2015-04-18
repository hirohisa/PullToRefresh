//
//  CollectionViewController.swift
//  PullToRefresh
//
//  Created by Hirohisa Kawasaki on 4/1/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

public class CollectionViewController: UICollectionViewController {

    public var refreshControl = UIRefreshControl()
    public var loadRequestControl = UIRefreshControl()

    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.addSubview(refreshControl)
        refreshControl.addTarget(self, action: "_viewWillRefresh", forControlEvents: UIControlEvents.ValueChanged)
    }

    public func viewWillRefresh() {
    }

    public func viewDidRefresh() {
        refreshControl.endRefreshing()
    }

    public func viewWillLoadRequest() {
    }

    public func viewDidLoadRequest() {
        loadRequestControl.endRefreshing()
    }

    public override func scrollViewDidScroll(scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.height
        if bottom >= scrollView.contentSize.height && state == .Ready {
            _viewWillLoadRequest()
        }
    }

    private var state: State {
        if loadRequestControl.refreshing {
            return .Reqesting
        }
        return .Ready
    }
}

extension CollectionViewController {

    enum State {
        case Ready
        case Reqesting
    }

    func _viewWillRefresh() {
        self.viewWillRefresh()
    }

    func _viewWillLoadRequest() {
        loadRequestControl.beginRefreshing()
        self.viewWillLoadRequest()
    }

}
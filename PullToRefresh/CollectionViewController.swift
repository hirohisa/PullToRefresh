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

    public var refreshControl = UIRefreshControl()
    var state: State = .Ready

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
        state = .Ready
    }

    public override func scrollViewDidScroll(scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.height
        if bottom >= scrollView.contentSize.height && state == .Ready {
            _viewWillLoadRequest()
        }
    }
}

extension CollectionViewController {

    func _viewWillRefresh() {
        self.viewWillRefresh()
    }

    func _viewWillLoadRequest() {
        state = .Reqesting
        self.viewWillLoadRequest()
    }

}
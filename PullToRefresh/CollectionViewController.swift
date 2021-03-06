//
//  CollectionViewController.swift
//  PullToRefresh
//
//  Created by Hirohisa Kawasaki on 4/1/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

public class CollectionViewController: UICollectionViewController {

    public var refreshControl: UIRefreshControl? = UIRefreshControl()
    public var loadRequestControl = UIRefreshControl()

    public override func viewDidLoad() {
        super.viewDidLoad()

        if let refreshControl = refreshControl {
            collectionView?.addSubview(refreshControl)
            refreshControl.addTarget(self, action: "_willRefresh", forControlEvents: UIControlEvents.ValueChanged)
        }
    }

    public func willRefresh() {
    }

    public func willLoadRequest() {
    }

    public override func scrollViewDidScroll(scrollView: UIScrollView) {
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
}

extension CollectionViewController {

    enum State {
        case Ready
        case Requesting
    }

    func _willRefresh() {
        self.willRefresh()
    }

    func _willLoadRequest() {
        loadRequestControl.beginRefreshing()
        self.willLoadRequest()
    }

}
//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 4/1/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import PullToRefresh

let reuseIdentifier = "Cell"

class ViewController: PullToRefresh.CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.whiteColor()

        let collectionViewLayout = UICollectionViewFlowLayout()
        let width = view.frame.width/2
        collectionViewLayout.itemSize = CGSize(width: width, height: 100)
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        collectionView?.collectionViewLayout = collectionViewLayout

        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell

        var backgroundColor = UIColor.blackColor()
        switch indexPath.row%3 {
        case 1:
            backgroundColor = UIColor.grayColor()
        case 2:
            backgroundColor = UIColor.lightGrayColor()
        default:
            break
        }
        cell.backgroundColor = backgroundColor

        return cell
    }

    override func willRefresh() {
        println("will refresh")
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.refreshControlEndRefresh()
        })
    }

    func refreshControlEndRefresh() {
        refreshControl.endRefreshing()
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

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
    }
}


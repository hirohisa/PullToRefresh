PullToRefresh
=============

Use `UIRefreshControl` on UICollectionViewController.

![ ](Example/pulltorefresh.png)


Usage
-------------

- UIRefreshControl start animation and call method
  ```
  func viewWillRefresh()
  ```

- UIRefreshControl end animation. It needs to be called by `self view controller`.
  ```
  func viewDidRefresh()
  ```

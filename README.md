# PullToRefresh

Use `UIRefreshControl` on UICollectionViewController.

![ ](Example/pulltorefresh.png)

## Features
- [x] Support to pull to refresh
- [ ] Support to load request after scrolling bottom
- [ ] Create UITableViewController


## Usage

- UIRefreshControl start animation and call method
  ```
  func viewWillRefresh()
  ```

- UIRefreshControl end animation. It needs to be called by `self view controller`.
  ```
  func viewDidRefresh()
  ```

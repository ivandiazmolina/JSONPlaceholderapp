//
//  IntrinsicHeightTableView.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class IntrinsicHeightTableView: UITableView {
  override var contentSize: CGSize {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }
  override var intrinsicContentSize: CGSize {
    layoutIfNeeded()
    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
  }
}
class ReloadDataIntrinsicHeightTableView: UITableView {
  var contentSizeBool = true
  override var contentSize: CGSize {
    didSet {
      if contentSizeBool {
        invalidateIntrinsicContentSize()
      }
    }
  }
  override func reloadData() {
    super.reloadData()
    invalidateIntrinsicContentSize()
    layoutIfNeeded()
  }
  override var intrinsicContentSize: CGSize {
    layoutIfNeeded()
    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
  }
}
class ReloadDataIntrinsicHeightWithBottomMargin16TableView: UITableView {
  var contentSizeBool = true
  override var contentSize: CGSize {
    didSet {
      if contentSizeBool {
        invalidateIntrinsicContentSize()
      }
    }
  }
  override func reloadData() {
    super.reloadData()
    invalidateIntrinsicContentSize()
    layoutIfNeeded()
  }
  override var intrinsicContentSize: CGSize {
    layoutIfNeeded()
    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height + 16)
  }
}
class ReloadDataIntrinsicHeightCollectionView: UICollectionView {
  var contentSizeBool = true
  override var contentSize: CGSize {
    didSet {
      if contentSizeBool {
        invalidateIntrinsicContentSize()
      }
    }
  }
  override func reloadData() {
    super.reloadData()
    invalidateIntrinsicContentSize()
    layoutIfNeeded()
  }
  override var intrinsicContentSize: CGSize {
    layoutIfNeeded()
    return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
  }
}

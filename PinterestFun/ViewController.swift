//
//  ViewController.swift
//  PinterestFun
//
//  Created by argenis delarosa on 3/30/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    
    let images = [#imageLiteral(resourceName: "image-1"), #imageLiteral(resourceName: "image-3"), #imageLiteral(resourceName: "image-5"), #imageLiteral(resourceName: "image-6"), #imageLiteral(resourceName: "image-7"), #imageLiteral(resourceName: "image-2"), #imageLiteral(resourceName: "image-4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        } 
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

//MARK: - Flow layout delegate

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.item]
        let height = image.size.height
        
        return height
    }
}

// MARK: DATA SOURCE

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
}

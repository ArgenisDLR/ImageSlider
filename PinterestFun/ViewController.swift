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
    
    let images = [photonog, image2, image3, image4, image5, image6, image7]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

// MARK: DATA SOURCE

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
}

//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/12/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox

class MyCustomPointAnnotation: MGLPointAnnotation {
    var willUseImage: Bool = false
}

@objc class HomeViewController: BaseViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mapView: MGLMapView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var currentLocationView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var whereGoLabel: UILabel!
    @IBOutlet weak var timeStandLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeCateogry: [HomeCategory] = []
    
    var sizingCell: HomeItemCollectionViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        mapView.styleURL = MGLStyle.lightStyleURL
        mapView.tintColor = .currentLocationColor
        mapView.logoView.isHidden = true
        mapView.attributionButton.isHidden = true
        mapView.delegate = self
        mapView.showsUserLocation = true
        menuView.setRadiusView(currentLocationView.frame.size.height/2)
        currentLocationView.setRadiusView(currentLocationView.frame.size.height/2)
        bottomView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth,
                                                     height: bottomView.bounds.size.height),
                                                     colors: [.clear, .white])
        whereGoLabel.text = "Where are you going \ntoday?"
        timeStandLabel.text = timeStandLabel.text?.getDateTimeCurrent()
        homeCateogry = [HomeCategory("Saved places", UIImage(named: "valentines-heart")),
                        HomeCategory("Work", UIImage(named: "work")),
                        HomeCategory("Home", UIImage(named: "home-button")),
                        HomeCategory("Plan", UIImage(named: "plan")),]
        collectionView.register(UINib(nibName: HomeItemCollectionViewCell.nibName(), bundle: nil),
                                forCellWithReuseIdentifier: HomeItemCollectionViewCell.nibName())
        sizingCell = (UINib(nibName: HomeItemCollectionViewCell.nibName(), bundle: nil).instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! HomeItemCollectionViewCell?
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        }
        collectionView.reloadData()
    }
}

extension HomeViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        mapView.setCenter((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, animated: true)
    }
}
//
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeCateogry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.nibName(),
                                                      for: indexPath) as! HomeItemCollectionViewCell
        cell.titleLabel.text = homeCateogry[indexPath.row].title
        cell.thumbaiImageView.image = homeCateogry[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizingCell!.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.row)")
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return (homeCateogry[indexPath.row].title as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)])
//    }
}

struct HomeCategory {
    var title: String
    var image: UIImage?
    
    init(_ title: String,_ image: UIImage?) {
        self.title = title
        self.image = image
    }
}

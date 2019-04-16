//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/12/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox

@objc class HomeViewController: BaseViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mapView: MGLMapView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var currentLocationView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var whereGoLabel: UILabel!
    @IBOutlet weak var timeStandLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    var homeCateogry: [HomeCategory] = []
    
    var sizingCell: HomeItemCollectionViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: METHODS
    override func setupView() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationItem.hidesBackButton = true
        mapView.styleURL = MGLStyle.lightStyleURL
        mapView.tintColor = .currentLocationColor
        mapView.logoView.isHidden = true
        mapView.attributionButton.isHidden = true
        mapView.delegate = self
        mapView.showsUserLocation = true
        menuView.setRadiusView(currentLocationView.frame.size.height/2)
        currentLocationView.setRadiusView(currentLocationView.frame.size.height/2)
        whereGoLabel.text = "Where are you going \ntoday?"
        timeStandLabel.text = timeStandLabel.text?.getDateTimeCurrent()
        homeCateogry = [HomeCategory("Saved places", UIImage(named: "valentines-heart")),
                        HomeCategory("Work", UIImage(named: "work")),
                        HomeCategory("Home", UIImage(named: "home-button")),
                        HomeCategory("Plan", UIImage(named: "plan"))]
        collectionView.register(UINib(nibName: HomeItemCollectionViewCell.nibName(), bundle: nil),
                                forCellWithReuseIdentifier: HomeItemCollectionViewCell.nibName())
        DispatchQueue.main.async {
            self.collectionLayout.estimatedItemSize = CGSize(width: 50, height: 25)
            self.collectionLayout.itemSize = UICollectionViewFlowLayout.automaticSize
//            self.collectionView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth,
//                                                                       height: self.collectionView.bounds.size.height),
//                                                         colors: [.clear, .white])
            self.collectionView.reloadData()
        }
    }
    
    //MARK: ACTIONS
    
    @IBAction func onCurrentLocationAction(_ sender: Any) {
        mapView.setCenter((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, animated: true)
    }
    
    @IBAction func onSearchAction(_ sender: Any) {
        let searchVC = SearchViewController.initWithDefaultNib()
        present(searchVC, animated: true, completion: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.row)")
        bottomView.removeFromSuperview()
    }
}

struct HomeCategory {
    var title: String
    var image: UIImage?
    
    init(_ title: String,_ image: UIImage?) {
        self.title = title
        self.image = image
    }
}

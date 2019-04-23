//
//  PlaceNearYou.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

protocol PlaceNearViewDelegate {
    func onDismissView(_ view: PlaceNearView,_ sender: Any)
}
class PlaceNearView: UIView, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: PlaceNearViewDelegate?
    var nearbyModel: [NearByModel] = []
    var type: Types = .unknow
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
       titleLabel.text = "Saved places \nnear you"
//       containerView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth,
//                                                             height: containerView.bounds.height),
//                                                             colors: [.clear, .white])
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: 140, height: collectionView.frame.size.height)
        getData()
    }
    
    func getData() {
        if let location = LocationManager.shared.userLocation?.coordinate {
            let settingService = SettingService()
            settingService.cancelAllRequests()
            showHud()
            settingService.getNearBySearch(lat: location.latitude, lng: location.longitude, radius: 1500) { (model, err) in
                if err == nil {
                    self.nearbyModel = model
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } else {
                    if let error = err {
                        print(error.localizedDescription)
                    }
                }
                self.hideHude()
            }
        }
    }
    
    @IBAction func onBackAction(_ sender: Any) {
        delegate?.onDismissView(self, sender)
    }
    
    class func instanceFromNib() -> PlaceNearView {
        let view = UINib(nibName: PlaceNearView.classString(),
                         bundle: nil).instantiate(withOwner: self, options: nil).first as? PlaceNearView
        view?.collectionView.register(UINib(nibName: BaseItemCollectionViewCell.nibName(),
                                            bundle: nil),
                                            forCellWithReuseIdentifier: BaseItemCollectionViewCell.nibName())
        view?.collectionView.dataSource = view
        //view?.collectionView.reloadData()
        return view!
    }
}

extension PlaceNearView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nearbyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseItemCollectionViewCell.nibName(),
                                                      for: indexPath) as! BaseItemCollectionViewCell
        cell.bindingWithData(nearbyModel[indexPath.row])
        return cell
    }
}

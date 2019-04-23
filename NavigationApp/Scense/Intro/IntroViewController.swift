//
//  IntroViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/11/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class IntroViewController: BaseViewController {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gotItButton: UIButton!
    
    var introPlace: [IntroPlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBarItemAction))
        thumbaiImageView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth, height: Constants.iHeight), colors: [.clear, .black], alpha: 1)
        gotItButton.setRadiusButton(5)
        titleLabel.text = "Can't decide where to go next? \nWe've got you covered with best \nCity Guides and Maps for more than 30 world cities."
        introPlace = [IntroPlace("Hà Nội", nil),
                      IntroPlace("Hải Phòng", nil),
                      IntroPlace("Đà Nẵng", nil),
                      IntroPlace("Huế", nil),
                      IntroPlace("Nha Trang", nil),
                      IntroPlace("Hưng yên", nil),
                      IntroPlace("Vĩnh Phúc", nil),
                      IntroPlace("Ninh Bình", nil),
                      IntroPlace("Móng Cái", nil),
                      IntroPlace("Ninh Thuận", nil),
                      IntroPlace("Hồ Chí Minh", nil),]
        tableView.register(UINib(nibName: IntroItemTableViewCell.nibName(), bundle: nil), forCellReuseIdentifier: IntroItemTableViewCell.nibName())
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = 40
        tableView.reloadData()
    }
    
    //MARK: ACTIONS
    @IBAction func onGotitAction(_ sender: Any) {
        let downloadMapVC = DownloadMapOfflineViewController.initWithDefaultNib()
        navigationController?.pushViewController(downloadMapVC, animated: true)
    }
}

extension IntroViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return introPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = IntroItemTableViewCell.dequeueReuseCellWithClass(in: tableView, reuseIdentifier: IntroItemTableViewCell.nibName())
        cell.nameLabel.text = introPlace[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath :\(indexPath.row)")
    }
}

struct IntroPlace {
    var title: String
    var desc: String?
    
    init(_ title: String,_ desc: String?) {
        self.title = title
        self.desc = desc
    }
}

//color text:000000
//color button:4CD964
//currentlocation COlor:4BD562

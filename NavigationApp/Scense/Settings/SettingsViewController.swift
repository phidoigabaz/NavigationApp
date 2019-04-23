//
//  SettingsViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/19/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: METHODS
    override func setupView() {
        baseDataModel.parseSettingData()
    }
    
    //MARK: ACTIONS
    @IBAction func onBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return baseDataModel.sectionModel.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseDataModel.sectionModel[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard baseDataModel.sectionModel.count > indexPath.section else {
            return UITableViewCell()
        }
        let rowModel = baseDataModel.sectionModel[indexPath.section].rows[indexPath.row]
        if rowModel.identifier == SettingItemTableViewCell.nibName() {
            let cell = SettingItemTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: SettingItemTableViewCell.nibName())
            if indexPath.row == 0 {
                cell.nameLabel.isHidden = false
                cell.avatarImageView.isHidden = false
                cell.nameLabel.text = "Alberta Maxwell"
            }
            cell.titleLabel.text = rowModel.title
            return cell
        } else if rowModel.identifier == MenuSetupTableViewCell.nibName() {
            let cell = MenuSetupTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: MenuSetupTableViewCell.nibName())
            cell.titleLabel.text = rowModel.title
            return cell
        } else if rowModel.identifier == MapStyleTableViewCell.nibName() {
            let cell = MapStyleTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: MapStyleTableViewCell.nibName())
            cell.titleLabel.text = rowModel.title
            return cell
        } else {
            let cell = SettingSizeTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: SettingSizeTableViewCell.nibName())
            cell.titleLabel.text = rowModel.title
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard baseDataModel.sectionModel.count > section else {
            return nil
        }
        let view = BaseHeaderTableView.dequeueReuseHeaderWithNib(in: tableView, reuseIdentifier: BaseHeaderTableView.nibName())
        view.titleLabel.text = baseDataModel.sectionModel[section].header.title
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 2 ? 140 : 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return baseDataModel.sectionModel[section].header.title == nil ? 0 : 50
    }
}

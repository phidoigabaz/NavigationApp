//
//  MenuViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/18/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: METHODS
    override func setupView() {
        dismissButton.setRadiusButton(dismissButton.frame.height/2)
        baseDataModel.parseMenuListData()
    }
    
    //MARK: ACTIONS
    @IBAction func onDismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension MenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return baseDataModel.sections.count
        case 2:
            return baseDataModel.sections1.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = MenuHeaderTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: MenuHeaderTableViewCell.nibName())
            return cell
        case 1:
            let cell = MenuItemTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: MenuItemTableViewCell.nibName())
            cell.titleLabel.text = baseDataModel.sections[indexPath.row].title
            return cell
        default:
            let cell = MenuSetupTableViewCell.dequeueReuseCellWithNib(in: tableView, reuseIdentifier: MenuSetupTableViewCell.nibName())
            cell.titleLabel.text = baseDataModel.sections1[indexPath.row].title
            let lastRowIndex = tableView.numberOfRows(inSection: tableView.numberOfSections-1)
            cell.bindingWithData(indexPath.row, lastRowIndex)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 50
        default:
            return indexPath.row == 0 ? 150 : 60
        }
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if indexPath.row == 3 {
                let settingsVC = SettingsViewController.initWithDefaultNib()
                present(settingsVC, animated: true, completion: nil)
            }
        default:
            break
        }
    }
}

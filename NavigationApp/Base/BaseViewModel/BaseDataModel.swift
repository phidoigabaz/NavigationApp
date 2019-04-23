//
//  BaseDataModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class BaseDataModel: NSObject {
//    var sections = [BaseViewModel]()
//    var sections1 = [BaseViewModel]()
    var sections = [BaseViewModel]()
    var sections1 = [BaseViewModel]()
    var sectionModel = [SectionModel]()
    
    func parseHomeData() {
        sections.removeAll()
        sections.append(BaseViewModel("Saved places",nil,MenuItemTableViewCell.nibName() ,UIImage(named: "valentines-heart")))
        sections.append(BaseViewModel("Work",nil,MenuItemTableViewCell.nibName(), UIImage(named: "work")))
        sections.append(BaseViewModel("Home",nil,MenuItemTableViewCell.nibName(), UIImage(named: "home-button")))
        sections.append(BaseViewModel("Plan",nil,MenuItemTableViewCell.nibName(), UIImage(named: "plan")))
    }
    
    func parseMenuListData() {
        sections.removeAll()
        sections.append(BaseViewModel("My favorites", nil, MenuItemTableViewCell.nibName(), nil))
        sections.append(BaseViewModel("Find friends", nil, MenuItemTableViewCell.nibName(), nil))
        sections.append(BaseViewModel("Offline maps", nil, MenuItemTableViewCell.nibName(), nil))
        sections.append(BaseViewModel("Settings", nil, MenuItemTableViewCell.nibName(), nil))
        
        sections1.removeAll()
        sections1.append(BaseViewModel("Dark mode", nil, MenuSetupTableViewCell.nibName(), nil))
        sections1.append(BaseViewModel("Traffic", nil, MenuSetupTableViewCell.nibName(), nil))
        sections1.append(BaseViewModel("Report an issue", nil, MenuSetupTableViewCell.nibName(), nil))

    }
    
    func parseSettingData() {
        sectionModel.removeAll()
        parseData("Account", [(title: "Change details", desc: nil,image: nil),
                              (title: "Address book",desc: nil, image: nil),
                              (title: "History",desc: nil, image: nil),
                              (title: "My places",desc: nil, image: nil)], SettingItemTableViewCell.nibName())
        parseData("General", [(title: "Navigation settings",desc: nil, image: nil),
                              (title: "Download maps only by Wi-Fi",desc: nil, image: nil)], MenuSetupTableViewCell.nibName())
        parseData(nil, [(title: "Map type",desc: nil, image: nil)],         MapStyleTableViewCell.nibName())
        parseData(nil, [(title: "Font & icons size",desc: nil, image: nil)], SettingSizeTableViewCell.nibName())
    }
    
    func parseData(_ title: String?, _ data: [(title: String,desc: String?,image: UIImage?)], _ identifier: String) {
        let headerRequest = HeaderModel(title: title,
                                        identifier: BaseHeaderTableView.classString())
        var rows = [BaseViewModel]()
        for item in data {
            rows.append(BaseViewModel(item.title, item.desc, identifier, item.image))
        }
        let requestSection = SectionModel(rows: rows, header: headerRequest)
        sectionModel.append(requestSection)
    }
}

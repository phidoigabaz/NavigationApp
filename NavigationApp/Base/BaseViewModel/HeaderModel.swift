//
//  HeaderModel.swift
//  LFRPlatform
//
//  Created by Đinh Ngọc Vũ on 10/15/18.
//  Copyright © 2018  All rights reserved.
///

import Foundation
struct HeaderModel: PBaseHeaderModel {
    var title: String?
    var identifier: String?
    init(title: String? = nil, identifier: String? = nil) {
        self.title = title
        self.identifier = identifier
    }
}


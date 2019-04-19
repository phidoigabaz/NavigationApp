//
//  Protocols.swift
//  LFRPlatform
//
//  Created by Đinh Ngọc Vũ on 10/15/18.
//  Copyright © 2018  All rights reserved.
//

import Foundation

//protocol RowModelConvertible {
//    func rowModel() -> PBaseRowModel
//}

protocol PBaseSectionModel {
    associatedtype Cell
    associatedtype Header
    var header: Header {set get}
    var rows: [Cell] {set get}
}

protocol PBaseRowModel {
    var title: String {set get}
    var desc: String? {set get}
    var identifier: String {set get}
    var image: UIImage? {set get}
}

protocol PBaseHeaderModel {
    var title: String? {set get}
    var identifier: String? {set get}
}


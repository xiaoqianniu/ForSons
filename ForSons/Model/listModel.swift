//
//  listModel.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-08.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import Foundation
import RealmSwift

class List : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var check : Bool = false
}


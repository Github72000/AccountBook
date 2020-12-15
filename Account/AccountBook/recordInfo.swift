//
//  recordInfo.swift
//  AccountBook
//
//  Created by 陈华纲 on 2020/12/14.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import Foundation
import UIKit


class recordInfo : NSObject,NSCoding
{
    
    static let userPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! + "/recordList.data"
    
    func encode(with coder: NSCoder) {
        coder.encode(self.place, forKey: "placeKey")
        coder.encode(self.cost,forKey: "costKey")
        coder.encode(self.date,forKey: "dateKey")
        coder.encode(self.item,forKey: "itemKey")
    }
    
    required init?(coder: NSCoder) {
        place = (coder.decodeObject(forKey: "placeKey") as? String)
        cost = (coder.decodeObject(forKey: "costKey") as? String)
        date = (coder.decodeObject(forKey: "dateKey") as? String)
        item = (coder.decodeObject(forKey: "itemKey") as? String)
    }
    
    var cost: String?
    var place: String?
    var date: String?
    var item: String?
    
    init(item:String , cost:String ,date: String,place:String) {
        self.item = item
        self.cost = cost
        self.date = date
        self.place = place
    }
}

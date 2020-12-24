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
        coder.encode(self.itemName,forKey: "itemKey")
    }
    
    required init?(coder: NSCoder) {
        place = (coder.decodeObject(forKey: "placeKey") as? String)
        cost = (coder.decodeObject(forKey: "costKey") as? Float)
        date = (coder.decodeObject(forKey: "dateKey") as? Date)
        itemName = (coder.decodeObject(forKey: "itemKey") as! String)
    }
    
    var cost: Float?
    var place: String?
    var date: Date? //日期精确到分，一般只用到日 "yyyy/MM/dd HH:mm"
    //consider to use DateFormmatter to format the date
    /*
     if you want to show the month, day, and year without showing the time,
     you would set the dateStyle property to DateFormatter.Style.long and the
     timeStyle property to DateFormatter.Style.none.
     */
    
    
    var itemName: String
    
    
    init(itemName:String , cost:String ,date: String,place:String) {
        self.itemName = itemName
        self.cost = Float(cost)
        self.date = ABFormatter.dateFormatter.date(from: date)
        self.place = place
    }
    
    init(itemName:String,cost:Float,date:Date,place:String){
        self.itemName=itemName
        self.cost=cost
        self.date=date
        self.place=place
    }
    
    
}

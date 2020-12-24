//
//  File.swift
//  AccountBook
//
//  Created by Kotori on 2020/12/24.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import Foundation

class StatInfo : NSObject
{
    
    static let userPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! + "/recordList.data"
    
    //统计日期 精确到日
    var date: Date?
    //支出数
    var output: Float?
    //收入数
    var input: Float?
    
    
    init(date: String, input:Float , output:Float) {
        self.date = ABFormatter.dateFormatter.date(from: date)
        self.input = input
        self.output = output
    }
    
    
    
}

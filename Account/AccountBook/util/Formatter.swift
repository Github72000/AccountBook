//
//  Formatter.swift
//  AccountBook
//
//  Created by FengCL on 2020/12/16.
//  Copyright © 2020 陈华纲. All rights reserved.
//
import Foundation

class ABFormatter{
    static var dateFormatter:DateFormatter=initDateFormmatter()
    
    static func initDateFormmatter() -> DateFormatter{
        let fmt = DateFormatter()
        //fmt.dateStyle = .long //Specifies a long style, typically with full text, such as “November 23, 1937” or “3:30:32 PM PST”.
        //fmt.timeStyle = .short
        fmt.locale = .current
        fmt.dateFormat="yyyy/MM/dd HH:mm"
        
        return fmt
    }
    
    //省去年份的转换函数
    static func convertStringToCurrentYearDate(month:Int,day:Int,hour:Int?,minute:Int?)->Date{
        let now=Date.init();
        let calender=Calendar.autoupdatingCurrent
        let year=calender.component(.year, from: now)
        var token_builder=year.description;
        token_builder=token_builder+"/"+month.description+"/"+day.description+" "
        
        if hour != nil && minute != nil {
                token_builder.append("\(hour!):\(minute!)")
        }
        
        return ABFormatter.dateFormatter.date(from: token_builder)!;
        
    }
    
    
}

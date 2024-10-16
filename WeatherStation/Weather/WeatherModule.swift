//
//  dataService.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/28/24.
//




//
//  DataService.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/13/24.
//

import Foundation

struct Weather: Hashable, Codable {
    var date: String
    var time: String
    let tempCurr: String
    let tempHigh: String
    let tempHighTime: String
    let tempLow: String
    let tempLowTime: String
    let tempMonthHigh:String
    let tempMonthLow: String
    let tempYearHigh: String
    let tempYearLow: String
    let windCurr: String
    let windDir: String
    let windHigh: String
    let windHighTime: String
    let windMonthHigh:String
    let windYearHigh:String
    let rainToday: String
    let rainStorm: String
    let rainMonth: String
    let rainSeason: String
    let rainRate: String
    let humidCurr: String
    let humidHigh: String
    let humidHighTime: String
    let humidLow: String
    let humidLowTime: String
}


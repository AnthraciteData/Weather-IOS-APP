//
//  Forecast.swift
//  RealWeatherAPP
//
//  Created by AceDarkKronik on 9/8/21.
//

import Foundation
struct Forecast:Codable{
    struct List:Codable {
        let id:Int
        let name:String
        struct Main:Codable {
            let temp:Double
            let temp_min:Double
            let temp_max:Double
        }
        let main:Main
        let dt:Date
        struct Sys:Codable {
            let country:String
        }
        let sys:Sys
        struct Weather:Codable {
            let description:String
            let icon:String
           
            
        }
        let weather:[Weather]
        
        
    }
    let list:[List]
    
}


//
//  ForecastViewModel.swift
//  RealWeatherAPP
//
//  Created by AceDarkKronik on 9/9/21.
//

import Foundation

struct ForecastViewModel {
    let forecast: Forecast.List
    var system:Int
    
    private static var dateFormatter: DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    private static var numberForematter: NumberFormatter{
        let numberForematter = NumberFormatter()
        numberForematter.maximumFractionDigits = 0
        return numberForematter
    }
    func convert(_ temp:Double)->Double{
        let celsius = temp -  273.5
        if system == 0{
            return celsius
        }else{
            return celsius * 9 / 5 + 32
        }
    }
    
    
    var id:String{
        return "ID:\(Self.numberForematter.string(for: forecast.id) ?? "0")°"
    }
    var day:String{
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var nameLoc:String{
        return "\(forecast.name.capitalized),\(forecast.sys.country)"
    }
    
    var overView:String{
        forecast.weather[0].description.capitalized
    }
    var high:String{
        return "H:\(Self.numberForematter.string(for: convert(forecast.main.temp_max)) ?? "0")°"
    }
    var low:String{
        return "L:\(Self.numberForematter.string(for: convert(forecast.main.temp_min)) ?? "0")°"
    }
    var current:String{
        return "C:\(Self.numberForematter.string(for: convert(forecast.main.temp)) ?? "0")°"
    }
    var weatherIconURL:URL{
        let urlString = "https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
    
    
}

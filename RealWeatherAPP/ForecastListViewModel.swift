//
//  ForecastListViewModel.swift
//  RealWeatherAPP
//
//  Created by AceDarkKronik on 9/9/21.
//

import Foundation
import SwiftUI

class ForecastListViewModel:ObservableObject {
    struct AppError:Identifiable {
        let id = UUID().uuidString
        let errorString:String
    }
    @Published var forecasts:[ForecastViewModel] = []
    var appError: AppError? = nil
    @Published var isLoading: Bool = false
    @AppStorage("location")var storagelocation:String = ""
    @Published var location = ""
    @AppStorage("system") var system: Int = 0{
        didSet{
            for i in 0..<forecasts.count{
                forecasts[i].system =  system
            }
        }
    }
    init() {
        location = storagelocation
        getWeatherForecast()
    }
     
    func getWeatherForecast()  {
        storagelocation = location
        UIApplication.shared.endEditing()
        if location == ""{
            forecasts = []
        }else{
        isLoading = true
        let apiService = APIService.shared
        apiService.getJSON(urlString: "https://community-open-weather-map.p.rapidapi.com/find?q=\(location)") { (result: Result<Forecast,APIService.APIError>) in
            switch result{
            case.success(let forecast):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.forecasts = forecast.list.map{ForecastViewModel(forecast: $0,system: self.system)}
                }
            case.failure(let apiError):
                switch apiError{
                case.error(let errorString):
                    self.appError = AppError(errorString: errorString)
                    self.isLoading = false
                    print(errorString)
                }
            }
        }
    }
    }
}

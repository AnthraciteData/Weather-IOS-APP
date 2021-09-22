//
//  ContentView.swift
//  RealWeatherAPP
//
//  Created by AceDarkKronik on 9/8/21.
//
import SDWebImageSwiftUI
import SwiftUI

//struct ContentView: View {
//    @StateObject private var forecastListVM = ForecastListViewModel()
//    var body: some View {
//        ZStack {
//            NavigationView {
//                VStack {
//                    Picker(selection: $forecastListVM.system, label: Text("System") ) {
//                        Text("°C").tag(0)
//                        Text("°F").tag(1)
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .frame(width:100)
//                    .padding(.vertical)
//
//                    HStack {
//                        TextField("Enter Location",text:$forecastListVM.location,onCommit:{
//                            forecastListVM.getWeatherForecast()
//                            })
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .overlay(
//                                Button(action: {
//                                    forecastListVM.location = ""
//                                    forecastListVM.getWeatherForecast()
//                                }){
//                                    Image (systemName: "xmark.circle")
//                                        .foregroundColor(.gray)
//                                }
//                                .padding(.horizontal),
//                                alignment: .trailing
//                            )
//
//                        Button{
//                            forecastListVM.getWeatherForecast()
//                        }label:{
//                            Image(systemName: "magnifyingglass.circle.fill")
//                                .font(.title3)
//                        }
//                    }
//                        List(forecastListVM.forecasts, id:\.id){
//                            day in
//                            VStack (alignment:.leading){
//                                Text(day.day)
//                                    .fontWeight(.bold)
//                                HStack(alignment:.top){
//                                    WebImage(url: day.weatherIconURL)
//                                        .resizable()
//                                        .placeholder{
//                                            Image(systemName: "hourglass")
//                                        }
//                                        .scaledToFit()
//                                        .frame(width:75)
//                                    VStack(alignment:.leading){
//                                        Text(day.overView)
//                                            .font(.title2 )
//                                        Text(day.nameLoc)
//                                        Text(day.current)
//                                        HStack {
//                                            Text(day.high)
//                                            Text(day.low)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal)
//                .navigationTitle("Weather")
//                .alert(item: $forecastListVM.appError){ appAlert in
//                    Alert(title: Text("Error"),
//                          message: Text("""
//                            \(appAlert.errorString)
//                            please try again later!
//                            """
//                          )
//                    )
//
//                }
//            }
//            if forecastListVM.isLoading{
//                ZStack {
//                    Color(.white)
//                        .opacity(0.3)
//                        .ignoresSafeArea()
//
//                    ProgressView("Fetching the Weather")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius:10)
//                                .fill(Color(.systemBackground))
//                        )
//                        .shadow(radius:10)
//                }
//            }
//        }
//    }
//}
////    func getWeatherForecast(for location: String)  {
////        let apiService = APIService.shared
////        apiService.getJSON(urlString: "https://community-open-weather-map.p.rapidapi.com/find?q=\(location)") { (result: Result<Forecast,APIService.APIError>) in
////            switch result{
////            case.success(let forecast):
////                self.forecast = forecast
//////                for day in forecast.list{
//////                    print(dateFormatter.string(from: day.dt) )
//////                    print("Location:",day.name)
//////                    print("Country:",day.sys.country)
//////                    print("Icon :",day.weather[0].weatherIconURL)
//////
//////                }
////            case.failure(let apiError):
////                switch apiError{
////                case.error(let errorString):
////                    print(errorString)
////                }
////            }
////        }
////    }
//

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//            ContentView()
//        }
//    }
//}

struct ContentView: View {
    @StateObject  var forecastListVM = ForecastListViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Picker(selection: $forecastListVM.system, label: Text("System")) {
                        Text("°C").tag(0)
                        Text("°F").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                    .padding(.vertical)
                    HStack {
                        TextField("Enter Location", text: $forecastListVM.location,
                                  onCommit: {
                                    forecastListVM.getWeatherForecast()
                                  })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay (
                                Button(action: {
                                    forecastListVM.location = ""
                                    forecastListVM.getWeatherForecast()
                                }) {
                                    Image(systemName: "xmark.circle")
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal),
                                alignment: .trailing
                            )
                        Button {
                            forecastListVM.getWeatherForecast()
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.title3)
                        }
                    }
                    List(forecastListVM.forecasts, id:\.id){
                        day in
                        VStack (alignment:.leading){
                            Text(day.day)
                                .fontWeight(.bold)
                            HStack(alignment:.top){
                                WebImage(url: day.weatherIconURL)
                                    .resizable()
                                    .placeholder{
                                        Image(systemName: "hourglass")
                                    }
                                    .scaledToFit()
                                    .frame(width:75)
                                VStack(alignment:.leading){
                                    Text(day.nameLoc)
                                    Text(day.overView)
                                    Text(day.current)
                                    HStack {
                                        Text(day.high)
                                        Text(day.low)
                                }
                            }
                        }
                    }
                }
                        .listStyle(PlainListStyle())
                }
                .padding(.horizontal)
                .navigationTitle("Region Weather Info ")
                .alert(item: $forecastListVM.appError) { appAlert in
                    Alert(title: Text("Error"),
                          message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """
                            )
                    
                    )
                }
            }
            if forecastListVM.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Fetching Weather")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


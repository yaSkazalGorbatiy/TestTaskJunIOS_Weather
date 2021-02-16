//
//  GetCitiesWeather.swift
//  WeatherJun
//
//  Created by Сергей Горбачёв on 21.10.2020.
//  Copyright © 2020 Сергей Горбачёв. All rights reserved.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }

            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}

func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
       CLGeocoder().geocodeAddressString(city) { placemark, error in
           completion(placemark?.first?.location?.coordinate, error)
       }
       
   }

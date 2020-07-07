
import Foundation

class GlobalObject: Decodable{
    
    var lat: Double?
    var lon: Double?
    var timezone: String?
    var current: CurrentWeather?
    var hourly: [HourlyWeather]?
    var daily: [DailyWeather]?
    
    
}

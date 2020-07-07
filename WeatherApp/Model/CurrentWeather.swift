
import Foundation

class CurrentWeather: Decodable {
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Double?
    var feels_like: Double?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Double?
    var uvi: Double?
    var visibility: Double?
    var clouds: Int?
    var wind_speed: Int?
    var wind_deg: Int?
    var wind_gust: Int?
    var weather: [Weather]?
}

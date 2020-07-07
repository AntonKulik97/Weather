import Foundation

class HourlyWeather: Decodable{
    var dt: Int?
    var temp: Double?
    var feels_like: Double?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Double?
    var clouds: Int?
    var wind_speed: Double?
    var wind_deg: Int?
    var weather: [Weather]?
}

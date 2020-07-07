import UIKit

class DaysWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxWeatheOfTheDayLabel: UILabel!
    @IBOutlet weak var minWeatheOfTheDayLabel: UILabel!
    
    
    func configureCell(dailyWeather: DailyWeather?){
        let date = Date(timeIntervalSince1970: Double(dailyWeather?.dt ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "E, d MMM"
        let strDate = dateFormatter.string(from: date)
        
        self.dateLabel.text = strDate
        guard let maxTemp = dailyWeather?.temp?.max else {return}
        self.maxWeatheOfTheDayLabel.text = String(Int(maxTemp)) + "°"
        guard let minTemp = dailyWeather?.temp?.min else {return}
              self.minWeatheOfTheDayLabel.text = String(Int(minTemp)) + "°"
        guard let weatherIcon = dailyWeather?.weather?.first?.icon else {return}
        self.weatherImage.image = UIImage(named: weatherIcon)
        
        
    }

}

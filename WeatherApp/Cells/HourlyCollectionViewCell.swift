import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeHourlyLabel: UILabel!
    @IBOutlet weak var hourlyImageView: UIImageView!
    @IBOutlet weak var weatherHourlyLabel: UILabel!
    
    
    func customizeCVCell(hourlyWeather: HourlyWeather?) {
        
        let date = Date(timeIntervalSince1970: Double(hourlyWeather?.dt ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH"
        let strDate = dateFormatter.string(from: date)
        
        self.timeHourlyLabel.text = strDate
        guard let temp = hourlyWeather?.temp else {return}
        self.weatherHourlyLabel.text = String(Int(temp)) + "°"
        guard let img = hourlyWeather?.weather?.first?.icon else {return}
        self.hourlyImageView.image = UIImage(named: img)
        
    }
}

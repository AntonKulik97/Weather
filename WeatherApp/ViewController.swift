import UIKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var maxDayTemperatureLabel: UILabel!
    @IBOutlet weak var minDayTemperatureLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var dateTableViewLabel: UILabel!
//    var lat: Double = 0
//    var long: Double = 0
    var locationManager = CLLocationManager()
    var weatherObject: GlobalObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        NetworkManager.shared.lat = lat
//        NetworkManager.shared.long = long
        
        NetworkManager.shared.getWeather {[weak self] (globalObject, error) in
            guard let currentTemp = globalObject?.current?.temp else {return}
            self?.currentWeatherLabel.text = String(Int(currentTemp)) + "°"
            guard let currentMinTemp = globalObject?.daily?.first?.temp?.min else{return}
            self?.minDayTemperatureLabel.text = String(Int(currentMinTemp)) + "°"
            guard let currentMaxTemp = globalObject?.daily?.first?.temp?.max else{return}
            self?.maxDayTemperatureLabel.text = String(Int(currentMaxTemp)) + "°"
            self?.timeZoneLabel.text = globalObject?.timezone
            self?.weatherObject = globalObject
            self?.tableView.reloadData()
            
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        guard let secondController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.navigationController?.pushViewController(secondController, animated: true)
        
    }
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let coordinates = location.coordinate
//        self.lat = coordinates.latitude
//        self.long = coordinates.longitude
//    }
//
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherObject?.daily?.count ?? 0 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.row == 0, let firstCell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell{
            
            firstCell.settingCV(weather: weatherObject?.hourly)
            cell = firstCell
            
        }else if let mainCell = tableView.dequeueReusableCell(withIdentifier: "DaysWeatherTableViewCell", for: indexPath) as? DaysWeatherTableViewCell{
            mainCell.configureCell(dailyWeather: weatherObject?.daily?[indexPath.row])
            cell = mainCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else {
            return 55
        }
        
    }
    
}


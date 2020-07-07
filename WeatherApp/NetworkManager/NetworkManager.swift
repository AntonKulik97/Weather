
import Foundation


class NetworkManager{
    
    var lat: Double = 55.74
    var long: Double = 37.61
    static let shared = NetworkManager()
    private init() {}
    
    func getWeather(complition: @escaping (GlobalObject?,Error?)->Void) {
        
        let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
//        guard let latitude = self.lat else {return}
//        guard let longitude = self.long else {return}
        let latitude = String(lat)
        let longitude = String(long)
        let units = "metric"
        let exclude = ""
        let appid = "a86006659f3754245c05fb73e263635d"
        let urlString = baseURL + "?lat=" + latitude + "&lon=" + longitude + "&units=" + units + "&exclude=" + exclude + "&appid=" + appid + "&lang=ru"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard error == nil, let data = data else{return}
                
                do{
                    let weatherObject = try JSONDecoder().decode(GlobalObject.self, from: data)
                    complition(weatherObject,nil)
               
                    
                }catch let jsonError{
                    print("Failed to decode json",jsonError)
                    complition(nil,jsonError)
                    
                }
            }
        }
        
        
        task.resume()
        
    }
    
}

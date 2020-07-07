import UIKit

class CollectionTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var hourlyWeather: [HourlyWeather]?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func settingCV(weather: [HourlyWeather]?) {
        
        self.hourlyWeather = weather
        self.collectionView.reloadData()
    }
}



extension CollectionTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = hourlyWeather?.count else {return 0}
        return count - 23
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as? HourlyCollectionViewCell else {return UICollectionViewCell()}
        
        cell.customizeCVCell(hourlyWeather: hourlyWeather?[indexPath.item])
        
        return cell
    }
    
    
    
    
    
}

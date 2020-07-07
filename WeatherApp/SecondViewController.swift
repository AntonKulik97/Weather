import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
  

}

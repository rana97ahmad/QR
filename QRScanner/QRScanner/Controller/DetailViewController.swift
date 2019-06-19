import UIKit

class DetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var qrData: QRData?
    var combineDate: String?
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func openInWebAction(_ sender: Any) {
        if let url = URL(string: qrData?.codeString ?? ""), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        } else {
            showToast(message : "Not a valid URL")
        }
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell", for: indexPath) as! dataTableViewCell
        
      //  let arrivename = UserDefaults.standard.value(forKey: "name") ?? ""
     //   let arrivedate =  UserDefaults.standard.value(forKey: "date") ?? ""

        cell.data1.text = qrData?.codeString
        cell.data2.text = combineDate


        return cell
    }

    
    
}

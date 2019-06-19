import UIKit

class QRScannerViewController: UIViewController {
    
    
    
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    @IBOutlet weak var scanButton: UIButton! {
        didSet {
            scanButton.setTitle("STOP", for: .normal)
        }
    }
    
    var qrData: QRData? = nil
    var combineDate: String? = nil {
        didSet {
        if qrData != nil && combineDate != nil{
               //data stored in the code
                self.performSegue(withIdentifier: "detailSeuge", sender: self)
            }
        }
    }
    
    
//    var combineDate: String? = nil {
//        didSet {
//            if combineDate != nil {
//                //time it took the data
//                self.performSegue(withIdentifier: "detailSeuge", sender: self) // makes segue twice
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        sender.setTitle(buttonTitle, for: .normal)
    }
}


extension QRScannerViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        scanButton.setTitle(buttonTitle, for: .normal)
    }
    
    func qrScanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.qrData = QRData(codeString: str)
        
        
        let scanDate =  Date()
        
        let calender = Calendar.current
        
        let hour = calender.component(.hour, from: scanDate)
        let mins = calender.component(.minute, from: scanDate)
        let secs = calender.component(.second, from: scanDate)
        let day = calender.component(.day, from: scanDate)
        let month = calender.component(.month, from: scanDate)
        let year = calender.component(.year, from: scanDate)
        
         self.combineDate = "\(year)-\(month)-\(day)  \(hour):\(mins):\(secs)"
        
  //  UserDefaults.standard.set(qrData, forKey: "name")
   // UserDefaults.standard.set(combineDate, forKey: "name")
    
    }
    
  
    
    
}


extension QRScannerViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "detailSeuge", let viewController = segue.destination as? DetailViewController {
           
        viewController.qrData = self.qrData
        viewController.combineDate = self.combineDate

        }
    }
}


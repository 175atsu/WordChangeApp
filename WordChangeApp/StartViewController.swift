import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var log: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var timer:Timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 3.0,
                                                       target: self,
                                                       selector:  #selector(changeView),
                                                       userInfo: nil,
                                                       repeats: false)
    }
    @objc func changeView() {
        self.performSegue(withIdentifier: "toGreen", sender: nil)
    }
}

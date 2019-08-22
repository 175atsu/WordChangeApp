import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beforeText: UITextView!

    @IBOutlet weak var afterTextt: UILabel!

    let rubi = RubiModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        beforeText.text = ""
        view.backgroundColor = UIColor.red

    }

    @IBAction func changeButton(_ sender: Any) {
        //var berore: String? = beforeText.text
        if let before = beforeText.text {

            rubi.change(word: before) { (result: String) -> Void in
                self.afterTextt.text = result
            }
//            afterTextt.text = rubi.change(word: before)
            print(afterTextt.text)
        }
    }

}


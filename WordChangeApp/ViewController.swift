import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beforeText: UITextView!

    @IBOutlet weak var afterTextt: UILabel!

    @IBOutlet weak var textView: UITextView!

    let rubi = RubiModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //beforeText.text = ""
        view.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 100/100)
    }
    
    @IBAction func changeButton(_ sender: Any) {
        if let before = beforeText.text {

            rubi.change(word: before) { (result: String) -> Void in
                self.afterTextt.text = result
            }
            print(afterTextt.text)
        }
    }

    //入力画面ないしkeyboardの外を押したら、キーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.textView.isFirstResponder) {
            self.textView.resignFirstResponder()
        }
    }

}


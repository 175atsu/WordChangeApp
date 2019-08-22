//
//  ViewController.swift
//  WordChangeApp
//
//  Created by 飯野敦博 on 2019/08/17.
//  Copyright © 2019 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beforeText: UITextView!

    @IBOutlet weak var afterTextt: UILabel!

    let rubi = RubiModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButton(_ sender: Any) {
        //var berore: String? = beforeText.text
        if let before = beforeText.text {

            rubi.api(word: before) { (result: String) -> Void in
                self.afterTextt.text = result
            }
//            afterTextt.text = rubi.change(word: before)
            print(afterTextt.text)
        }
    }

}


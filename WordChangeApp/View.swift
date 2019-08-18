//
//  View.swift
//  WordChangeApp
//
//  Created by 飯野敦博 on 2019/08/17.
//  Copyright © 2019 mycompany. All rights reserved.
//

import UIKit

class View: UIViewController {

    @IBOutlet weak var beforeText: UITextView!

    @IBOutlet weak var afterTextt: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeButton(_ sender: Any) {
        var berore = beforeText.text
    }

}

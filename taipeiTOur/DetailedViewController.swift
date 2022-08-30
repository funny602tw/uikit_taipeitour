//
//  ViewController.swift
//  taipeiTOur
//
//  Created by apple on 2022/8/23.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pointLabel.text = name
    }
}


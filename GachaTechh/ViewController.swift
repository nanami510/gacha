//
//  ViewController.swift
//  GachaTechh
//
//  Created by 後藤奈々美 on 2017/03/29.
//  Copyright © 2017年 後藤奈々美. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gacha(){
        self.performSegue(withIdentifier: "result", sender: nil)
    }


}


//
//  Test1ViewController.swift
//  pcgtest1
//
//  Created by pcg on 2020/2/5.
//  Copyright © 2020 pcg. All rights reserved.
//

import UIKit

class Test1ViewController: UIViewController {

    @IBAction func OnButtonTouchUp(_ sender: UIButton) {
        self.dismiss(animated: true, completion: (()->Void)? {
            return;
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

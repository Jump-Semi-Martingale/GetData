//
//  InputViewController.swift
//  memo_test
//
//  Created by Fujiwara on 2016/06/19.
//  Copyright © 2016年 橋本欣典. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    
    
    
    
    
    @IBOutlet weak var TextView5: UITextView!

    var vc2Text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if vc2Text != nil {
            // ViewControllerからのメッセージを表示する
            TextView5.text = vc2Text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

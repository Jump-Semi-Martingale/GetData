//
//  ViewController.swift
//  memo_test
//
//  Created by 橋本欣典 on 2016/04/14.
//  Revised by D.Mita on 2016/07/09
//  Copyright © 2016年 橋本欣典. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var toVC2Text = "from VC1"
    var toVC2Array :NSArray = []
    
    
    
    @IBOutlet weak var TextView1: UITextView!
    
    
    @IBOutlet weak var TextView2: UITextView!
    
    
    @IBOutlet weak var TextView3: UITextView!
    
    
    
    @IBOutlet weak var TextView4: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapSaveBtn(sender: UIButton) {
        print("tapSavebtn")

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToInputViewController") {
            let vc2: InputViewController = (segue.destinationViewController as? InputViewController)!
            // ViewControllerのvc2Textにメッセージを設定
            
            print("Segue_in")
            let memo = Memo()
            memo.seccode = TextView1.text
            memo.fromdate = TextView2.text
            memo.todate = TextView4.text
            
            vc2.vc2Text = toVC2Text
            toVC2Array = StockMemos.postMemo(memo)
            vc2.vc2Array = toVC2Array
            
            
        }
    }
    

    
        
    
}


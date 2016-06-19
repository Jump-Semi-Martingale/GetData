//
//  StockMemos.swift
//  memo_test
//
//  Created by 橋本欣典 on 2016/04/16.
//  Copyright © 2016年 橋本欣典. All rights reserved.
//

import UIKit
import Alamofire

var ans1:String? = "D"
var keepAlive = true

class StockMemos: NSObject {
    
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postMemo(memo: Memo) -> String {
    
    
        //var ans1:String = ""
        
        var params: [String: AnyObject] = [
            "sec_code": memo.seccode,
            "from_date": memo.fromdate,
            "to_date": memo.todate
        ]
        
        // HTTP通信
        Alamofire.request(.POST, "http://54.199.174.85:3000/api/swiftdisplays", parameters: params, encoding: .URL).responseJSON { response in
            
        //Alamofire.request(.POST, "http://54.199.174.85:3000/api/memos", parameters: params, encoding: .URL).responseJSON { response in
        
        //Alamofire.request(.POST, "http://localhost:3000/api/memos", parameters: params, encoding: .URL).responseJSON { response in
            
            print("=============response============")
            print(response)
            
            
            
            //let JSON = response.result.value
                        
            
            //ans1 = JSON!["temp"] as! String
        
            
            print(ans1)
            
            keepAlive = false
            
            
            
        }
        
        let runLoop = NSRunLoop.currentRunLoop()
        while keepAlive &&
            runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 1.0)) {
               //  0.1秒毎の処理なので、処理が止まらない
        }

       return ans1!
        
    }
}
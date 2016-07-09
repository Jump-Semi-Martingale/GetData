//
//  StockMemos.swift
//  memo_test
//
//  Created by 橋本欣典 on 2016/04/16.
//  Copyright © 2016年 橋本欣典. All rights reserved.
//

import UIKit
import Alamofire

var ans1:NSArray?
var keepAlive = true

class StockMemos: NSObject {
    
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    //class func postMemo(memo: Memo) -> String {
    class func postMemo(memo: Memo) -> NSArray {
    
    
        var ans2:[Double] = []
        var ans3:[String] = []
        
        print("temp")
        
        var params: [String: AnyObject] = [
            "sec_code": memo.seccode,
            "from_date": memo.fromdate,
            "to_date": memo.todate
        ]
        
        let semaphore = dispatch_semaphore_create(0)
        
        // HTTP通信
        Alamofire.request(.POST, "http://54.199.174.85:3000/api/swiftdisplays", parameters: params, encoding: .URL).responseJSON { response in
            
        //Alamofire.request(.POST, "http://54.199.174.85:3000/api/memos", parameters: params, encoding: .URL).responseJSON { response in
        
        //Alamofire.request(.POST, "http://localhost:3000/api/memos", parameters: params, encoding: .URL).responseJSON { response in
            
            print("=============response============")
            //print(response)
            
            
            
            var JSON = response.result.value as! NSArray //JSON全体はDictionaryではなくArray型
            var JSONnum = JSON.count //array型なのでcountで要素数取得可能
            
            //let ans1=JSON[JSONnum-1] as! NSDictionary //JSONの各要素はDictionary型
            //print(ans1["end_price"])
            //print(ans1["t_date"])
            
            
            for i in 1 ... JSONnum {
                var ans1=JSON[i-1] as! NSDictionary //JSONの各要素はDictionary型
                
                var ans2temp:String = String(ans1["end_price"]!)
                ans2 += [Double(ans2temp)!]
                ans3 += [String(ans1["t_date"]!)]
                //print([ans2, ans3])

            }
            
            //keepAlive = false
            
            dispatch_semaphore_signal(semaphore)
            
        }
        
        
        //Wait for the request to complete
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        
        //let runLoop = NSRunLoop.currentRunLoop()
        //while keepAlive &&
        //    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 1.0)) {
               //  0.1秒毎の処理なので、処理が止まらない
        //}

       return [ans2, ans3]
        
    }
}
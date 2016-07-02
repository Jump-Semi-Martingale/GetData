//
//  InputViewController.swift
//  memo_test
//
//  Created by Fujiwara on 2016/06/19.
//  Copyright © 2016年 橋本欣典. All rights reserved.
//

import UIKit
import Charts

class InputViewController: UIViewController {

    
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    
    @IBOutlet weak var TextView5: UITextView!

    var vc2Text:String?
    
    var vc2Array:NSArray = []
    
    var months: [String]!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if vc2Text != nil {
            // ViewControllerからのメッセージを表示する
            TextView5.text = String(vc2Array)
        }
        
        
        
        let date: [String]! = vc2Array[1] as! [String]
        
        
        
        //months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        months = date
        //let unitsSold = [50.3, 68.3, 113.3, 115.7, 160.8, 214.0, 220.4, 132.1, 176.2, 120.9, 71.3, 48.0]
        let unitsSold = [50.3, 68.3, 113.3, 115.7]
        
        lineChartView.animate(yAxisDuration: 2.0)
        lineChartView.descriptionText = "京都府の月毎の降水量グラフ"
        
        setChart(months, values: unitsSold)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        lineChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "降水量")
        let chartData = LineChartData(xVals: months, dataSet: chartDataSet)
        lineChartView.data = chartData
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

//
//  recordViewController.swift
//  AccountBook
//
//  Created by 陈华纲 on 2020/12/15.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import UIKit

class recordViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{

    

    @IBOutlet weak var costTotalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recordTableView: UITableView!
    @IBOutlet weak var incomeTotalLabel: UILabel!
    
    //主界面添加账单按钮
    @IBOutlet weak var addRecordButton: UIButton!
    
    
    var recordList : [recordInfo] = []
    var totalCost:Float = 0.00
    var totalIncome:Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTableView.delegate = self
        recordTableView.dataSource = self
        // Do any additional setup after loading the view.
        //loadRecords()
        initArray()
        //ABFormatter.dateFormatter.dateFormat = "MM-dd"
        dateLabel.text = ABFormatter.dateFormatter.string(from: Date())
        refreshTotalLabel()
        //设置按钮圆角
        addRecordButton.layer.cornerRadius = 32;
        
    }
    
    func saveRecords() {
        let success =
            NSKeyedArchiver.archiveRootObject(recordList, toFile: recordInfo.userPath)
        if !success {
            print("failed..")
        }
    }
    func loadRecords() {
        if let records =
            NSKeyedUnarchiver.unarchiveObject(withFile: recordInfo.userPath) as? [recordInfo]
        {
            recordList = records
            print("load file successful")
        }
        else
        {
            //initArray()
        }
    }
    
    func refreshTotalLabel() {
        var totalCost:Float = 0.00
        var totalIncome:Float = 0.00
        for record in recordList{
            if Float(record.cost!) > 0 {
                totalCost += record.cost!
            } else{
                totalIncome += -record.cost!
            }
        }
        costTotalLabel.text = String(totalCost)
        incomeTotalLabel.text = String(totalIncome)
    }
    
    func initArray() -> Void {
        
        loadRecords()
        //recordList.append(recordInfo(itemName: "饮食", cost: "-23.5", date: "2020/12/13 12:00", place: "二饭三麻辣香锅"))
        //recordList.append(recordInfo(itemName: "红包", cost: "+110.7", date: "2020/12/14 13:58", place: "支付宝现金红包"))
        return
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recordList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! recordTableViewCell
        // Configure the cell...
        cell.itemLabel?.text = recordList[indexPath.row].itemName
        cell.placeLabel?.text = recordList[indexPath.row].place
        cell.timeLabel?.text = ABFormatter.dateFormatter.string(from: recordList[indexPath.row].date!)
        cell.costLabel?.text = recordList[indexPath.row].cost?.description

        
        return cell
    }
    
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        recordList.remove(at: indexPath.row)
        saveRecords()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    

    
    
    @IBAction func saveToList(segue:UIStoryboardSegue)
    {
        if let sourceVC = segue.source as? detailViewController, let record = sourceVC.record{
            if let selectedIndex =
                recordTableView.indexPathForSelectedRow{
                recordList[selectedIndex.row] = record
                recordTableView.reloadRows(at: [selectedIndex], with: UITableView.RowAnimation.automatic)
            }else{
                recordList.append(record)
                recordTableView.reloadData()
            }
        }
        saveRecords()
        refreshTotalLabel()
    }
    
    @IBAction func cancelToList(segue:UIStoryboardSegue)
    {
        recordTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destVC = segue.destination as? detailViewController{
            if let selectedIndex = recordTableView.indexPathForSelectedRow{
                destVC.record = recordList[selectedIndex.row]
                print(recordList[selectedIndex.row].itemName)
            }
        }
    }


}

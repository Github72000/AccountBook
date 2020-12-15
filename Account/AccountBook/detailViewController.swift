//
//  detailViewController.swift
//  AccountBook
//
//  Created by 陈华纲 on 2020/12/14.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var placeField: UITextField!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    var record:recordInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let _recordList = self.record{
            typeField.text = record?.item
            placeField.text = record?.place
            accountField.text = record?.cost
                dateField.text = record?.date
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //segue.source.add
        
        if segue.identifier == "save"{
            record = recordInfo (
                item: typeField.text!,
                cost: accountField.text!,
                date: dateField.text!,
                place: placeField.text!
            )
            //avatar: avatar.image)
        }
        
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

//
//  AddPageViewController.swift
//  AccountBook
//
//  Created by FengCL on 2020/12/24.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import UIKit

class AddPageViewController: UIViewController,UICollectionViewDelegate{

    //Outlets of this view
    
    @IBOutlet weak var BtnOutCome: UIButton!
    
    @IBOutlet weak var BtnInCome: UIButton!
    
    @IBOutlet weak var TF_note: UITextField!
    @IBOutlet weak var Label_Money: UILabel!
    
    @IBOutlet var tagsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagsCollectionView.delegate=self;
        // Do any additional setup after loading the view.
        NSLog("add page did load")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btn1Pressed(_ sender: Any) {
    }
    
    
}

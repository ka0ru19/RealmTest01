//
//  EditViewController.swift
//  realmTest01
//
//  Created by Wataru Inoue on 2017/08/24.
//  Copyright © 2017年 Wataru Inoue. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var objectIndex: Int! // 前のtableviewで選ばれたcellのindexPath.row(realmにある配列の添字)
    var object: TextData = TextData()
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // realmからindexのデータを取得する
        // 配列としてtextDataArrayに代入する
        let realmTextDataArray = Array(realm.objects(TextData.self))
        print("realmTextDataArray -> \(realmTextDataArray)")
        
        object = realmTextDataArray[objectIndex]
        
        textField.placeholder = object.text


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
        
        // もとのテキストはplaceholderにセットしておく
        textField.placeholder = object.text


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped() {
        print("保存ボタンが押されました")
        guard let inputText = textField.text else {
            // もしテキストが未入力だったらreturnして関数を抜ける
            print("保存失敗: テキスト未入力のため")
            return
        }
        
        if inputText.characters.count == 0 {
            // もしテキストが""の場合にも関数を抜ける. 条件式は inputText == "" でも可、同じ意味。
            print("保存失敗: テキストに有効な文字がないため")
            return
        }
        
        let newTextData = TextData()
        newTextData.text = inputText
        newTextData.date = object.date // dateは古いdeteを引き継ぐ
        
        try! realm.write {
            realm.delete(object) // 古いTextDataを削除
            realm.add(newTextData) // 新しいデータを代入
            // プライマリキーを設定しておけば1行でupdateができるがプライマリキーの設定に何行も要するので今回は簡単に書くために、削除して追加する方法を採用した
        }
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

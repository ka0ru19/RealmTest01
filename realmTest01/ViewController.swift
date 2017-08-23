//
//  ViewController.swift
//  realmTest01
//
//  Created by Wataru Inoue on 2017/08/23.
//  Copyright © 2017年 Wataru Inoue. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let originTextArray = ["あ", "い", "うえ"]
    var textDataArray: [TextData] = []
    
    // Realmのインスタンスを取得
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initRealmData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // realmからデータを取得する
        
        // Realmに保存されてるDog型のオブジェクトを全て取得する(result型)
        let realmTextDataResults = realm.objects(TextData.self)
        print("realmTextDataResults -> \(realmTextDataResults)")
        
        // 配列としてtextDataArrayに代入するversion
        let realmTextDataArray = Array(realm.objects(TextData.self))
        print("realmTextDataArray -> \(realmTextDataArray)")
        
        // ためしに名前を表示
        for realmTextData in realmTextDataArray {
            print("name: \(realmTextData.text), date: \(realmTextData.date)")
        }
        
        textDataArray = realmTextDataArray as [TextData]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 「+」ボタンでAddVCに画面遷移
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddVC" {
            print("AddVCに遷移します")
        }
    }
    
    // realmデータベースを初期化(テストアプリのため、この関数で擬似的に既にデータベースがあるような状況を作る)
    func initRealmData() {
        // 今までのデータを全削除
        try! realm.write {
            realm.deleteAll()
        }
        
        // originArrayのString配列をrealmにセット
        for originText in originTextArray {
            let td = TextData()
            td.text = originText
            try! realm.write {
                realm.add(td)
            }
        }
        
        
    }

}

// ViewControllerを拡張(tableViewに関するコードをまとめるため)
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = textDataArray[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let num = indexPath.row
        print("indexPath.row: \(num), text: \(textDataArray[num].text) が選択されました")
    }
}

//
//  ViewController.swift
//  realmTest01
//
//  Created by Wataru Inoue on 2017/08/23.
//  Copyright © 2017年 Wataru Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var textArray: [String] = ["あ", "い", "うえ"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initRealmData()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        
    }

}

// ViewControllerを拡張(tableViewに関するコードをまとめるため)
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = textArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let num = indexPath.row
        print("indexPath.row: \(num), text: \(textArray[num]) が選択されました")
    }
}

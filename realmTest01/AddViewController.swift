//
//  AddViewController.swift
//  realmTest01
//
//  Created by Wataru Inoue on 2017/08/23.
//  Copyright © 2017年 Wataru Inoue. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped() {
        print("保存ボタンが押されました")
        guard let text = textField.text else {
            // もしテキストが未入力だったらreturnして関数を抜ける
            print("保存失敗: テキスト未入力のため")
            return
        }
        
        if text.characters.count == 0 {
            // もしテキストが""の場合にも関数を抜ける. 条件式は text == "" でも可、同じ意味。
            print("保存失敗: テキストに有効な文字がないため")
            return
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

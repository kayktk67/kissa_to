//
//  ViewController.swift
//  test
//
//  Created by Kei Kawamura on 2018/09/03.
//  Copyright © 2018年 Kei Kawamura. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    let number = ["101","102","103","104","105","106","107","108","109","110"]
    var tablenumber : String?
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = "Table" + number[indexPath.row]
        //席ステータス表示
        var status1 : String?
        var intstatus1 : Int?
        let defaultPlace = DBRef.child("table/status").child(number[indexPath.row])
        defaultPlace.observe(.value) { (snap: DataSnapshot) in status1 = (snap.value! as AnyObject).description
        intstatus1 = Int(status1!)
            if intstatus1! == 0{
                cell.contentView.backgroundColor = UIColor.clear
            }else if intstatus1! == 1{
                cell.contentView.backgroundColor = UIColor.yellow
            }else if intstatus1! == 2{
                cell.contentView.backgroundColor = UIColor.magenta
            }else if intstatus1! == 3{
                cell.contentView.backgroundColor = UIColor.cyan
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablenumber = number[indexPath.row]
        //設定
        //self.DBRef.child("table/order").child(self.number[indexPath.row]).setValue(["b1amount":0,"b2amount":0,"b3amount":0,"b4amount":0,"s1amount":0,"s2amount":0,"s3amount":0,"d1amount":0,"d2amount":0,"d3amount":0,"d4amount":0,"dx1amount":0,"dx2amount":0,"dx3amount":0,"dx4amount":0,"de1amount":0,"de2amount":0,"de3amount":0,"c1amount":0,"c3amount":0,"c10amount":0,"time":0])
        //self.DBRef.child("table/allorder").setValue(["allb1amount":0,"allb2amount":0,"alls1amount":0,"alls2amount":0,"alls3amount":0,"alld1amount":0,"alld2amount":0,"alld3amount":0,"alld4amount":0,"alldx1amount":0,"alldx2amount":0,"alldx3amount":0,"alldx4amount":0,"allde1amount":0,"allde2amount":0,"allde3amount":0])
        //self.DBRef.child("table/dxstatus").child(self.number[indexPath.row]).setValue(0)
        //self.DBRef.child("table/setamount").child(self.number[indexPath.row]).setValue(["sset":0])
        performSegue(withIdentifier:"tonextview", sender: nil)
        tableView.deselectRow(at: indexPath, animated:true)
    }
    
    //次のビューに渡す値を設定
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SubViewController
        let _ = nextVC.view
        nextVC.tableNumberLabel.text = "Table\(tablenumber!)"
        nextVC.tableNumber = "\(tablenumber!)"
        nextVC.SumMoneyAmount.text = "0"
        nextVC.GetMoneyAmount.text = "0"
        nextVC.BackMoneyAmount.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //インスタンスを作成
        DBRef = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

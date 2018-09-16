//
//  SubViewController.swift
//  test
//
//  Created by Kei Kawamura on 2018/09/03.
//  Copyright © 2018年 Kei Kawamura. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class SubViewController: UIViewController{
    //ラベルのコネクション
    @IBOutlet weak var B1AmountLabel: UILabel!
    @IBOutlet weak var B2AmountLabel: UILabel!
    @IBOutlet weak var S1AmountLabel: UILabel!
    @IBOutlet weak var D1AmountLabel: UILabel!
    @IBOutlet weak var D2AmountLabel: UILabel!
    @IBOutlet weak var D3AmountLabel: UILabel!
    @IBOutlet weak var D4AmountLabel: UILabel!
    @IBOutlet weak var De1AmountLabel: UILabel!
    @IBOutlet weak var B1StepperValue: UIStepper!
    @IBOutlet weak var B2StepperValue: UIStepper!
    @IBOutlet weak var S1StepperValue: UIStepper!
    @IBOutlet weak var D1StepperValue: UIStepper!
    @IBOutlet weak var D2StepperValue: UIStepper!
    @IBOutlet weak var D3StepperValue: UIStepper!
    @IBOutlet weak var D4StepperValue: UIStepper!
    @IBOutlet weak var De1StepperValue: UIStepper!
    
    @IBOutlet weak var AllB1AmountLabel: UILabel!
    @IBOutlet weak var AllB2AmountLabel: UILabel!
    @IBOutlet weak var AllS1AmountLabel: UILabel!
    @IBOutlet weak var AllD1AmountLabel: UILabel!
    @IBOutlet weak var AllD2AmountLabel: UILabel!
    @IBOutlet weak var AllD3AmountLabel: UILabel!
    @IBOutlet weak var AllD4AmountLabel: UILabel!
    @IBOutlet weak var AllDe1AmountLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    
    var tableNumber : String?
    // インスタンス変数
    var DBRef1:DatabaseReference!
    var status2 : String?
    var intstatus2 : Int?
    var b1amount : String?
    var b2amount : String?
    var s1amount : String?
    var d1amount : String?
    var d2amount : String?
    var d3amount : String?
    var d4amount : String?
    var de1amount : String?
    var hoge : String?
    var allb1amount : String?
    var allb2amount : String?
    var alls1amount : String?
    var alld1amount : String?
    var alld2amount : String?
    var alld3amount : String?
    var alld4amount : String?
    var allde1amount : String?
    var newallb1amount : Int?
    var newallb2amount : Int?
    var newalls1amount : Int?
    var newalld1amount : Int?
    var newalld2amount : Int?
    var newalld3amount : Int?
    var newalld4amount : Int?
    var newallde1amount : Int?

    
    //Stepper
    @IBAction func B1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        B1AmountLabel.text = "\(Amount)"
    }
    @IBAction func B2Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        B2AmountLabel.text = "\(Amount)"
    }
    @IBAction func S1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        S1AmountLabel.text = "\(Amount)"
    }
    @IBAction func D1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D1AmountLabel.text = "\(Amount)"
    }
    @IBAction func D2Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D2AmountLabel.text = "\(Amount)"
    }
    @IBAction func D3Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D3AmountLabel.text = "\(Amount)"
    }
    @IBAction func D4Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D4AmountLabel.text = "\(Amount)"
    }
    @IBAction func De1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        De1AmountLabel.text = "\(Amount)"
    }
    
    
    //各ボタン機能
    @IBAction func add(_ sender: Any) {
        let alertController1 = UIAlertController(title: "注文",message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            
            //オーダーの入力
            self.b1amount = self.B1AmountLabel.text
            self.b2amount = self.B2AmountLabel.text
            self.s1amount = self.S1AmountLabel.text
            self.d1amount = self.D1AmountLabel.text
            self.d2amount = self.D2AmountLabel.text
            self.d3amount = self.D3AmountLabel.text
            self.d4amount = self.D4AmountLabel.text
            self.de1amount = self.De1AmountLabel.text
            self.DBRef1.child("table/order").child(self.tableNumber!).setValue(["b1amount":0,"b2amount":0,"b3amount":self.b1amount!,"b4amount":self.b2amount!,"s1amount":self.s1amount!,"d1amount":self.d1amount!,"d2amount":self.d2amount!,"d3amount":self.d3amount!,"d4amount":self.d4amount!,"de1amount":0,"de2amount":0,"de3amount":0,"time":ServerValue.timestamp()])
            
            //オーダーキーの設定
            let key = self.DBRef1.child("table/orderorder").childByAutoId().key;
            self.DBRef1.child("table/orderorder").child(key).setValue(self.tableNumber!)
            self.DBRef1.child("table/orderkey").child(self.tableNumber!).setValue(key)
            
            //全食数の更新
            let defaultPlace = self.DBRef1.child("table/allorder/allb3amount")
            defaultPlace.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allb1amount = (snapshot.value! as AnyObject).description
                self.newallb1amount = Int(self.allb1amount!)! - Int(self.b1amount!)!
                self.DBRef1.child("table/allorder/allb3amount").setValue(self.newallb1amount)
            })
            let defaultPlace1 = self.DBRef1.child("table/allorder/allb4amount")
            defaultPlace1.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allb2amount = (snapshot.value! as AnyObject).description
                self.newallb2amount = Int(self.allb2amount!)! - Int(self.b2amount!)!
                self.DBRef1.child("table/allorder/allb4amount").setValue(self.newallb2amount)
            })
            let defaultPlace2 = self.DBRef1.child("table/allorder/alls1amount")
            defaultPlace2.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls1amount = (snapshot.value! as AnyObject).description
                self.newalls1amount = Int(self.alls1amount!)! - Int(self.s1amount!)!
                self.DBRef1.child("table/allorder/alls1amount").setValue(self.newalls1amount)
            })
            let defaultPlace3 = self.DBRef1.child("table/allorder/alld1amount")
            defaultPlace3.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld1amount = (snapshot.value! as AnyObject).description
                self.newalld1amount = Int(self.alld1amount!)! - Int(self.d1amount!)!
                self.DBRef1.child("table/allorder/alld1amount").setValue(self.newalld1amount)
            })
            let defaultPlace4 = self.DBRef1.child("table/allorder/alld2amount")
            defaultPlace4.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld2amount = (snapshot.value! as AnyObject).description
                self.newalld2amount = Int(self.alld2amount!)! - Int(self.d2amount!)!
                self.DBRef1.child("table/allorder/alld2amount").setValue(self.newalld2amount)
            })
            let defaultPlace5 = self.DBRef1.child("table/allorder/alld3amount")
            defaultPlace5.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld3amount = (snapshot.value! as AnyObject).description
                self.newalld3amount = Int(self.alld3amount!)! - Int(self.d3amount!)!
                self.DBRef1.child("table/allorder/alld3amount").setValue(self.newalld3amount)
            })
            let defaultPlace6 = self.DBRef1.child("table/allorder/alld4amount")
            defaultPlace6.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld4amount = (snapshot.value! as AnyObject).description
                self.newalld4amount = Int(self.alld4amount!)! - Int(self.d4amount!)!
                self.DBRef1.child("table/allorder/alld4amount").setValue(self.newalld4amount)
            })
            let defaultPlace7 = self.DBRef1.child("table/allorder/allde1amount")
            defaultPlace7.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allde1amount = (snapshot.value! as AnyObject).description
                self.newallde1amount = Int(self.allde1amount!)! - Int(self.de1amount!)!
                self.DBRef1.child("table/allorder/allde1amount").setValue(self.newallde1amount)
            })
            
            //新規テーブルの区別
            //let defaultPlace = DBRef.child("table/status").child(tableNumber!)
            //defaultPlace.observe(.value) { (snap: DataSnapshot) in self.status2 = (snap.value! as AnyObject).description
            //self.intstatus2 = Int(self.status2!)
            //if self.intstatus2! == 0{
            self.DBRef1.child("table/status").child(self.tableNumber!).setValue(1)
            //     DBReff.DBRef1.child("data").childByAutoId().setValue(["b1t":self.b1amount,"s1t":self.s1amount,"d1t":self.d1amount,"de1t":self.de1amount])
            //    }
            //}
            
        }
        let cancelButton1 = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController1.addAction(okAction1)
        alertController1.addAction(cancelButton1)
        present(alertController1,animated: true,completion: nil)
    }
    
    @IBAction func complete(_ sender: Any) {
        let alertController2 = UIAlertController(title: "配膳完了",message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            self.DBRef1.child("table/status").child(self.tableNumber!).setValue(4)
            self.DBRef1.child("table/bsstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/ddstatus").child(self.tableNumber!).setValue(0)
            //オーダーキーのリセット
            var hogekey : String?
            let defaultPlace = self.DBRef1.child("table/orderkey").child(self.tableNumber!)
            defaultPlace.observeSingleEvent(of: .value, with: { (snapshot) in
                hogekey = (snapshot.value! as AnyObject).description
                self.DBRef1.child("table/orderorder").child(hogekey!).setValue(nil)
                self.DBRef1.child("table/orderkey").child(self.tableNumber!).setValue(nil)
            })
        }
        let cancelButton2 = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController2.addAction(okAction2)
        alertController2.addAction(cancelButton2)
        
        present(alertController2,animated: true,completion: nil)
        
    }
    
    @IBAction func dlete(_ sender: Any) {
        let alertController3 = UIAlertController(title: "削除",message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction3 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            //全食数の更新
            let defaultPlace = self.DBRef1.child("table/allorder/allb3amount")
            defaultPlace.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allb1amount = (snapshot.value! as AnyObject).description
                self.newallb1amount = Int(self.allb1amount!)! + Int(self.b1amount!)!
                self.DBRef1.child("table/allorder/allb3amount").setValue(self.newallb1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("b3amount").setValue(0)
            })
            let defaultPlace1 = self.DBRef1.child("table/allorder/allb4amount")
            defaultPlace1.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allb2amount = (snapshot.value! as AnyObject).description
                self.newallb2amount = Int(self.allb2amount!)! + Int(self.b2amount!)!
                self.DBRef1.child("table/allorder/allb4amount").setValue(self.newallb2amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("b4amount").setValue(0)
            })
            let defaultPlace2 = self.DBRef1.child("table/allorder/alls1amount")
            defaultPlace2.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls1amount = (snapshot.value! as AnyObject).description
                self.newalls1amount = Int(self.alls1amount!)! + Int(self.s1amount!)!
                self.DBRef1.child("table/allorder/alls1amount").setValue(self.newalls1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("s1amount").setValue(0)
            })
            let defaultPlace3 = self.DBRef1.child("table/allorder/alld1amount")
            defaultPlace3.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld1amount = (snapshot.value! as AnyObject).description
                self.newalld1amount = Int(self.alld1amount!)! + Int(self.d1amount!)!
                self.DBRef1.child("table/allorder/alld1amount").setValue(self.newalld1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("d1amount").setValue(0)
            })
            let defaultPlace4 = self.DBRef1.child("table/allorder/alld2amount")
            defaultPlace4.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld2amount = (snapshot.value! as AnyObject).description
                self.newalld2amount = Int(self.alld2amount!)! + Int(self.d2amount!)!
                self.DBRef1.child("table/allorder/alld2amount").setValue(self.newalld2amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("d2amount").setValue(0)
            })
            let defaultPlace5 = self.DBRef1.child("table/allorder/alld3amount")
            defaultPlace5.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld3amount = (snapshot.value! as AnyObject).description
                self.newalld3amount = Int(self.alld3amount!)! + Int(self.d3amount!)!
                self.DBRef1.child("table/allorder/alld3amount").setValue(self.newalld3amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("d3amount").setValue(0)
            })
            let defaultPlace6 = self.DBRef1.child("table/allorder/alld4amount")
            defaultPlace6.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld4amount = (snapshot.value! as AnyObject).description
                self.newalld4amount = Int(self.alld4amount!)! + Int(self.d4amount!)!
                self.DBRef1.child("table/allorder/alld4amount").setValue(self.newalld4amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("d4amount").setValue(0)
            })
            let defaultPlace7 = self.DBRef1.child("table/allorder/allde1amount")
            defaultPlace7.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allde1amount = (snapshot.value! as AnyObject).description
                self.newallde1amount = Int(self.allde1amount!)! + Int(self.de1amount!)!
                self.DBRef1.child("table/allorder/allde1amount").setValue(self.newallde1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("de1amount").setValue(0)
            })
            
            self.B1AmountLabel.text = "0"
            self.B2AmountLabel.text = "0"
            self.S1AmountLabel.text = "0"
            self.D1AmountLabel.text = "0"
            self.D2AmountLabel.text = "0"
            self.D3AmountLabel.text = "0"
            self.D4AmountLabel.text = "0"
            self.De1AmountLabel.text = "0"
            self.B1StepperValue.value = 0
            self.B2StepperValue.value = 0
            self.S1StepperValue.value = 0
            self.D1StepperValue.value = 0
            self.D2StepperValue.value = 0
            self.D3StepperValue.value = 0
            self.D4StepperValue.value = 0
            self.De1StepperValue.value = 0
            self.DBRef1.child("table/order").child(self.tableNumber!).child("time").setValue(0)
            self.DBRef1.child("table/status").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/bsstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/ddstatus").child(self.tableNumber!).setValue(0)
            //オーダーキーのリセット
            var hogekey : String?
            let defaultPlace8 = self.DBRef1.child("table/orderkey").child(self.tableNumber!)
            defaultPlace8.observeSingleEvent(of: .value, with: { (snapshot) in
                hogekey = (snapshot.value! as AnyObject).description
                self.DBRef1.child("table/orderorder").child(hogekey!).setValue(nil)
                self.DBRef1.child("table/orderkey").child(self.tableNumber!).setValue(nil)
            })
        }
        let cancelButton3 = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController3.addAction(okAction3)
        alertController3.addAction(cancelButton3)
        
        present(alertController3,animated: true,completion: nil)
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //インスタンスを作成
        DBRef1 = Database.database().reference()
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.amountload(_:)),
            userInfo: nil,
            repeats: false
        )
    }
    @objc func amountload(_ sender: Timer) {
        let defaultPlace = DBRef1.child("table/order").child(tableNumber!).child("b3amount")
        defaultPlace.observe(.value) { (snap: DataSnapshot) in self.b1amount = (snap.value! as AnyObject).description
            self.B1AmountLabel.text = self.b1amount!
            self.B1StepperValue.value = Double(Int(self.b1amount!)!)
        }
        let defaultPlace1 = DBRef1.child("table/order").child(tableNumber!).child("b4amount")
        defaultPlace1.observe(.value) { (snap: DataSnapshot) in self.b2amount = (snap.value! as AnyObject).description
            self.B2AmountLabel.text = self.b2amount!
            self.B2StepperValue.value = Double(Int(self.b2amount!)!)
        }
        let defaultPlace2 = DBRef1.child("table/order").child(tableNumber!).child("s1amount")
        defaultPlace2.observe(.value) { (snap: DataSnapshot) in self.s1amount = (snap.value! as AnyObject).description
            self.S1AmountLabel.text = self.s1amount!
            self.S1StepperValue.value = Double(Int(self.s1amount!)!)
        }
        let defaultPlace3 = DBRef1.child("table/order").child(tableNumber!).child("d1amount")
        defaultPlace3.observe(.value) { (snap: DataSnapshot) in self.d1amount = (snap.value! as AnyObject).description
            self.D1AmountLabel.text = self.d1amount!
            self.D1StepperValue.value = Double(Int(self.d1amount!)!)
        }
        let defaultPlace4 = DBRef1.child("table/order").child(tableNumber!).child("d2amount")
        defaultPlace4.observe(.value) { (snap: DataSnapshot) in self.d2amount = (snap.value! as AnyObject).description
            self.D2AmountLabel.text = self.d2amount!
            self.D2StepperValue.value = Double(Int(self.d2amount!)!)
        }
        let defaultPlace5 = DBRef1.child("table/order").child(tableNumber!).child("d3amount")
        defaultPlace5.observe(.value) { (snap: DataSnapshot) in self.d3amount = (snap.value! as AnyObject).description
            self.D3AmountLabel.text = self.d3amount!
            self.D3StepperValue.value = Double(Int(self.d3amount!)!)
        }
        let defaultPlace6 = DBRef1.child("table/order").child(tableNumber!).child("d4amount")
        defaultPlace6.observe(.value) { (snap: DataSnapshot) in self.d4amount = (snap.value! as AnyObject).description
            self.D4AmountLabel.text = self.d4amount!
            self.D4StepperValue.value = Double(Int(self.d4amount!)!)
        }
        let defaultPlace7 = DBRef1.child("table/order").child(tableNumber!).child("de1amount")
        defaultPlace7.observe(.value) { (snap: DataSnapshot) in self.de1amount = (snap.value! as AnyObject).description
            self.De1AmountLabel.text = self.de1amount!
            self.De1StepperValue.value = Double(Int(self.de1amount!)!)
        }
        
        //全食数の取得
        let defaultPlace8 = self.DBRef1.child("table/allorder/allb3amount")
        defaultPlace8.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllB1AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace9 = self.DBRef1.child("table/allorder/allb4amount")
        defaultPlace9.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllB2AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace10 = self.DBRef1.child("table/allorder/alls1amount")
        defaultPlace10.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllS1AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace11 = self.DBRef1.child("table/allorder/alld1amount")
        defaultPlace11.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllD1AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace12 = self.DBRef1.child("table/allorder/alld2amount")
        defaultPlace12.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllD2AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace13 = self.DBRef1.child("table/allorder/alld3amount")
        defaultPlace13.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllD3AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace14 = self.DBRef1.child("table/allorder/alld4amount")
        defaultPlace14.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllD4AmountLabel.text = (snapshot.value! as AnyObject).description
        })
        let defaultPlace15 = self.DBRef1.child("table/allorder/allde1amount")
        defaultPlace15.observeSingleEvent(of: .value, with: { (snapshot) in
            self.AllDe1AmountLabel.text = (snapshot.value! as AnyObject).description
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

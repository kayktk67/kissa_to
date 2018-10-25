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
    @IBOutlet weak var S2AmountLabel: UILabel!
    @IBOutlet weak var S3AmountLabel: UILabel!
    @IBOutlet weak var D1AmountLabel: UILabel!
    @IBOutlet weak var D3AmountLabel: UILabel!
    @IBOutlet weak var D4AmountLabel: UILabel!
    @IBOutlet weak var DX1AmountLabel: UILabel!
    @IBOutlet weak var DX2AmountLabel: UILabel!
    @IBOutlet weak var DX3AmountLabel: UILabel!
    @IBOutlet weak var DX4AmountLabel: UILabel!
    @IBOutlet weak var C1AmountLabel: UILabel!
    @IBOutlet weak var C3AmountLabel: UILabel!
    @IBOutlet weak var C10AmountLabel: UILabel!
    
    @IBOutlet weak var B1StepperValue: UIStepper!
    @IBOutlet weak var B2StepperValue: UIStepper!
    @IBOutlet weak var S1StepperValue: UIStepper!
    @IBOutlet weak var S2StepperValue: UIStepper!
    @IBOutlet weak var S3StepperValue: UIStepper!
    @IBOutlet weak var D1StepperValue: UIStepper!
    @IBOutlet weak var D3StepperValue: UIStepper!
    @IBOutlet weak var D4StepperValue: UIStepper!
    @IBOutlet weak var DX1StepperValue: UIStepper!
    @IBOutlet weak var DX2StepperValue: UIStepper!
    @IBOutlet weak var DX3StepperValue: UIStepper!
    @IBOutlet weak var DX4StepperValue: UIStepper!
    @IBOutlet weak var C1StepperValue: UIStepper!
    @IBOutlet weak var C3StepperValue: UIStepper!
    @IBOutlet weak var C10StepperValue: UIStepper!
    
    @IBOutlet weak var AllB1AmountLabel: UILabel!
    @IBOutlet weak var AllB2AmountLabel: UILabel!
    @IBOutlet weak var AllS1AmountLabel: UILabel!
    @IBOutlet weak var AllS2AmountLabel: UILabel!
    @IBOutlet weak var AllS3AmountLabel: UILabel!
    @IBOutlet weak var AllD1AmountLabel: UILabel!
    @IBOutlet weak var AllD3AmountLabel: UILabel!
    @IBOutlet weak var AllD4AmountLabel: UILabel!
    @IBOutlet weak var AllDX1AmountLabel: UILabel!
    @IBOutlet weak var AllDX2AmountLabel: UILabel!
    @IBOutlet weak var AllDX3AmountLabel: UILabel!
    @IBOutlet weak var AllDX4AmountLabel: UILabel!
    @IBOutlet weak var AllC1AmountLabel: UILabel!
    @IBOutlet weak var AllC3AmountLabel: UILabel!
    @IBOutlet weak var AllC10AmountLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    
    @IBOutlet weak var BStatus: UILabel!
    @IBOutlet weak var SStatus: UILabel!
    @IBOutlet weak var DStatus: UILabel!
    @IBOutlet weak var DXStatus: UILabel!
    
    @IBOutlet weak var SumMoneyAmount: UILabel!
    @IBOutlet weak var GetMoneyAmount: UILabel!
    @IBOutlet weak var BackMoneyAmount: UILabel!
    @IBOutlet weak var ProceedsAmount: UILabel!
    
    
    var tableNumber : String?
    var DBRef1:DatabaseReference!
    var status : String?
    var status2 : String?
    var intstatus2 : Int?
    var tbstatus : String?
    var sstatus : String?
    var dstatus : String?
    var dxstatus : String?
    var b1amount : String?
    var b2amount : String?
    var s1amount : String?
    var s2amount : String?
    var s3amount : String?
    var d1amount : String?
    var d3amount : String?
    var d4amount : String?
    var dx1amount : String?
    var dx2amount : String?
    var dx3amount : String?
    var dx4amount : String?
    var c1amount : String?
    var c3amount : String?
    var c10amount : String?
    
    var bamount = 0
    var samount = 0
    var damount = 0
    var ddamount = 0
    var dxamount = 0
    var bprice = 0
    var sprice = 0
    var dprice = 0
    var cprice = 0
    var hoge : String?
    var allb1amount : String?
    var allb2amount : String?
    var alls1amount : String?
    var alls2amount : String?
    var alls3amount : String?
    var alld1amount : String?
    var alld3amount : String?
    var alld4amount : String?
    var alldx1amount : String?
    var alldx2amount : String?
    var alldx3amount : String?
    var alldx4amount : String?
    var allc1amount : String?
    var allc3amount : String?
    var allc10amount : String?
    var newallb1amount : Int?
    var newallb2amount : Int?
    var newalls1amount : Int?
    var newalls2amount : Int?
    var newalls3amount : Int?
    var newalld1amount : Int?
    var newalld3amount : Int?
    var newalld4amount : Int?
    var newalldx1amount : Int?
    var newalldx2amount : Int?
    var newalldx3amount : Int?
    var newalldx4amount : Int?
    var newallc1amount : Int?
    var newallc3amount : Int?
    var newallc10amount : Int?
    var proceeds : String?
    var intproceeds : Int?

    
    //Stepper
    @IBAction func B1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        B1AmountLabel.text = "\(Amount)"
        bamount = Int(B1StepperValue.value + B2StepperValue.value)
        bprice = bamount * 100
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func B2Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        B2AmountLabel.text = "\(Amount)"
        bamount = Int(B1StepperValue.value + B2StepperValue.value)
        bprice = bamount * 100
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func S1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        S1AmountLabel.text = "\(Amount)"
        samount = Int(S1StepperValue.value + S2StepperValue.value + S3StepperValue.value)
        sprice = samount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func S2Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        S2AmountLabel.text = "\(Amount)"
        samount = Int(S1StepperValue.value + S2StepperValue.value + S3StepperValue.value)
        sprice = samount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func S3Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        S3AmountLabel.text = "\(Amount)"
        samount = Int(S1StepperValue.value + S2StepperValue.value + S3StepperValue.value)
        sprice = samount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func D1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D1AmountLabel.text = "\(Amount)"
        ddamount = Int(D1StepperValue.value) + Int(D3StepperValue.value) + Int(D4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func D3Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D3AmountLabel.text = "\(Amount)"
        ddamount = Int(D1StepperValue.value) + Int(D3StepperValue.value) + Int(D4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func D4Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        D4AmountLabel.text = "\(Amount)"
        ddamount = Int(D1StepperValue.value) + Int(D3StepperValue.value) + Int(D4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func DX1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        DX1AmountLabel.text = "\(Amount)"
        dxamount = Int(DX1StepperValue.value) + Int(DX2StepperValue.value) + Int(DX3StepperValue.value) + Int(DX4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func DX2Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        DX2AmountLabel.text = "\(Amount)"
        dxamount = Int(DX1StepperValue.value) + Int(DX2StepperValue.value) + Int(DX3StepperValue.value) + Int(DX4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func DX3Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        DX3AmountLabel.text = "\(Amount)"
        dxamount = Int(DX1StepperValue.value) + Int(DX2StepperValue.value) + Int(DX3StepperValue.value) + Int(DX4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func DX4Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        DX4AmountLabel.text = "\(Amount)"
        dxamount = Int(DX1StepperValue.value) + Int(DX2StepperValue.value) + Int(DX3StepperValue.value) + Int(DX4StepperValue.value)
        damount = ddamount + dxamount
        dprice = damount * 150
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func C1Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        C1AmountLabel.text = "\(Amount)"
        cprice = Int(C1StepperValue.value)*150 + Int(C3StepperValue.value)*400 + Int(C10StepperValue.value)*1200
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func C3Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        C3AmountLabel.text = "\(Amount)"
        cprice = Int(C1StepperValue.value)*150 + Int(C3StepperValue.value)*400 + Int(C10StepperValue.value)*1200
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    @IBAction func C10Stepper(_ sender: UIStepper) {
        let Amount = Int(sender.value)
        C10AmountLabel.text = "\(Amount)"
        cprice = Int(C1StepperValue.value)*150 + Int(C3StepperValue.value)*400 + Int(C10StepperValue.value)*1200
        SumMoneyAmount.text = "\(bprice + sprice + dprice + cprice)"
    }
    
    @IBAction func number(_ sender: UIButton) {
        if GetMoneyAmount.text == "0"{
            if sender.titleLabel!.text != "00"{
                GetMoneyAmount.text = ""
                GetMoneyAmount.text! += sender.titleLabel!.text!
            }
        }else if sender.titleLabel!.text == "00"{
            if Int(GetMoneyAmount.text!)!<1000{
                GetMoneyAmount.text! += sender.titleLabel!.text!
            }
        }else{
            if Int(GetMoneyAmount.text!)!<10000{
                GetMoneyAmount.text! += sender.titleLabel!.text!
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        GetMoneyAmount.text = "0"
        BackMoneyAmount.text = "0"
    }
    
    @IBAction func backmoney(_ sender: Any) {
        BackMoneyAmount.text = "\(Int(GetMoneyAmount.text!)!-Int(SumMoneyAmount.text!)!)"
    }
    
    
    //追加ボタン
    @IBAction func add(_ sender: Any) {
        BackMoneyAmount.text = "\(Int(GetMoneyAmount.text!)!-Int(SumMoneyAmount.text!)!)"
        let alertController1 = UIAlertController(title: "注文",message: "", preferredStyle: UIAlertController.Style.alert)
        let okAction1 = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
            let defaultPlacex = self.DBRef1.child("table/status").child(self.tableNumber!)
            defaultPlacex.observeSingleEvent(of: .value, with: { (snapshot) in
                self.status = (snapshot.value! as AnyObject).description
                if Int(self.status!) != 0{
                    let alertController = UIAlertController(title: "変更はキャンセル後に行ってください",message: "", preferredStyle: UIAlertController.Style.alert)
                    let OKButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alertController.addAction(OKButton)
                    self.present(alertController,animated: true,completion: nil)
                }else{
            //オーダーの入力
            self.b1amount = self.B1AmountLabel.text
            self.b2amount = self.B2AmountLabel.text
            self.s1amount = self.S1AmountLabel.text
            self.s2amount = self.S2AmountLabel.text
            self.s3amount = self.S3AmountLabel.text
            self.d1amount = self.D1AmountLabel.text
            self.d3amount = self.D3AmountLabel.text
            self.d4amount = self.D4AmountLabel.text
            self.dx1amount = self.DX1AmountLabel.text
            self.dx2amount = self.DX2AmountLabel.text
            self.dx3amount = self.DX3AmountLabel.text
            self.dx4amount = self.DX4AmountLabel.text
            self.c1amount = self.C1AmountLabel.text
            self.c3amount = self.C3AmountLabel.text
            self.c10amount = self.C10AmountLabel.text
                    
            self.DBRef1.child("table/order").child(self.tableNumber!).setValue(["b1amount":0,"b2amount":0,"b3amount":self.b1amount!,"b4amount":self.b2amount!,"s1amount":self.s1amount!,"s2amount":self.s2amount!,"s3amount":self.s3amount!,"d1amount":self.d1amount!,"d2amount":0,"d3amount":self.d3amount!,"d4amount":self.d4amount!,"dx1amount":self.dx1amount!,"dx2amount":self.dx2amount!,"dx3amount":self.dx3amount!,"dx4amount":self.dx4amount!,"de1amount":0,"de2amount":0,"de3amount":0,"c1amount":self.c1amount!,"c3amount":self.c3amount!,"c10amount":self.c10amount!,"time":ServerValue.timestamp()])
            self.DBRef1.child("table/status").child(self.tableNumber!).setValue(1)
            self.DBRef1.child("table/bstatus").child(self.tableNumber!).setValue(1)
            self.DBRef1.child("table/destatus").child(self.tableNumber!).setValue(1)
            
            //オーダーキーの設定
            let key = self.DBRef1.child("table/orderorder").childByAutoId().key;
            self.DBRef1.child("table/orderorder").child(key).setValue(self.tableNumber!)
            self.DBRef1.child("table/orderkey").child(self.tableNumber!).setValue(key)
                    
            //データセット
                    self.DBRef1.child("todata").child(key).setValue(["ordertime":ServerValue.timestamp(),"table":self.tableNumber!,"b3":self.b1amount!,"b4":self.b2amount!,"s1":self.s1amount!,"s2":self.s2amount!,"s3":self.s3amount!,"d1":self.d1amount!,"d2":0,"d3":self.d3amount!,"d4":self.d4amount!,"dx1":self.dx1amount!,"dx2":self.dx2amount!,"dx3":self.dx3amount!,"dx4":self.dx4amount!,"c1":self.c1amount!,"c3":self.c3amount!,"c10":self.c10amount!])
            
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
            let defaultPlace7 = self.DBRef1.child("table/allorder/alls2amount")
            defaultPlace7.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls2amount = (snapshot.value! as AnyObject).description
                self.newalls2amount = Int(self.alls2amount!)! - Int(self.s2amount!)!
                self.DBRef1.child("table/allorder/alls2amount").setValue(self.newalls2amount)
            })
            let defaultPlace8 = self.DBRef1.child("table/allorder/alls3amount")
            defaultPlace8.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls3amount = (snapshot.value! as AnyObject).description
                self.newalls3amount = Int(self.alls3amount!)! - Int(self.s3amount!)!
                self.DBRef1.child("table/allorder/alls3amount").setValue(self.newalls3amount)
            })
            let defaultPlace3 = self.DBRef1.child("table/allorder/alld1amount")
            defaultPlace3.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld1amount = (snapshot.value! as AnyObject).description
                self.newalld1amount = Int(self.alld1amount!)! - Int(self.d1amount!)!
                self.DBRef1.child("table/allorder/alld1amount").setValue(self.newalld1amount)
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
            let defaultPlace12 = self.DBRef1.child("table/allorder/alldx1amount")
            defaultPlace12.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx1amount = (snapshot.value! as AnyObject).description
                self.newalldx1amount = Int(self.alldx1amount!)! - Int(self.dx1amount!)!
                self.DBRef1.child("table/allorder/alldx1amount").setValue(self.newalldx1amount)
            })
            let defaultPlace13 = self.DBRef1.child("table/allorder/alldx2amount")
            defaultPlace13.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx2amount = (snapshot.value! as AnyObject).description
                self.newalldx2amount = Int(self.alldx2amount!)! - Int(self.dx2amount!)!
                self.DBRef1.child("table/allorder/alldx2amount").setValue(self.newalldx2amount)
            })
            let defaultPlace14 = self.DBRef1.child("table/allorder/alldx3amount")
            defaultPlace14.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx3amount = (snapshot.value! as AnyObject).description
                self.newalldx3amount = Int(self.alldx3amount!)! - Int(self.dx3amount!)!
                self.DBRef1.child("table/allorder/alldx3amount").setValue(self.newalldx3amount)
            })
            let defaultPlace15 = self.DBRef1.child("table/allorder/alldx4amount")
            defaultPlace15.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx4amount = (snapshot.value! as AnyObject).description
                self.newalldx4amount = Int(self.alldx4amount!)! - Int(self.dx4amount!)!
                self.DBRef1.child("table/allorder/alldx4amount").setValue(self.newalldx4amount)
            })
            let defaultPlace9 = self.DBRef1.child("table/allorder/allc1amount")
            defaultPlace9.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc1amount = (snapshot.value! as AnyObject).description
                self.newallc1amount = Int(self.allc1amount!)! - Int(self.c1amount!)!
                self.DBRef1.child("table/allorder/allc1amount").setValue(self.newallc1amount)
            })
            let defaultPlace10 = self.DBRef1.child("table/allorder/allc3amount")
            defaultPlace10.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc3amount = (snapshot.value! as AnyObject).description
                self.newallc3amount = Int(self.allc3amount!)! - Int(self.c3amount!)!
                self.DBRef1.child("table/allorder/allc3amount").setValue(self.newallc3amount)
            })
            let defaultPlace11 = self.DBRef1.child("table/allorder/allc10amount")
            defaultPlace11.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc10amount = (snapshot.value! as AnyObject).description
                self.newallc10amount = Int(self.allc10amount!)! - Int(self.c10amount!)!
                self.DBRef1.child("table/allorder/allc10amount").setValue(self.newallc10amount)
            })
            let defaultPlace16 = self.DBRef1.child("toproceeds")
            defaultPlace16.observeSingleEvent(of: .value, with: { (snapshot) in
            self.proceeds = (snapshot.value! as AnyObject).description
            self.intproceeds = Int(self.proceeds!)! + Int(self.SumMoneyAmount.text!)!
            self.DBRef1.child("toproceeds").setValue(self.intproceeds)
            })
                    let alertController = UIAlertController(title: "お釣りは\(String(describing: self.BackMoneyAmount.text!))円です",message: "", preferredStyle: UIAlertController.Style.alert)
                    let OKButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alertController.addAction(OKButton)
                    self.present(alertController,animated: true,completion: nil)
                }
            })
        }
        let cancelButton1 = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController1.addAction(okAction1)
        alertController1.addAction(cancelButton1)
        present(alertController1,animated: true,completion: nil)
    }
    
    //削除ボタン
    @IBAction func dlete(_ sender: Any) {
        let alertController3 = UIAlertController(title: "削除",message: "", preferredStyle: UIAlertController.Style.alert)
        let okAction3 = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
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
            let defaultPlace7 = self.DBRef1.child("table/allorder/alls2amount")
            defaultPlace7.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls2amount = (snapshot.value! as AnyObject).description
                self.newalls2amount = Int(self.alls2amount!)! + Int(self.s2amount!)!
                self.DBRef1.child("table/allorder/alls2amount").setValue(self.newalls2amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("s2amount").setValue(0)
            })
            let defaultPlace8 = self.DBRef1.child("table/allorder/alls3amount")
            defaultPlace8.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alls3amount = (snapshot.value! as AnyObject).description
                self.newalls3amount = Int(self.alls3amount!)! + Int(self.s3amount!)!
                self.DBRef1.child("table/allorder/alls3amount").setValue(self.newalls3amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("s3amount").setValue(0)
            })
            let defaultPlace3 = self.DBRef1.child("table/allorder/alld1amount")
            defaultPlace3.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alld1amount = (snapshot.value! as AnyObject).description
                self.newalld1amount = Int(self.alld1amount!)! + Int(self.d1amount!)!
                self.DBRef1.child("table/allorder/alld1amount").setValue(self.newalld1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("d1amount").setValue(0)
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
            let defaultPlace12 = self.DBRef1.child("table/allorder/alldx1amount")
            defaultPlace12.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx1amount = (snapshot.value! as AnyObject).description
                self.newalldx1amount = Int(self.alldx1amount!)! + Int(self.dx1amount!)!
                self.DBRef1.child("table/allorder/alldx1amount").setValue(self.newalldx1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("dx1amount").setValue(0)
            })
            let defaultPlace13 = self.DBRef1.child("table/allorder/alldx2amount")
            defaultPlace13.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx2amount = (snapshot.value! as AnyObject).description
                self.newalldx2amount = Int(self.alldx2amount!)! + Int(self.dx2amount!)!
                self.DBRef1.child("table/allorder/alldx2amount").setValue(self.newalldx2amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("dx2amount").setValue(0)
            })
            let defaultPlace14 = self.DBRef1.child("table/allorder/alldx3amount")
            defaultPlace14.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx3amount = (snapshot.value! as AnyObject).description
                self.newalldx3amount = Int(self.alldx3amount!)! + Int(self.dx3amount!)!
                self.DBRef1.child("table/allorder/alldx3amount").setValue(self.newalldx3amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("dx3amount").setValue(0)
            })
            let defaultPlace15 = self.DBRef1.child("table/allorder/alldx4amount")
            defaultPlace15.observeSingleEvent(of: .value, with: { (snapshot) in
                self.alldx4amount = (snapshot.value! as AnyObject).description
                self.newalldx4amount = Int(self.alldx4amount!)! + Int(self.dx4amount!)!
                self.DBRef1.child("table/allorder/alldx4amount").setValue(self.newalldx4amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("dx4amount").setValue(0)
            })
            let defaultPlace9 = self.DBRef1.child("table/allorder/allc1amount")
            defaultPlace9.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc1amount = (snapshot.value! as AnyObject).description
                self.newallc1amount = Int(self.allc1amount!)! + Int(self.c1amount!)!
                self.DBRef1.child("table/allorder/allc1amount").setValue(self.newallc1amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("c1amount").setValue(0)
            })
            let defaultPlace10 = self.DBRef1.child("table/allorder/allc3amount")
            defaultPlace10.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc3amount = (snapshot.value! as AnyObject).description
                self.newallc3amount = Int(self.allc3amount!)! + Int(self.c3amount!)!
                self.DBRef1.child("table/allorder/allc3amount").setValue(self.newallc3amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("c3amount").setValue(0)
            })
            let defaultPlace11 = self.DBRef1.child("table/allorder/allc10amount")
            defaultPlace11.observeSingleEvent(of: .value, with: { (snapshot) in
                self.allc10amount = (snapshot.value! as AnyObject).description
                self.newallc10amount = Int(self.allc10amount!)! + Int(self.c10amount!)!
                self.DBRef1.child("table/allorder/allc10amount").setValue(self.newallc10amount)
                self.DBRef1.child("table/order").child(self.tableNumber!).child("c10amount").setValue(0)
            })
            let defaultPlace16 = self.DBRef1.child("toproceeds")
            defaultPlace16.observeSingleEvent(of: .value, with: { (snapshot) in
                self.proceeds = (snapshot.value! as AnyObject).description
                self.intproceeds = Int(self.proceeds!)! - Int(self.SumMoneyAmount.text!)!
                self.DBRef1.child("toproceeds").setValue(self.intproceeds)
            })
            
            self.DBRef1.child("table/order").child(self.tableNumber!).child("time").setValue(0)
            self.DBRef1.child("table/status").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/bstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/tbstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/sstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/dstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/dxstatus").child(self.tableNumber!).setValue(0)
            self.DBRef1.child("table/destatus").child(self.tableNumber!).setValue(0)
            //オーダーキーのリセット
            var hogekey : String?
            let defaultPlace17 = self.DBRef1.child("table/orderkey").child(self.tableNumber!)
            defaultPlace17.observeSingleEvent(of: .value, with: { (snapshot) in
                hogekey = (snapshot.value! as AnyObject).description
                self.DBRef1.child("table/orderorder").child(hogekey!).setValue(nil)
                self.DBRef1.child("todata").child(hogekey!).setValue(nil)
                self.DBRef1.child("table/orderkey").child(self.tableNumber!).setValue(nil)
            })
        }
        let cancelButton3 = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
        
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
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.status(_:)),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func amountload(_ sender: Timer) {
        let defaultPlace = DBRef1.child("table/order").child(tableNumber!).child("b3amount")
        defaultPlace.observeSingleEvent(of: .value, with: { (snapshot) in self.b1amount = (snapshot.value! as AnyObject).description
            self.B1AmountLabel.text = self.b1amount!
            self.B1StepperValue.value = Double(Int(self.b1amount!)!)
        })
        let defaultPlace1 = DBRef1.child("table/order").child(tableNumber!).child("b4amount")
        defaultPlace1.observeSingleEvent(of: .value, with: { (snapshot) in self.b2amount = (snapshot.value! as AnyObject).description
            self.B2AmountLabel.text = self.b2amount!
            self.B2StepperValue.value = Double(Int(self.b2amount!)!)
        })
        let defaultPlace2 = DBRef1.child("table/order").child(tableNumber!).child("s1amount")
        defaultPlace2.observeSingleEvent(of: .value, with: { (snapshot) in self.s1amount = (snapshot.value! as AnyObject).description
            self.S1AmountLabel.text = self.s1amount!
            self.S1StepperValue.value = Double(Int(self.s1amount!)!)
        })
        let defaultPlace15 = DBRef1.child("table/order").child(tableNumber!).child("s2amount")
        defaultPlace15.observeSingleEvent(of: .value, with: { (snapshot) in self.s2amount = (snapshot.value! as AnyObject).description
            self.S2AmountLabel.text = self.s2amount!
            self.S2StepperValue.value = Double(Int(self.s2amount!)!)
        })
        let defaultPlace16 = DBRef1.child("table/order").child(tableNumber!).child("s3amount")
        defaultPlace16.observeSingleEvent(of: .value, with: { (snapshot) in self.s3amount = (snapshot.value! as AnyObject).description
            self.S3AmountLabel.text = self.s3amount!
            self.S3StepperValue.value = Double(Int(self.s3amount!)!)
        })
        let defaultPlace3 = DBRef1.child("table/order").child(tableNumber!).child("d1amount")
        defaultPlace3.observeSingleEvent(of: .value, with: { (snapshot) in self.d1amount = (snapshot.value! as AnyObject).description
            self.D1AmountLabel.text = self.d1amount!
            self.D1StepperValue.value = Double(Int(self.d1amount!)!)
        })
        let defaultPlace5 = DBRef1.child("table/order").child(tableNumber!).child("d3amount")
        defaultPlace5.observeSingleEvent(of: .value, with: { (snapshot) in self.d3amount = (snapshot.value! as AnyObject).description
            self.D3AmountLabel.text = self.d3amount!
            self.D3StepperValue.value = Double(Int(self.d3amount!)!)
        })
        let defaultPlace6 = DBRef1.child("table/order").child(tableNumber!).child("d4amount")
        defaultPlace6.observeSingleEvent(of: .value, with: { (snapshot) in self.d4amount = (snapshot.value! as AnyObject).description
            self.D4AmountLabel.text = self.d4amount!
            self.D4StepperValue.value = Double(Int(self.d4amount!)!)
        })
        let defaultPlace25 = DBRef1.child("table/order").child(tableNumber!).child("dx1amount")
        defaultPlace25.observeSingleEvent(of: .value, with: { (snapshot) in self.dx1amount = (snapshot.value! as AnyObject).description
            self.DX1AmountLabel.text = self.dx1amount!
            self.DX1StepperValue.value = Double(Int(self.dx1amount!)!)
        })
        let defaultPlace26 = DBRef1.child("table/order").child(tableNumber!).child("dx2amount")
        defaultPlace26.observeSingleEvent(of: .value, with: { (snapshot) in self.dx2amount = (snapshot.value! as AnyObject).description
            self.DX2AmountLabel.text = self.dx2amount!
            self.DX2StepperValue.value = Double(Int(self.dx2amount!)!)
        })
        let defaultPlace27 = DBRef1.child("table/order").child(tableNumber!).child("dx3amount")
        defaultPlace27.observeSingleEvent(of: .value, with: { (snapshot) in self.dx3amount = (snapshot.value! as AnyObject).description
            self.DX3AmountLabel.text = self.dx3amount!
            self.DX3StepperValue.value = Double(Int(self.dx3amount!)!)
        })
        let defaultPlace28 = DBRef1.child("table/order").child(tableNumber!).child("dx4amount")
        defaultPlace28.observeSingleEvent(of: .value, with: { (snapshot) in self.dx4amount = (snapshot.value! as AnyObject).description
            self.DX4AmountLabel.text = self.dx4amount!
            self.DX4StepperValue.value = Double(Int(self.dx4amount!)!)
        })
        let defaultPlace19 = DBRef1.child("table/order").child(tableNumber!).child("c1amount")
        defaultPlace19.observeSingleEvent(of: .value, with: { (snapshot) in self.c1amount = (snapshot.value! as AnyObject).description
            self.C1AmountLabel.text = self.c1amount!
            self.C1StepperValue.value = Double(Int(self.c1amount!)!)
        })
        let defaultPlace20 = DBRef1.child("table/order").child(tableNumber!).child("c3amount")
        defaultPlace20.observeSingleEvent(of: .value, with: { (snapshot) in self.c3amount = (snapshot.value! as AnyObject).description
            self.C3AmountLabel.text = self.c3amount!
            self.C3StepperValue.value = Double(Int(self.c3amount!)!)
        })
        let defaultPlace21 = DBRef1.child("table/order").child(tableNumber!).child("c10amount")
        defaultPlace21.observeSingleEvent(of: .value, with: { (snapshot) in self.c10amount = (snapshot.value! as AnyObject).description
            self.C10AmountLabel.text = self.c10amount!
            self.C10StepperValue.value = Double(Int(self.c10amount!)!)
        })
        
        //全食数の取得
        let defaultPlace8 = self.DBRef1.child("table/allorder/allb3amount")
        defaultPlace8.observe(.value) { (snap: DataSnapshot) in
            self.AllB1AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace9 = self.DBRef1.child("table/allorder/allb4amount")
        defaultPlace9.observe(.value) { (snap: DataSnapshot) in
            self.AllB2AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace10 = self.DBRef1.child("table/allorder/alls1amount")
        defaultPlace10.observe(.value) { (snap: DataSnapshot) in
            self.AllS1AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace17 = self.DBRef1.child("table/allorder/alls2amount")
        defaultPlace17.observe(.value) { (snap: DataSnapshot) in
            self.AllS2AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace18 = self.DBRef1.child("table/allorder/alls3amount")
        defaultPlace18.observe(.value) { (snap: DataSnapshot) in
            self.AllS3AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace11 = self.DBRef1.child("table/allorder/alld1amount")
        defaultPlace11.observe(.value) { (snap: DataSnapshot) in
            self.AllD1AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace13 = self.DBRef1.child("table/allorder/alld3amount")
        defaultPlace13.observe(.value) { (snap: DataSnapshot) in
            self.AllD3AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace14 = self.DBRef1.child("table/allorder/alld4amount")
        defaultPlace14.observe(.value) { (snap: DataSnapshot) in
            self.AllD4AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace30 = self.DBRef1.child("table/allorder/alldx1amount")
        defaultPlace30.observe(.value) { (snap: DataSnapshot) in
            self.AllDX1AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace31 = self.DBRef1.child("table/allorder/alldx2amount")
        defaultPlace31.observe(.value) { (snap: DataSnapshot) in
            self.AllDX2AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace32 = self.DBRef1.child("table/allorder/alldx3amount")
        defaultPlace32.observe(.value) { (snap: DataSnapshot) in
            self.AllDX3AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace33 = self.DBRef1.child("table/allorder/alldx4amount")
        defaultPlace33.observe(.value) { (snap: DataSnapshot) in
            self.AllDX4AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace22 = self.DBRef1.child("table/allorder/allc1amount")
        defaultPlace22.observe(.value) { (snap: DataSnapshot) in
            self.AllC1AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace23 = self.DBRef1.child("table/allorder/allc3amount")
        defaultPlace23.observe(.value) { (snap: DataSnapshot) in
            self.AllC3AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace24 = self.DBRef1.child("table/allorder/allc10amount")
        defaultPlace24.observe(.value) { (snap: DataSnapshot) in
            self.AllC10AmountLabel.text = (snap.value! as AnyObject).description
        }
        let defaultPlace34 = self.DBRef1.child("toproceeds")
        defaultPlace34.observe(.value) { (snap: DataSnapshot) in
            self.ProceedsAmount.text = (snap.value! as AnyObject).description
        }
    }
    
    @objc func status(_ sender: Timer) {
        let defaultPlace = DBRef1.child("table/tbstatus").child(self.tableNumber!)
        defaultPlace.observe(.value) { (snap: DataSnapshot) in self.tbstatus = (snap.value! as AnyObject).description
            if Int(self.tbstatus!) == 1{
                self.BStatus.backgroundColor = UIColor.magenta
            }else{
                self.BStatus.backgroundColor = UIColor.white
            }
        }
        let defaultPlace1 = DBRef1.child("table/sstatus").child(self.tableNumber!)
        defaultPlace1.observe(.value) { (snap: DataSnapshot) in self.sstatus = (snap.value! as AnyObject).description
            if Int(self.sstatus!) == 1{
                self.SStatus.backgroundColor = UIColor.magenta
            }else{
                self.SStatus.backgroundColor = UIColor.white
            }
        }
        let defaultPlace2 = DBRef1.child("table/dstatus").child(self.tableNumber!)
        defaultPlace2.observe(.value) { (snap: DataSnapshot) in self.dstatus = (snap.value! as AnyObject).description
            if Int(self.dstatus!) == 1{
                self.DStatus.backgroundColor = UIColor.magenta
            }else{
                self.DStatus.backgroundColor = UIColor.white
            }
        }
        let defaultPlace3 = DBRef1.child("table/dxstatus").child(self.tableNumber!)
        defaultPlace3.observe(.value) { (snap: DataSnapshot) in self.dxstatus = (snap.value! as AnyObject).description
            if Int(self.dxstatus!) == 1{
                self.DXStatus.backgroundColor = UIColor.magenta
            }else{
                self.DXStatus.backgroundColor = UIColor.white
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//
//  ViewController.swift
//  pcgtest1
//
//  Created by pcg on 2020/1/12.
//  Copyright © 2020 pcg. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var buttonChinese: UIButton!
    @IBOutlet weak var buttonEnglish: UIButton!
    @IBOutlet weak var testDropDownLabel2: UILabel!
    @IBOutlet weak var testPickerView2: UIPickerView!
    @IBOutlet weak var testDropDownLabel: UILabel!
    @IBOutlet weak var testPickerView: UIPickerView!
      private let pickerViewDataSource=["a","b","c"]
    private let pickerViewDataSource2=["a2","b2","c2"]
    var selectedString:String?
    var selectedString2:String?
    
    //the column num of picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView==self.testPickerView){
            return pickerViewDataSource.count
        }else if(pickerView==self.testPickerView2){
            return pickerViewDataSource2.count
        }else{
            return pickerViewDataSource.count;
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView==self.testPickerView){
             return pickerViewDataSource[row];
        }else if(pickerView==self.testPickerView2){
            return pickerViewDataSource2[row];
        }else{
            return pickerViewDataSource[row];
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView==self.testPickerView){
            testDropDownLabel.text=pickerViewDataSource[row]
            testPickerView.isHidden=true
        }else if(pickerView==self.testPickerView2){
            testDropDownLabel2.text=pickerViewDataSource2[row]
            testPickerView2.isHidden=true
        }else{
            testDropDownLabel.text=pickerViewDataSource[row]
            testPickerView.isHidden=true
        }
        
    }
    //设置列宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 10
    }
    //设置行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    //自定义每一项
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 40.0))
        label.backgroundColor = UIColor.clear
        label.textColor=UIColor.white
        label.font=UIFont(name:"Din Condensed",size:32)
        label.text=pickerViewDataSource[row]
        return label
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
        let button:UIButton = UIButton(type: .system)
        button.frame = CGRect(x:50, y:220, width:150, height:30)
        button.setTitle("2.点击按钮出现弹窗", for:.normal)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    @objc func buttonClick(){
        
        let myAlert = MyView(frame: CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        myAlert.confirmButtonCallBack = {() -> () in
                   print("just click confirm btn")
                   
               }
        
        
        self.view.addSubview(myAlert)
    }
    
    @IBAction func buttonChineseClicked(_ sender: Any) {
        
        Languager.standardLanguager().currentLanguage = "zh-Hans"
        print("chinese")
       resetRootViewController()

    }
    
    @IBAction func buttonEnglishClicked(_ sender: Any) {
        Languager.standardLanguager().currentLanguage = "en"
         print("english")
        resetRootViewController()
        
    }
    
    func resetRootViewController() {
           if let appdelegate = UIApplication.shared.delegate {
               let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
               if let mainController = storyBoard.instantiateViewController(withIdentifier: "rootViewController") as? UIViewController {
                   appdelegate.window??.rootViewController = mainController
               }
           }
       }
    
}


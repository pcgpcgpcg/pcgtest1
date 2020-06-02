//
//  MyView.swift
//  pcgtest1
//
//  Created by pcg on 2020/4/3.
//  Copyright © 2020 pcg. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var contentView:UIView!
    var confirmButtonCallBack:(() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadXib()
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView = loadXib()
        addSubview(contentView)
        
    }
    
    func loadXib() ->UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    
    @IBAction func onConfirmButtonClick(_ sender: UIButton) {
        if confirmButtonCallBack != nil {
            confirmButtonCallBack!()
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

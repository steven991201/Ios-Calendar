//
//  WeekdaysView.swift
//  MyCalendar
//
//  Created by HwangSeunghyun on 2020/02/27.
//  Copyright © 2020 HwangSeunghyun. All rights reserved.
//

import UIKit

class WeekdaysView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
        
        setupViews()
    }
    
    func setupViews(){
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        
        let dayArr = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        for i in 0..<7 {
            let lbl=UILabel()
            lbl.text=dayArr[i]
            lbl.textAlignment = .center
            lbl.textColor = Style.weekdaysLblColor
            myStackView.addArrangedSubview(lbl)
        }
        
    }
    
    let myStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

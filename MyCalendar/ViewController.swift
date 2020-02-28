//
//  ViewController.swift
//  MyCalendar
//
//  Created by HwangSeunghyun on 2020/02/27.
//  Copyright © 2020 HwangSeunghyun. All rights reserved.
//

import UIKit

enum MyTheme {
    case light
    case dark
}
class ViewController: UIViewController {
    var theme = MyTheme.dark

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calendarView)
        calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calendarView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calendarView.myCollectionView.collectionViewLayout.invalidateLayout()
    }

    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calendarView.changeTheme()
    }
    
    let calendarView: CalendarView = {
        let v=CalendarView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()


}


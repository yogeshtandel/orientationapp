//
//  ViewController.swift
//  OrinetationApp
//
//  Created by Yogendra Tandel on 30/12/18.
//  Copyright © 2018 Yogendra Tandel. All rights reserved.
//

import UIKit

struct Menu {
    let title: String
    let innerMenu: [String]
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var deadline_lbl: UILabel!
    
    @IBOutlet weak var myTV: UITableView!
    @IBOutlet weak var btn_Call: UIButton!
    
    var popularDestArr = [String:[String : Any]]()
    
    let menuArr = [
        Menu(title: "1", innerMenu: ["a", "b", "c"]),
        Menu(title: "2", innerMenu: ["d", "e", "f"]),
        Menu(title: "3", innerMenu: ["g", "h", "i"]),
    ]
    var phoneNumber = "91 2342 34234234"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTV.delegate = self
        myTV.dataSource = self
        myTV.reloadData()
        
        btn_Call.addTarget(self, action: #selector(CallOnPhone), for: .touchUpInside)
        
        //cell.titleLable.text = "\((popularDestArr[indexPath.row] as NSDictionary).allKeys[0])"
        //cell.subTitleLable.text = "\(((popularDestArr[indexPath.row] as NSDictionary).allValues[0] as! NSArray)[1])"
        
        /*popularDestArr = [
            ["dubaiStr" : ["best_of_ott_001", "dubaiHotelsStr","(243 Hotels)"]],
            ["parisStr" : ["best_of_ott_002", "parisHotelsStr","(243 Hotels)"]],
            ["istanbulStr" : ["best_of_ott_003", "istanbulHotelsStr","(243 Hotels)"]]
        ]*/
        
        popularDestArr = [
            "1abc":["image":"best_of_ott_001", "title":"dubaiHotelsStr","subtitle":"(243 Hotels)"],
            "2def":["image":"best_of_ott_002", "title":"parisHotelsStr","subtitle":"(434 Hotels)"],
            "3ghi":["image":"best_of_ott_003", "title":"istanbulHotelsStr","subtitle":"(151 Hotels)"]
        ]
        //print((popularDestArr as NSDictionary).allKeys)
        //print(((popularDestArr as NSDictionary).allValues[0]) as! NSDictionary)
        
        
        for arr in  popularDestArr{
            let dict: [String : Any] = arr.value
            //print(dict)
            for (key,value) in dict{
                print(key)
                print(value)
            }
        }
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "some text"
        label.sizeToFit()
        
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        myTV.tableHeaderView = headerView
        
        headerView.centerXAnchor.constraint(equalTo: myTV.centerXAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        headerView.widthAnchor.constraint(equalTo: myTV.widthAnchor).isActive = true
        
        label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 50).isActive = true
        
        myTV.tableHeaderView?.layoutIfNeeded()
        
        
        
        
        let str1 = "16230"
        let str2 = "63455333"
        
        let dateText = NSMutableAttributedString.init(string: "\(str1)\(str2)")
        dateText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold),
                                NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.strikethroughStyle: 2],
                               range: NSMakeRange(0, str1.count))
        dateText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
                                NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.strikethroughStyle: 1],
                               range: NSMakeRange(str1.count,str2.count))
        
        // set the attributed string to the UILabel object
        deadline_lbl.attributedText = dateText
        
    }
    
    @objc func CallOnPhone(sender:UIButton){
        let newStringPhone = phoneNumber.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        //print(newStringPhone)
        if newStringPhone != ""{
            if let url = URL(string: "tel://\(newStringPhone)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr[section].innerMenu.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        title.text = menuArr[section].title
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyCell! = tableView.dequeueReusableCell( withIdentifier: "MyCell") as? MyCell
        cell.lbl_Title.text = menuArr[indexPath.section].innerMenu[indexPath.row]
        cell.btn_Click.addTarget(self, action: #selector(BtnClicked), for: .touchUpInside)
        //print(menuArr[indexPath.section].title)
        //print(menuArr[indexPath.section].innerMenu[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc func BtnClicked(sender:UIButton!){
        let view = sender.superview!
        let cell = view.superview as! MyCell
        let indexPath = myTV.indexPath(for: cell)
        //print("\(indexPath?.section) - \(indexPath?.row)")
    }


}




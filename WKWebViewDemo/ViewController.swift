//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 09/01/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var webContainer: UIView!
    @IBOutlet weak var optionBtn: UIButton!
    @IBOutlet weak var uriTextField: UITextField!
    lazy var browser: NETabBrowser = {
        let browser = NETabBrowser(incognito: false)
        return browser
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // install web view
        installWebBrowser()
        
        _ = browser.load(URLRequest(url: URL(string: "http://www.163.com")!))
    }

    func installWebBrowser() {
        webContainer.addSubview(browser)
        browser.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }

    @IBAction func optionBtnAction(_ sender: Any) {
        print("Title:\(browser.title ?? "null")")
    }
    
}


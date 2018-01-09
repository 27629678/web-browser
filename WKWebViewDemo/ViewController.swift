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
        view.addSubview(browser)
        browser.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }


}


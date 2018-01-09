//
//  NETabBrowser.swift
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 09/01/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit

import WebKit

class NETabBrowser: NEWebBrowser {

    init(incognito: Bool) {
        super.init(frame: CGRect.zero, configuration: WKWebViewConfiguration())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

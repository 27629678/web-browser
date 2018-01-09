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
    
    lazy var navDelegate: NENavigationDelegate = {
        let delegate = NENavigationDelegate()
        return delegate
    }()

    init(incognito: Bool) {
        let config = WKWebViewConfiguration()
        
        let userScript = WKUserScript(source: "console.log('hello, world.')",
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)
        config.userContentController.addUserScript(userScript)
        if #available(iOS 11.0, *) {
            config.setURLSchemeHandler(NEURLSchemeHandler(), forURLScheme: "netease")
        } else {
            // Fallback on earlier versions
        }
        
        super.init(frame: CGRect.zero, configuration: config)
        navigationDelegate = navDelegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

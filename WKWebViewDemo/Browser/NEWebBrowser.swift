//
//  NEWebBrowser.swift
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 09/01/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import WebKit

class NEWebBrowser: WKWebView {

    override
    func load(_ request: URLRequest) -> WKNavigation? {
        return super.load(request)
    }
}

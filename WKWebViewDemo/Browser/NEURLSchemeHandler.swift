//
//  NEURLSchemeHandler.swift
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 09/01/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import WebKit

@available(iOS 11.0, *)
class NEURLSchemeHandler: NSObject, WKURLSchemeHandler {
    
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        
        print("SchemeHandler:\(String(describing:urlSchemeTask.request.url))")
        
        let resp = URLResponse(url: urlSchemeTask.request.url!,
                               mimeType: "text/plain",
                               expectedContentLength: -1,
                               textEncodingName: nil)
        urlSchemeTask.didReceive(resp)
        urlSchemeTask.didReceive("hello, world.".data(using: String.Encoding.utf8)!)
        urlSchemeTask.didFinish()
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        
    }
    

}

//
//  NENavigationDelegate.swift
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 09/01/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import WebKit

class NENavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) 
    {
        print("NavigationAction:\(String(describing: navigationAction.request.url))")
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void)
    {
        print("NavigationResponse:\(String(describing: navigationResponse.response.url))")
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("commit: \(String(describing: webView.backForwardList.currentItem?.url))")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish:\(navigation)")
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("terminate.")
    }

}

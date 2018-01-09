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

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var webContainer: UIView!
    @IBOutlet weak var optionBtn: UIButton!
    @IBOutlet weak var uriTextField: UITextField!
    
    // @objc used for kvo
    @objc lazy var browser: NETabBrowser = {
        let browser = NETabBrowser(incognito: false)
        return browser
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // install web view
        installWebBrowser()
        
        // set uri text input delegate
        uriTextField.delegate = self
        progressbar.setProgress(0, animated: false)
        
        // observer
        addObserver(self, forKeyPath: #keyPath(browser.estimatedProgress), options: [.old, .new], context: nil)
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
    
    override
    func observeValue(forKeyPath keyPath: String?,
                      of object: Any?,
                      change: [NSKeyValueChangeKey : Any]?,
                      context: UnsafeMutableRawPointer?)
    {
        if keyPath == #keyPath(browser.estimatedProgress) {
            let progress = Float(browser.estimatedProgress)
            if progress >= 0.99 {
                progressbar.setProgress(0, animated: false)
            }
            else {
                progressbar.setProgress(progress, animated: true)
            }
        }
    }
}

extension ViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let url = textField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else {
            return false
        }
        
        guard let uri = URL(string:url) else {
            return false
        }
        
        _ = browser.load(URLRequest(url: uri))
        
        return true
    }
}




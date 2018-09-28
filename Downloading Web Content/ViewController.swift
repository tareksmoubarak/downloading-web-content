//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Tarek Moubarak on 9/28/18.
//  Copyright © 2018 Tarek Moubarak. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if let url = URL(string: "https://www.tarekmoubarak.com"){
//            webView.load(URLRequest(url: url))
//        }
//         webView.loadHTMLString("<h1 style='display:block;width:100%;text-align:center'>Hello, There!</h1>", baseURL: nil)
        
        if let url = URL(string: "http://www.tarekmoubarak.com"){
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                //data, response, error These are the 3 variables we can use below
                if let error = error {
                    print(error)
                } else{
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute: {
                            // Update UI
                        })
                    }
                }
            }
            task.resume()
        }
    }


}


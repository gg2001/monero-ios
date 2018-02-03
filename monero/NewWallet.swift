//
//  NewWallet.swift
//  monero
//
//  Created by gg on 1/22/18.
//  Copyright © 2018 gg. All rights reserved.
//

import UIKit
import WebKit

class NewWallet: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let htmlPath = Bundle.main.path(forResource: "addressgen", ofType: "html")
        let request = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        webView.loadFileURL(request, allowingReadAccessTo: request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}

//
//  NewWallet.swift
//  monero
//
//  Created by gg on 1/22/18.
//  Copyright © 2018 gg. All rights reserved.
//

import UIKit
import JavaScriptCore

class NewWallet: UIViewController {
    
    var jsContext: JSContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.initializeJS()
        self.helloWorld()
    }
    
    func initializeJS() {
        self.jsContext = JSContext()
        
        if let jsSourcePath = Bundle.main.path(forResource: "NewWallet", ofType: "js") {
            do {
                // Load its contents to a String variable.
                let jsSourceContents = try String(contentsOfFile: jsSourcePath)
                // Add the Javascript code that currently exists in the jsSourceContents to the Javascript Runtime through the jsContext object.
                self.jsContext.evaluateScript(jsSourceContents)
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func helloWorld() {
        if let variableHelloWorld = self.jsContext.objectForKeyedSubscript("helloWorld") {
            print(variableHelloWorld.toString())
        }
    }
}

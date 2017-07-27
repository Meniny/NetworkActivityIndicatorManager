//
//  ViewController.swift
//  Sample
//
//  Created by Meniny on 2017-07-27.
//  Copyright © 2017年 Meniny. All rights reserved.
//

import UIKit
import NAIManager

class ViewController: UIViewController {

    @IBAction func startRequest(_ sender: UIButton) {
        NAIManager.operationStarted()
        //UIApplication.networkingOperationStarted()
        //UIApplication.shared.networkingOperationStarted()
        
        update()
    }
    
    @IBAction func finishRequest(_ sender: UIButton) {
        NAIManager.operationFinished()
        //UIApplication.networkingOperationFinished()
        //UIApplication.shared.networkingOperationFinished()
        
        update()
    }
    
    func update() {
        title = "Operations: \(NAIManager.networkingOperationsCount)"
        //UIApplication.networkingOperationsCount
        //UIApplication.shared.networkingOperationsCount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update()
    }

}


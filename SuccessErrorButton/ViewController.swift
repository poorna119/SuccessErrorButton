//
//  ViewController.swift
//  SuccessErrorButton
//
//  Created by qbuser on 22/12/16.
//  Copyright © 2016 qbuser. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    @IBOutlet weak var successErrorButton: ErrorSuccessButton!
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    let btn = ErrorSuccessButton(frame: CGRect(x: 50, y: 50, width: 140, height: 60))
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let btn = ErrorSuccessButton(frame: CGRect(x: 50, y: 50, width: 160, height: 60))
        self.view.addSubview(btn)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func successButtonTap(_ sender: AnyObject) {
        let triggerTime = (Int64(NSEC_PER_SEC) * 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            self.btn.successEnable()
        })
    }
    @IBAction func errorButtonTap(_ sender: AnyObject) {
        let triggerTime = (Int64(NSEC_PER_SEC) * 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            self.btn.errorEnable()
        })
    }
    @IBAction func resetButtonTap(_ sender: AnyObject) {
        
        btn.reset()
    }
    
   
    }


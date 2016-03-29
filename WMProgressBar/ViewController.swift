//
//  ViewController.swift
//  WMProgressBar
//
//  Created by Daniel Warner on 3/29/16.
//  Copyright © 2016 Daniel Warner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressBar.setProgress(fractionalProgress, animated: animated)
            progressLbl.text = ("\(counter)%")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         progressBar.setProgress(0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startProgress(sender: AnyObject) {
        progressLbl.text = "0%"
        self.counter = 0
        for _ in 0..<100 {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    self.counter = self.counter + 1
                    return
                })
            })
        }
    }

}


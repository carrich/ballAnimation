//
//  ViewController.swift
//  thaBong
//
//  Created by Ngoduc on 2/8/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
var time: Timer!
class ViewController: UIViewController {
    @IBOutlet weak var bong: UIImageView!
    var ybandau: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ybandau = bong.frame.origin.y
        chuyendong2()
//        UIView.animate(withDuration: 6) {
//            self.bong.center.y = 762
//        }
    
//        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runloop), userInfo: nil, repeats: true)
}
    func chuyendong1() {
        UIView.animate(withDuration: 1){
            self.bong.frame.origin.y += self.view.frame.maxY - self.bong.frame.height*2 - 20
        }
    }
    func chuyendong2() {
        UIView.animate(withDuration: 1, animations: {
            self.bong.frame.origin.y += self.view.frame.maxY - self.bong.frame.height*2 - 20
        }){ (_) in
            UIView.animate(withDuration: 1){
                self.bong.frame.origin.y -= self.view.frame.maxY - self.ybandau - self.bong.frame.height*2
            }
        }
    }
    @objc func runloop(){
       self.bong.center.y += 10
        if self.bong.center.y > 762 {
            time.invalidate()
        }
    }
}


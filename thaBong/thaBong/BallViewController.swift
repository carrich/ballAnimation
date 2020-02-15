//
//  BallViewController.swift
//  thaBong
//
//  Created by Ngoduc on 2/11/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class BallViewController: UIViewController {
    //Khởi tạo đối tương
    var ballImageView: UIImageView!
    //Khai bao timer
    var timer: Timer!
    var count: Float = 0;
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Khởi tạo đối tương imageView
        ballImageView = UIImageView(frame: CGRect(x: 0, y: 60, width: 100, height: 100))
//        ballImageView.center.x = view.center.x
        // đặt anh cho imageView
        ballImageView.image = UIImage(named: "sport")
        ballImageView.contentMode = .scaleAspectFit
        
        //them imageView vao superview
        view.addSubview(ballImageView)
        //Khởi tạo bộ định giơ
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runloop), userInfo: nil, repeats: true)
    }
    
    @objc func runloop(){
        ballImageView.frame.origin.y += 10
        count += 1
        self.ballImageView.transform = CGAffineTransform(rotationAngle: CGFloat(count*Float.pi / 2))
        if ballImageView.frame.origin.y > view.frame.maxY - ballImageView.frame.height {
            timer.invalidate()
             timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(chayPhai), userInfo: nil, repeats: true)
        }
    }
    @objc func chaynguoc(){
        ballImageView.frame.origin.y -= 10
        count += 1
         self.ballImageView.transform = CGAffineTransform(rotationAngle: CGFloat(count*Float.pi / 2))
         print(ballImageView.frame.origin.y)
        if ballImageView.frame.origin.y < CGFloat(0) {
           print("Ok")
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(chayTrai), userInfo: nil, repeats: true)
            }
               }
    
    @objc func chayPhai(){
           ballImageView.frame.origin.x += 10
        count += 1
         self.ballImageView.transform = CGAffineTransform(rotationAngle: CGFloat(count*Float.pi / 2))
            print(ballImageView.frame.origin.x)
        if ballImageView.frame.origin.x > 350 {
              print("Ok")
               timer.invalidate()
             timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(chaynguoc), userInfo: nil, repeats: true)
                  }
       }
    @objc func chayTrai(){
              ballImageView.frame.origin.x -= 10
        count += 1
         self.ballImageView.transform = CGAffineTransform(rotationAngle: CGFloat(count*Float.pi / 2))
               print(ballImageView.frame.origin.x)
           if ballImageView.frame.origin.x < 0 {
                 print("Ok")
                  timer.invalidate()
                
                     }
          }
   
}

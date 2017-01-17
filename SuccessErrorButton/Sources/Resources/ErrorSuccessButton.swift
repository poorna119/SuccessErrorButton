//
//  ErrorSuccessButton.swift
//  SuccessErrorButton
//
//  Created by qbuser on 03/01/17.
//  Copyright © 2017 qbuser. All rights reserved.
//
import UIKit

class ErrorSuccessButton: UIButton {
    var shadowLayer: CAShapeLayer!
    var isRotating = false
    var buttonHeight = 0.0
    var buttonWidth = 0.0
    var buttonX = 0.0
    var buttonY = 0.0
    //var oldCenter =
     override  func awakeFromNib() {
        let newCenter = self.center
        self.layer.removeAllAnimations()
        // self.center.y = CGFloat(buttonY)
        self.frame.size.width = CGFloat(buttonWidth)
        self.frame.size.height = CGFloat(buttonHeight)
         self.center = newCenter
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = CGFloat(buttonHeight)/2
        let image = UIImage(named: "arrow.png") as UIImage?
        self.setImage(image, for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        

        super.init(coder: aDecoder)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonHeight = Double(frame.height)
        buttonWidth = Double(frame.width)
        buttonX = Double(frame.minX)
        buttonY = Double(frame.minY)
        self.layer.removeAllAnimations()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = CGFloat(buttonHeight)/2
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5
            
        
            
        
        

        let image = UIImage(named: "arrow.png") as UIImage?
        self.setImage(image, for: .normal)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let oldCenter = self.center
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.frame.size.width = CGFloat(self.buttonHeight) + 10
            self.frame.size.height = CGFloat(self.buttonHeight) + 10
            self.layer.cornerRadius =  self.frame.size.width/2
            self.center = oldCenter
            self.layoutIfNeeded()
            },  completion: { finished in
                print("animation finished")
                let image = UIImage(named: "refresh.png") as UIImage?
                self.setImage(image, for: UIControlState())
                UIView.animate(withDuration: 0, delay: 0, animations: {
                    if !self.isRotating {
                        let spinAnimation = CABasicAnimation()
                        spinAnimation.fromValue = 0
                        spinAnimation.toValue = M_PI*2
                        spinAnimation.duration = 0.6
                        spinAnimation.repeatCount = Float.infinity
                        spinAnimation.isRemovedOnCompletion = false
                        spinAnimation.fillMode = kCAFillModeForwards
                        spinAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
                        self.imageView?.layer.add(spinAnimation, forKey: "transform.rotation.z")
                    }
                    /*else {
                        self.layer.removeAllAnimations()
                    }*/
                    //self.isRotating = !self.isRotating
                    },  completion: { finished in
                })
        
        })
//})
}
func successEnable() {
        self.imageView?.layer.removeAllAnimations()
        self.layer.removeAllAnimations()
        self.backgroundColor = UIColor.clear
        self.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,0)
        var imageArray = [UIImage]()
        for i in 27...41 {
            let image = UIImage(named: "\(i).png") as UIImage?
            self.setImage(image, for: UIControlState())
            imageArray.append(image!)
        }
        self.imageView!.animationRepeatCount = 1
        self.imageView!.animationImages = imageArray
        self.imageView!.animationDuration = 0.3
        self.imageView!.startAnimating()
    }
    func errorEnable() {
        self.layer.removeAllAnimations()
        self.imageView?.layer.removeAllAnimations()
        
        self.backgroundColor = UIColor.clear
        self.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,0)

        var imageArray = [UIImage]()
        for i in 19...26 {
            let image = UIImage(named: "\(i).png") as UIImage?
            self.setImage(image, for: UIControlState())
            imageArray.append(image!)
        }
        self.imageView!.animationRepeatCount = 1
        self.imageView!.animationImages = imageArray
        self.imageView!.animationDuration = 0.3
        self.imageView!.startAnimating()
        
       let triggerTime = (Int64(USEC_PER_SEC) * 400)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.08
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 8, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 8, y: self.center.y))
            self.layer.add(animation, forKey: "position")
            
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    func reset() {
  
        self.awakeFromNib()
    }
   
}


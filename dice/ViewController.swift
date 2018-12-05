//
//  ViewController.swift
//  dice
//
//  Created by Sumith Kumar on 26/11/18.
//  Copyright © 2018 Sumith Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomVariable1:Int = 0
    var randomVariable2: Int = 0
    var i:Int = 0
    let imageArray=["dice1","dice2","dice3","dice4","dice5","dice6"]
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func btnClickMe(_ sender: UIButton) {
        i=i+1
        if i <= 3{
            loopingRandomImage()
        }else{
            button.isEnabled=false
            self.showToast(message: "Your Play is Over...")
        }
        
        
    }
    @IBAction func btnReset(_ sender: UIButton) {
        i = 0
        self.showToast(message: "Play Again....")
        button.isEnabled=true
        print(i)
        
    }
    func loopingRandomImage(){
            let luckyNumber = Int(textView.text!)
            randomVariable1=Int.random(in:0...5)
            randomVariable2=Int.random(in:0...5)
            if luckyNumber == (randomVariable1 + 1) || luckyNumber == (randomVariable2 + 1){
                imageView1.image=UIImage(named:imageArray[randomVariable1])
                imageView2.image=UIImage(named:imageArray[randomVariable2])
                self.showToast(message: "You Won !")
            }else{
                imageView1.image=UIImage(named:imageArray[randomVariable1])
                imageView2.image=UIImage(named:imageArray[randomVariable2])
        
        }
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    

}


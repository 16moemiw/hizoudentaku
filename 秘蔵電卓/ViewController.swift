//
//  ViewController.swift
//  秘蔵電卓
//
//  Created by Moemi Watanabe on 11/25/16.
//  Copyright © 2016 Moemi Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number: Int=0
    @IBOutlet var label:UILabel!
    var ope = 0
   
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func one(){
        number = number * 10 + 1
        label.text = String(number)
    }
    
    @IBAction func two() {
        number = number * 10 + 2
        label.text = String(number)
    }
    
    @IBAction func three() {
        number = number * 10 + 3
        label.text = String(number)
    }
    
    @IBAction func four() {
        number = number * 10 + 4
        label.text = String(number)
        
        if number == 1234 {
            performSegueWithIdentifier("toPhotos", sender: nil)
        }
        
    }
    
    @IBAction func five() {
        number = number * 10 + 5
        label.text = String(number)
    }
    
    @IBAction func six() {
        number = number * 10 + 6
        label.text = String(number)
    }
    
    @IBAction func seven() {
        number = number * 10 + 7
        label.text = String(number)
    }
    
    @IBAction func eight() {
        number = number * 10 + 8
        label.text = String(number)
    }
    
    @IBAction func nine() {
        number = number * 10 + 9
        label.text = String(number)
    }
    
    @IBAction func add() {
        ope = 1
//        number = number +
//        label.text = String(number)
    }
    
//    @IBAction func subtract() {
//        number = number -
//        label.text = String(number)
//    }
//    
//    @IBAction func multiply() {
//        number = number *
//        label.text = String(number)
//    }
//    
//    @IBAction func divide() {
//        number = number / 
//        label.text = String(number)
//    }
//    
    @IBAction func enter() {
        if ope == 1 {
            //number3 = number + number2
        }
    
    }
    
    @IBAction func clear() {
        number = 0
        label.text = String(number)
        
    }
}


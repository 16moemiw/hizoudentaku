//
//  OpenPhotosViewController.swift
//  秘蔵電卓
//
//  Created by Moemi Watanabe on 2017/11/03.
//  Copyright © 2017 Moemi Watanabe. All rights reserved.
//

import UIKit

class OpenPhotosViewController: UIViewController, UINavigationControllerDelegate{

        var photos: [UIImage] = []
        @IBOutlet var imageView: UIImageView!
        let photoData: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back (){
            dismissViewControllerAnimated(true, completion: nil)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

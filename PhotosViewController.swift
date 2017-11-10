//
//  PhotosViewController.swift
//  秘蔵電卓
//
//  Created by Moemi Watanabe on 12/9/16.
//  Copyright © 2016 Moemi Watanabe. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    var photos: [UIImage] = []
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    let picker = UIImagePickerController()
    let photoData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        // Do any additional setup after loading the view.
        
        let images = photoData.objectForKey("photos") as! [NSData]
        
        for image in images {
            photos.append(UIImage(data: image)!)
            // NSDataをUIImageしたものをphotosに追加する
        }
        //　take out the photos. save. Add to photo library, then save.
        
        
        
        collectionView.backgroundView = UIView()
        collectionView.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image =  photos[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (photos.count)
    }
    
    @IBAction func addnew() {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing =  true
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            //imageView.image = pickedImage
            //photosにpickedImageを追加（append）する
            photos.append(pickedImage)
            collectionView.reloadData()
            
        }
        
        let pickedImages: [NSData] = photos.map { (image) -> NSData in
            UIImagePNGRepresentation(image)!}
        
        photoData.setObject(pickedImages, forKey: "photos")
        photoData.synchronize()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        collectionView.reloadData()
    }
    
    // didSelect---
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("しらす")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
                actionSheet.addAction(
            UIAlertAction(title: "消去する", style: .Default, handler: {(action) -> Void in
                self.photos.removeAtIndex(indexPath.row)
                self.photoData.synchronize()
                //リロードする
                collectionView.reloadData()

            })
        )
        
        actionSheet.addAction(
            UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        )
        actionSheet.addAction(
            UIAlertAction(title: "開く", style: .Default, handler: {(action) -> Void in
                //リロードする
                collectionView.reloadData()
                self.performSegueWithIdentifier("OpenPhotos", sender: nil)

                })
        )


        self.presentViewController(actionSheet, animated: true, completion: {

            print("アラート表示された")
            }
        )
        
        //配列から選択された番号の画像を削除
        //保存し直す
        let pickedImages: [NSData] = photos.map { (image) -> NSData in
            UIImagePNGRepresentation(image)!
        }
        
        photoData.setObject(pickedImages, forKey: "photos")
        photoData.synchronize()
        //リロードする
        collectionView.reloadData()
        
    }
    
    
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



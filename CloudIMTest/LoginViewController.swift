//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/8.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, RCAnimatedImagesViewDelegate {
    
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var wallpaperImageView: RCAnimatedImagesView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wallpaperImageView.delegate = self
        wallpaperImageView.startAnimating()

        // Do any additional setup after loading the view.
    }
    
    func animatedImagesNumber(ofImages animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(_ animatedImagesView: RCAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        let imageNames = ["image1", "image2", "image3"]
        let intIndex = Int(index)
        return UIImage(named: imageNames[intIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2) {
            self.loginStackView.axis = .vertical
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

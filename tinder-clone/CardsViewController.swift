//
//  CardsViewController.swift
//  tinder-clone
//
//  Created by Tianyi Xing on 10/8/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    //@IBOutlet weak var profileImageView: UIImageView!
   
    @IBOutlet weak var draggableView: DraggableImageView!
    
    @IBAction func onTapGesture(sender: UITapGestureRecognizer) {
        
            self.performSegueWithIdentifier("afterTap", sender: self)
        
    }
    
    
    @IBAction func onProfilePanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        
            var point = panGestureRecognizer.translationInView(view)
            var velocity = panGestureRecognizer.velocityInView(view)
            
            if panGestureRecognizer.state == UIGestureRecognizerState.Began {
                print("Gesture began at: \(point)")
                cardInitialCenter = draggableView.center
                
            } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                print("Gesture changed at: \(point)")
                draggableView.center = CGPoint(x: cardInitialCenter.x + point.x, y: cardInitialCenter.y + point.y)
                
                
            } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                print("Gesture ended at: \(point)")
                // trayView.center = trayOriginalCenter
                if point.x > 100 {
                    NSLog("Should swipe off")
                } else {
                    NSLog("Should return to normal")
                }
                draggableView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
                
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var panGuestureRecognizer = UIPanGestureRecognizer(target: self, action: "onProfilePanGesture")
        // Do any additional setup after loading the view.
        view.addGestureRecognizer(panGuestureRecognizer)
        
        draggableView.image = UIImage(named: "ryan")
        draggableView.caption = "Ryan, 25"

        draggableView.imageView.layer.cornerRadius = 25

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var destinationViewController = segue.destinationViewController as! ProfileViewController

        destinationViewController.image = self.draggableView.imageView.image

    }


}

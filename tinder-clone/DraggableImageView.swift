//
//  DraggableImageView.swift
//  tinder-clone
//
//  Created by Tianyi Xing on 10/8/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()

    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)

            // custom initialization logic
       
    }
    
    
    var caption: String? {
        get { return nameLabel?.text }
        set { nameLabel.text = newValue }
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue
        }
    }
}

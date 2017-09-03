//
//  CustomCalloutView.swift
//  MyInstaMap
//
//  Created by DucTran on 9/2/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class CustomCalloutView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit()
    }
    
    private func commonInit() {
        // Load the nib
        Bundle.main.loadNibNamed("CustomCalloutView", owner: self, options: [:])
        
        // Add the 'contentView' to self
        addSubview(contentView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("imageTapped ", tappedImage)
        // Your action
    }
    
}

//
//  CustomCalloutView.swift
//  MyInstaMap
//
//  Created by DucTran on 9/2/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

protocol CustomCalloutViewDelegate: class {
    func btnShareClicked(photo: UIImage?, text: String?)
}

class CustomCalloutView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAvartaImageView: UIImageView!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    weak var delegate: CustomCalloutViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit()
    }
    
    func setupCaptionTextView() {
        self.captionTextView.textContainerInset = UIEdgeInsets.zero;
        self.captionTextView.textContainer.lineFragmentPadding = 0;
    }
    
    func setupContentView() {
        self.contentView.layer.cornerRadius = 20;
        self.contentView.layer.borderWidth = 1.0;
        self.contentView.layer.borderColor = UIColor.clear.cgColor;
        self.contentView.layer.masksToBounds = true;
    }
    
    func setupPostPhoto() {
        self.mediaImageView.layer.cornerRadius = 10;
        self.mediaImageView.layer.borderWidth = 1.0;
        self.mediaImageView.layer.borderColor = UIColor.clear.cgColor;
        self.mediaImageView.layer.masksToBounds = true;
    }
    
    private func commonInit() {
        // Load the nib
        Bundle.main.loadNibNamed("CustomCalloutView", owner: self, options: [:])
        
        // Add the 'contentView' to self
        addSubview(contentView)
        
        setupCaptionTextView()
        
        setupContentView()
        
        setupPostPhoto()
        
    }
    
    @IBAction func btnShareClicked(_ sender: Any) {
        delegate?.btnShareClicked(photo: self.mediaImageView.image, text: self.captionTextView.text)
    }
    
}

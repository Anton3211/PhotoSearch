//
//  OnboardingCollectionViewCell.swift
//  PhotoSearch
//
//  Created by Anton on 15.02.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    static let identifier = "OnboardingCollectionViewCell"
    
    
    func setup(_ slide:OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
}

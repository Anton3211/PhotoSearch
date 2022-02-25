//
//  OneboardingViewController.swift
//  PhotoSearch
//
//  Created by Anton on 15.02.2022.
//

import UIKit

class OneboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageCntrl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet{
            pageCntrl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Начнем поиск", for: .normal)
            }else {
                nextBtn.setTitle("Далее", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARK: - MyLayout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        slides = [OnboardingSlide(title: "Поиск фотографии", description: "Ищи фотографии по различным хэштэгам, например Ocean", image: UIImage(named: "3")!),
                  OnboardingSlide(title: "Нажми!", description: "Открывай фото по нажатию на снимок", image: UIImage(named: "2")!)]

    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
   

}

extension OneboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        pageCntrl.currentPage = currentPage
    }

    
    
}

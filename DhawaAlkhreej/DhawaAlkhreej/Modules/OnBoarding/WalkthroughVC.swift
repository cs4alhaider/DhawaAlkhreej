//
//  WalkthroughViewController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 21/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class WalkthroughVC: BaseViewController {

    @IBOutlet var pageControl: UIPageControl!
    
    var PageViewVC: PageViewVC?
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        setBackground()
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    @IBAction func skipButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: K.UserDefaults.onBoardingViewed)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? PageViewVC {
            self.PageViewVC = pageViewController
            PageViewVC?.PageViewDelegate = self
        }
    }
    
    private func setBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = UIColor.gradientColors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = [0.5, 0.75, 1]
        gradientLayer.shouldRasterize = true
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension WalkthroughVC: PageViewVCDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        
        if let index = PageViewVC?.currentIndex {
            pageControl.currentPage = index
        }
    }
}

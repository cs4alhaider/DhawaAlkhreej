//
//  PageViewVC.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 21/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

protocol PageViewVCDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class PageViewVC: UIPageViewController {
    
    weak var PageViewDelegate: PageViewVCDelegate?
    
    var pageTexts: [String] = ["لا تشيل هم!\n علينا حساب نسبتك الموزونة بكل دقة",
                               "خرّيج ومحتار أي تخصص تختار؟\n هنا كل التخصصات اللي بتخطر على بالك",
                               "فيه أكثر من تخصص محتار بينهم؟\n اضفهم هنا بمكان واحد"]
    
    var pageImages: [String] = ["image1", "image2", "image3"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func contentViewController(at index: Int) -> PageController? {
        
        if index < 0 || index >= pageTexts.count {
            return nil
        }
        let pageContentViewController = UIStoryboard.OnBoarding.instantiateViewController(withClass: PageController.self)
        pageContentViewController.imageName = pageImages[index]
        pageContentViewController.text = pageTexts[index]
        pageContentViewController.index = index
        return pageContentViewController
        
    }
    
}

extension PageViewVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard var index = (viewController as? PageController)?.index else { return nil }
        index -= 1
        return contentViewController(at: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard var index = (viewController as? PageController)?.index else { return nil }
        index += 1
        return contentViewController(at: index)
    }
}

extension PageViewVC: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? PageController {
                currentIndex = contentViewController.index
                PageViewDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
}

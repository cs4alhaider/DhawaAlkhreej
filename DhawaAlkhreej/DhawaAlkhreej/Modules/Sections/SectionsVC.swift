//
//  SectionsVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 21/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

private struct SectionsData {
    let title: String
    let imageName: String
}

class SectionsVC: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let sectionsArray = [
        SectionsData(title: "علمي", imageName: "section-1"),
        SectionsData(title: "إنساني", imageName: "section-2"),
        SectionsData(title: "صحي", imageName: "section-3"),
        SectionsData(title: "هندسي", imageName: "section-4"),
        SectionsData(title: "إداري", imageName: "section-5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        setTitles(navigationTitle: "الاقسام")
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(nibWithCellClass: SectionsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewFlowLayout {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layoutFlow.itemSize = CGSize(width: (view.frame.width / 2) - 30, height: 160)
        layoutFlow.minimumInteritemSpacing = 15
        layoutFlow.minimumLineSpacing = 15
        return layoutFlow
    }
}

extension SectionsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = viewControllerFromStoryboard(withClass: MajorDetailsVC.self, from: .majors)
        vc.majorId = 2 // for example
        pushVC(vc)
    }
}

extension SectionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SectionsCollectionViewCell.self, for: indexPath)
        cell.imageView.image = sectionsArray[indexPath.row].imageName.asImage
        cell.sectionLabel.text = sectionsArray[indexPath.row].title
        return cell
    }
}

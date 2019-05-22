//
//  SectionsVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 21/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class SectionsVC: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let sectionsArray = ["إنساني", "علمي", "صحي", "هندسي", "إداري"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
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
    }
}

extension SectionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SectionsCollectionViewCell.self, for: indexPath)
        cell.imageView.image = #imageLiteral(resourceName: "tabBar2")
        cell.sectionLabel.text = sectionsArray[indexPath.row]
        return cell
    }
}

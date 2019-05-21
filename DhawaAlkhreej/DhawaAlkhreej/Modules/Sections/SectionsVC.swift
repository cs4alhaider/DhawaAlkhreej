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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        setupCollectionView()
        layout()
    }
    
    private func setupCollectionView() {
        collectionView.register(nibWithCellClass: SectionsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func layout() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: (view.frame.width / 2) - 50, height: 100)
        layoutFlow.minimumInteritemSpacing = 3
        layoutFlow.minimumLineSpacing = 3
        collectionView.collectionViewLayout = layoutFlow
    }
}

extension SectionsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension SectionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SectionsCollectionViewCell.self, for: indexPath)
        //
        return cell
    }
    
}

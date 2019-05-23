//
//  SavedMajorsVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class SavedMajorsVC: BaseViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        setTitles(navigationTitle: "التخصصات المحفوظة")
    }
    
    override func setupTableView() {
        tableView.registerNibCell(nibWithCellClass: SavedMajorsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
    }
}

extension SavedMajorsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SavedMajorsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SavedMajorsTableViewCell.self, for: indexPath)
        cell.titleLabel.text = "علوم الحاسب"
        return cell
    }
}

//
//  MajorDetailsVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

private struct ExampleMajorData {
    let sectionTitle: String
    let subtitle: String
}

class MajorDetailsVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var majorId: Int?
    
    fileprivate let array = [
        ExampleMajorData(sectionTitle: "النسب", subtitle: "النسبة النسبالنسبة النسبالنسبة النسبالنسبة"),
        ExampleMajorData(sectionTitle: "الشروط", subtitle: "شروط شروط شروط شروط شروط"),
        ExampleMajorData(sectionTitle: "الشهادة المطلوبة", subtitle: "علمي"),
        ExampleMajorData(sectionTitle: "المسار الجامعي", subtitle: "علمي"),
        ExampleMajorData(sectionTitle: "عدد السنوات", subtitle: "٤ سنوات"),
        ExampleMajorData(sectionTitle: "الخطة الدراسية", subtitle: "www.AnyURl.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        setTitles(navigationTitle: "") // getting the title from the object by id
    }

    override func setupTableView() {
        tableView.registerNibCell(nibWithCellClass: MajorDetailsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MajorDetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MajorDetailsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: MajorDetailsTableViewCell.self, for: indexPath)
        cell.titleLabel.text = array[indexPath.section].subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MajorsSectionView()
        headerView.titleLabel.text = array[section].sectionTitle
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
}

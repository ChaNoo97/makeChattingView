//
//  ViewController.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit

class MainViewController: BaseViewController {
	
	let mainView = MainView()
	
	override func loadView() {
		self.view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.mainTableView.delegate = self
		mainView.mainTableView.dataSource = self
		
		mainView.mainTableView.register(YourTableCell.self, forCellReuseIdentifier: YourTableCell.reuseIdentifier)
		mainView.mainTableView.register(MyTableCell.self, forCellReuseIdentifier: MyTableCell.reuseIdentifier)
		
		mainView.mainTableView.rowHeight = UITableView.automaticDimension
		mainView.mainTableView.estimatedRowHeight = UITableView.automaticDimension
	}


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell1 = mainView.mainTableView.dequeueReusableCell(withIdentifier: YourTableCell.reuseIdentifier, for: indexPath)
		let cell2 = mainView.mainTableView.dequeueReusableCell(withIdentifier: MyTableCell.reuseIdentifier, for: indexPath)
		
		let row = indexPath.row
		if row%2 == 0 {
			return cell1
		} else {
			return cell2
		}
	
	}
	
	
}


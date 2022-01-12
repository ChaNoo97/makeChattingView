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
		
		mainView.mainTableView.register(MyTableCell.self, forCellReuseIdentifier: MyTableCell.reuseIdentifier)
	}


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: MyTableCell.reuseIdentifier, for: indexPath)
		return cell
	}
	
	
}


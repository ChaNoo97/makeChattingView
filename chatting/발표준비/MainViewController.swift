//
//  ViewController.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
	
	let mainView = MainView()
	let viewModel = MainViewModel()
	
	override func loadView() {
		self.view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		mainView.textView.delegate = self
		mainView.textView.font = .systemFont(ofSize: 20)
		
		mainView.mainTableView.delegate = self
		mainView.mainTableView.dataSource = self
		
		mainView.mainTableView.register(YourTableCell.self, forCellReuseIdentifier: YourTableCell.reuseIdentifier)
		mainView.mainTableView.register(MyTableCell.self, forCellReuseIdentifier: MyTableCell.reuseIdentifier)
		
		mainView.mainTableView.rowHeight = UITableView.automaticDimension
		mainView.mainTableView.estimatedRowHeight = UITableView.automaticDimension
		
//		mainView.mainTableView.tableFooterView = mainView.footerView
		
		mainView.mySendButton.addTarget(self, action: #selector(mySendButtonClicked), for: .touchUpInside)
		mainView.yourSendButton.addTarget(self, action: #selector(yourSendButtonClicked), for: .touchUpInside)
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
		
		let tab = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
		mainView.mainTableView.addGestureRecognizer(tab)
		
	}
	
	@objc func mySendButtonClicked() {
		print(#function)
		viewModel.mySendButtonClicked(message: mainView.textView.text!)
		mainView.mainTableView.reloadData()
	}
	
	@objc func yourSendButtonClicked() {
		print(#function)
		viewModel.yourSendButtonClicked(message: mainView.textView.text!)
		mainView.mainTableView.reloadData()
	}
	
	@objc func keyboardShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			let keyboardHeight = keyboardSize.height - view.safeAreaInsets.bottom
			self.mainView.chattingView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
		}
	}
	
	@objc func keyboardHide(notification: NSNotification) {
		self.mainView.chattingView.transform = .identity
	}
	
	@objc func keyboardDismiss() {
		mainView.textView.endEditing(true)
	}

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.chats.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell1 = mainView.mainTableView.dequeueReusableCell(withIdentifier: YourTableCell.reuseIdentifier, for: indexPath) as! YourTableCell
		let cell2 = mainView.mainTableView.dequeueReusableCell(withIdentifier: MyTableCell.reuseIdentifier, for: indexPath) as! MyTableCell
		 
		let row = viewModel.chats.value[indexPath.row]
		
		if row.mine {
			cell2.myChatContent.text = row.chat
			return cell2
		} else {
			cell1.yourChatContent.text = row.chat
			return cell1
		}
	}
}

extension MainViewController: UITextViewDelegate {
	func textViewDidChange(_ textView: UITextView) {
		let contentHeight = textView.contentSize.height
		DispatchQueue.main.async {
			if contentHeight <= 60 {
				self.mainView.textView.snp.updateConstraints {
					$0.height.equalTo(44)
				}
			} else if contentHeight >= 102 {
				self.mainView.textView.snp.updateConstraints {
					$0.height.equalTo(102)
				}
			} else {
				self.mainView.textView.snp.updateConstraints {
					$0.height.equalTo(contentHeight)
				}
			}
		}
	}
}


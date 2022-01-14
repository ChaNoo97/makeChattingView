//
//  SocketViewController.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/14.
//

import Foundation
import UIKit
import Alamofire

class SocketViewcontroller: UIViewController {
	let mainView = MainView()
	let name = "Hoohoo"

	var list: [SocketChat] = []
	
	override func loadView() {
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.mainTableView.delegate = self
		mainView.mainTableView.dataSource = self
		mainView.mainTableView.register(MyTableCell.self, forCellReuseIdentifier: MyTableCell.reuseIdentifier)
		mainView.mainTableView.register(YourTableCell.self, forCellReuseIdentifier: YourTableCell.reuseIdentifier)
		
		NotificationCenter.default.addObserver(self, selector: #selector(getMessage(notification:)), name: NSNotification.Name("getMessage"), object: nil)
		mainView.mySendButton.addTarget(self, action: #selector(mySendBtnClicked), for: .touchUpInside)
		requestChats()
	}
	
	@objc func mySendBtnClicked() {
		postChat()
	}
	
	func postChat() {
		let header: HTTPHeaders = [
			"Authorization": "Bearer \(Private.token)",
			"Accept": "application/json"
		]
		
		let inputText = mainView.textView.text!
		AF.request(Private.ChatUrl, method: .post, parameters: ["text": inputText], encoder: JSONParameterEncoder.default ,headers: header).responseString { data in
			print("POST CHAT SUCCEED", data)
			self.mainView.textView.text = ""
		}
	}
	
	//DB(last chat time): 나중에는 DB에 기록된 채팅의 마지막 시간을 서버에 요청. 새로운 데이터만 서버에서 받아오기!
	func requestChats() {
		let header: HTTPHeaders = [
			"Authorization": "Bearer \(Private.token)",
			"Accept": "application/json"
		]
		AF.request(Private.ChatUrl, method: .get, headers: header).responseDecodable(of: [SocketChat].self) { response in
			switch response.result {
			case .success(let value):
				self.list = value
				self.mainView.mainTableView.reloadData()
				self.mainView.mainTableView.scrollToRow(at: [0, self.list.count-1], at: .bottom, animated: false)
				SocketIOManager.shared.establishConnection()
			case .failure(let error):
				print("FAIL", error)
			}
			
		}
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		SocketIOManager.shared.coloseConnection()
	}
	
	@objc func getMessage(notification: NSNotification) {
		let chat = notification.userInfo!["chat"] as! String
		let name = notification.userInfo!["name"] as! String
		let createdAt = notification.userInfo!["createdAt"] as! String
		
		let value = SocketChat(text: chat, userID: "", name: name, username: "", id: "", createdAt: createdAt, updatedAt: "", v: 0, lottoID: "")
		list.append(value)
		mainView.mainTableView.reloadData()
		self.mainView.mainTableView.scrollToRow(at: [0, self.list.count-1], at: .bottom, animated: false)
  	}
}

extension SocketViewcontroller: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let data = list[indexPath.row]
		
		if data.name == name {
			let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: MyTableCell.reuseIdentifier) as! MyTableCell
			cell.myChatContent.text = data.text
			return cell
		} else {
			let cell = mainView.mainTableView.dequeueReusableCell(withIdentifier: YourTableCell.reuseIdentifier) as! YourTableCell
			cell.yourChatContent.text = data.text
			return cell
		}
	}
	
	
}

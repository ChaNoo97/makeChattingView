//
//  MainViewModel.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/13.
//

import Foundation

class MainViewModel {
	
	var chats = Observable(Chats())
	
	func mySendButtonClicked(message: String) {
		let newChat = Chat(chat: message, date: .now, mine: true)
		chats.value.append(newChat)
	}
	
	func yourSendButtonClicked(message: String) {
		let newChat = Chat(chat: message, date: .now, mine: false)
		chats.value.append(newChat)
	}
}

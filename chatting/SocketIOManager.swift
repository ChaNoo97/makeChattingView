//
//  SocketIOManager.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/14.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
	
	let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxZTBjNWI2YmUzNDViZDllZDBjN2QzMSIsImlhdCI6MTY0MjEyMDYzMCwiZXhwIjoxNjQyMjA3MDMwfQ.EKEpfAriKSIVI1fTrxeRTKvsWzgcGjFofTR27JXNWBA"
	
	static let shared = SocketIOManager()
	
	// 서버에서 메시지를 주고 받기 위한 클래스.
	var manager: SocketManager!
	
	// 클라이언트 소켓
	var socket: SocketIOClient!
	
	override init() {
		super.init()
		
		let url = URL(string: Private.soketURL)!
		manager = SocketManager(socketURL: url, config: [
			.log(true),
			.compress,
			.extraHeaders(["auth": token])
		])
		
		socket = manager.defaultSocket // "/"로 된 룸
		
		//소켓 연결 메서드
		socket.on(clientEvent: .connect) { data, ack in
			print("Socket Is CONNECTED", data, ack)
		}
		
		//소켓 연결 해제 메서드
		socket.on(clientEvent: .disconnect) { data, ack in
			print("Socket is DISCONNECTED", data, ack)
		}
		
		//소켓 채팅 듣는 메서드, sesac 이벤트로 날아온 데이터를 수신
		// 데이터 수신 -> 디코딩 -> 모델에 추가 -> 갱신
		
		socket.on("sesac") { dataArray, ack in
			print("SESAC RECEIVED", dataArray)
			let data = dataArray[0] as! NSDictionary
			let chat = data["text"] as! String
			let name = data["name"] as! String
			let createdAt = data["createdAt"] as! String
			
			print("Check",chat, name, createdAt)
			
			NotificationCenter.default.post(name: NSNotification.Name("getMessage"), object: self, userInfo: ["chat": chat, "name": name, "createdAt": createdAt])
 		}
	}
	
	func establishConnection() {
		socket.connect()
	}
	
	func coloseConnection() {
		socket.disconnect()
	}
	
}

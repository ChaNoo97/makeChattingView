//
//  MainView.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit
import SnapKit

class MainView: BaseView {
	
	let mainTableView = UITableView()
	let chattingView = UIView()
	let textView = UITextView()
	let mySendButton = UIButton()
	let yourSendButton = UIButton()
	let bottomView = UIView()
//	let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func configure() {
		bottomView.backgroundColor = .black
//		footerView.backgroundColor = .red
		mainTableView.separatorStyle = .none
		mainTableView.backgroundColor = .blue

		chattingView.backgroundColor = .magenta
		
		yourSendButton.backgroundColor = .purple
		yourSendButton.setImage(UIImage(named: "bubbleBlack"), for: .normal)
		mySendButton.backgroundColor = .green
		mySendButton.setImage(UIImage(named: "bubbleWhite"), for: .normal)
	}
	
	override func makeConstraint() {
		[mainTableView,bottomView].forEach {
			addSubview($0)
		}
		
		[chattingView,textView, mySendButton, yourSendButton].forEach {
			bottomView.addSubview($0)
		}
		
		mainTableView.snp.makeConstraints {
//			$0.top.leading.trailing.equalToSuperview()
//			$0.bottom.equalTo(chattingView.snp.top)
			$0.edges.equalToSuperview()
		}
		
		bottomView.snp.makeConstraints {
			$0.bottom.equalToSuperview()
			$0.leading.trailing.top.equalTo(chattingView)
		}
		
		chattingView.snp.makeConstraints {
			$0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
			$0.height.greaterThanOrEqualTo(60)
		}

		yourSendButton.snp.makeConstraints {
			$0.leading.bottom.equalTo(chattingView)
			$0.width.height.equalTo(60)
		}

		mySendButton.snp.makeConstraints {
			$0.trailing.bottom.equalTo(chattingView)
			$0.width.height.equalTo(60)
		}

		textView.snp.makeConstraints {
			$0.leading.equalTo(yourSendButton.snp.trailing).offset(8)
			$0.trailing.equalTo(mySendButton.snp.leading).offset(-8)
			$0.bottom.top.equalTo(chattingView).inset(8)
			$0.height.equalTo(44)
		}
		
	}
}

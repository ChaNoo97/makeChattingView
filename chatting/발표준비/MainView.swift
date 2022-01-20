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
	let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func configure() {
		mainTableView.separatorStyle = .none

		chattingView.backgroundColor = .lightGray
		
		yourSendButton.backgroundColor = .lightGray
		yourSendButton.setImage(UIImage(named: "btnBlack"), for: .normal)
		mySendButton.backgroundColor = .lightGray
		mySendButton.setImage(UIImage(named: "btnWhite"), for: .normal)
	}
	
	override func makeConstraint() {
		[mainTableView, chattingView].forEach {
			addSubview($0)
		}
		
		[textView, mySendButton, yourSendButton].forEach {
			chattingView.addSubview($0)
		}
		
		mainTableView.snp.makeConstraints {
			$0.bottom.equalTo(chattingView.snp.top)
			$0.leading.trailing.top.equalTo(self.safeAreaLayoutGuide)
//			$0.edges.equalTo(self.safeAreaInsets)
		}
		
		chattingView.snp.makeConstraints {
			$0.leading.trailing.bottom.equalToSuperview()
			$0.height.greaterThanOrEqualTo(60)
		}

		yourSendButton.snp.makeConstraints {
			$0.leading.bottom.equalTo(self.safeAreaLayoutGuide)
			$0.size.equalTo(60)
		}

		mySendButton.snp.makeConstraints {
			$0.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
			$0.size.equalTo(60)
		}

		textView.snp.makeConstraints {
			$0.leading.equalTo(yourSendButton.snp.trailing).offset(8)
			$0.trailing.equalTo(mySendButton.snp.leading).offset(-8)
			$0.top.equalTo(chattingView).inset(8)
			$0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
			$0.height.equalTo(44)
		}
		
	}
}

//
//  MyTableCell.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//
//bubbleImageView.image = UIImage(named: "bubbleWhite")?.resizableImage(withCapInsets: UIEdgeInsets(top: 15, left: 19, bottom: 27, right: 20))

import UIKit
import SnapKit

//오른쪽 말풍선
class MyTableCell: UITableViewCell {
	
	let bubbleImageView = UIImageView()
	let myChatContent = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: MyTableCell.reuseIdentifier)
		
		configure()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		print("cell required error")
	}
	
	func configure() {
		myChatContent.numberOfLines = 0
		bubbleImageView.image = UIImage(named: "myBubble")
//		?.resizableImage(withCapInsets: UIEdgeInsets(top: 53, left: 17, bottom: 40, right: 45))
//		bubbleImageView.backgroundColor = .systemCyan
	}
	
	func makeConstraints() {
		[bubbleImageView, myChatContent].forEach {
			contentView.addSubview($0)
		}
		
		bubbleImageView.snp.makeConstraints {
			$0.trailing.top.bottom.equalTo(contentView).inset(5)
			$0.leading.greaterThanOrEqualTo(contentView).inset(100)
		}
		
		myChatContent.snp.makeConstraints {
			$0.trailing.equalTo(bubbleImageView).inset(25)
			$0.leading.bottom.top.equalTo(bubbleImageView).inset(10)
		}
		
	}
	
}

//
//  YourTableCell.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit
import SnapKit

// 왼쪽 말풍선
class YourTableCell: UITableViewCell {
	
	let bubbleImageView = UIImageView()
	let yourChatContent = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: YourTableCell.reuseIdentifier)
		
		configure()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		print("cell required error")
	}
	
	func configure() {
		yourChatContent.numberOfLines = 0
		bubbleImageView.image = UIImage(named: "yourBubble")
		yourChatContent.textColor = .white
//		bubbleImageView.backgroundColor = .blue
	}
	
	func makeConstraints() {
		[bubbleImageView, yourChatContent].forEach {
			contentView.addSubview($0)
		}
		
		bubbleImageView.snp.makeConstraints {
			$0.leading.top.bottom.equalTo(contentView).inset(5)
			$0.trailing.lessThanOrEqualTo(contentView).inset(100)
		}
		
		yourChatContent.snp.makeConstraints {
			$0.leading.equalTo(bubbleImageView).inset(25)
			$0.trailing.top.bottom.equalTo(bubbleImageView).inset(10)
		}
		
	}
	
}

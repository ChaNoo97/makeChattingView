//
//  YourTableCell.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit
import SnapKit

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
//		bubbleImageView.image = UIImage(named: "bubbleBlack")
		bubbleImageView.image = UIImage(named: "bubbleBlack")?.resizableImage(withCapInsets: UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20))
		bubbleImageView.contentMode = .scaleToFill
//		bubbleImageView.layer.cornerRadius = 5
//		bubbleImageView.backgroundColor = .green
//		chatContent.backgroundColor = .cyan
		
	}
	
	func makeConstraints() {
		[bubbleImageView, yourChatContent].forEach {
			contentView.addSubview($0)
		}
		
		bubbleImageView.snp.makeConstraints {
			$0.leading.top.bottom.equalTo(contentView)
			$0.trailing.lessThanOrEqualTo(contentView).inset(100)
//			$0.trailing.equalTo(contentView).inset(100)
		}
		
		yourChatContent.snp.makeConstraints {
			$0.leading.trailing.top.equalTo(bubbleImageView).inset(20)
			$0.bottom.equalTo(bubbleImageView.snp.bottom).inset(30)
		}
		
	}
	
}

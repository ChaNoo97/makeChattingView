//
//  MyTableCell.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit
import SnapKit

class MyTableCell: UITableViewCell {
	
	let bubbleImageView = UIImageView()
	let chatContent = UILabel()
	
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
		chatContent.text = "가"
		chatContent.numberOfLines = 0
//		bubbleImageView.image = UIImage(named: "bubbleBlack")
		bubbleImageView.image = UIImage(named: "bubbleWhite")?.resizableImage(withCapInsets: UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20))
		bubbleImageView.contentMode = .scaleToFill
//		bubbleImageView.layer.cornerRadius = 5
//		bubbleImageView.backgroundColor = .green
//		chatContent.backgroundColor = .cyan
		
	}
	
	func makeConstraints() {
		[bubbleImageView, chatContent].forEach {
			contentView.addSubview($0)
		}
		
		bubbleImageView.snp.makeConstraints {
			$0.trailing.top.bottom.equalTo(contentView)
			$0.leading.greaterThanOrEqualTo(contentView).inset(100)
//			$0.trailing.equalTo(contentView).inset(100)
		}
		
		chatContent.snp.makeConstraints {
			$0.leading.trailing.top.equalTo(bubbleImageView).inset(20)
			$0.bottom.equalTo(bubbleImageView.snp.bottom).inset(30)
		}
		
	}
	
}

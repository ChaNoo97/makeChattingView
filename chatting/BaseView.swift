//
//  BaseView.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit

class BaseView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configure()
		self.makeConstraint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure() {
		
	}
	
	func makeConstraint() {
		
	}
	
}

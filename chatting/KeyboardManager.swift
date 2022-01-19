//
//  KeyboardManager.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/18.
//

import Foundation
import SnapKit
import UIKit

class KeyboardManager: BaseViewController {
	
	let imageView = UIImageView()
	let imageView2 = UIImageView()
	let label1 = UILabel()
	let label2 = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(imageView)
		view.addSubview(imageView2)
		view.addSubview(label1)
		view.addSubview(label2)
		
		label1.text = "Stretchches"
		label2.text = "Tiles"
		label1.textAlignment = .center
		label2.textAlignment = .center
		label1.font = .boldSystemFont(ofSize: 20)
		label2.font = .boldSystemFont(ofSize: 20)
		
		imageView.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalToSuperview().offset(100)
			$0.width.equalTo(400)
			$0.height.equalTo(200)
		}
		
		label1.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(imageView.snp.bottom).offset(20)
			$0.width.equalTo(200)
			$0.height.equalTo(50)
		}
		
		imageView2.snp.makeConstraints {
			$0.top.equalTo(imageView.snp.bottom).offset(100)
			$0.centerX.equalToSuperview()
			$0.width.equalTo(400)
			$0.height.equalTo(200)
		}
		
		label2.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(imageView2.snp.bottom).offset(20)
			$0.width.equalTo(label1)
			$0.height.equalTo(label1)
		}
		
		
		imageView.image = UIImage(named: "bit")
		imageView2.image = UIImage(named: "bit2")
	}
}

//
//  StartViewController.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/14.
//

import UIKit


class StartViewController: UIViewController {
	let button = UIButton()
	override func viewDidLoad() {
		super.viewDidLoad()
		button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
		view.addSubview(button)
		button.backgroundColor = .red
		button.addTarget(self, action: #selector(btnclicked), for: .touchUpInside)
	}
	
	@objc func btnclicked() {
		let vc = SocketViewcontroller()
		navigationController?.pushViewController(vc, animated: true)
	}
}

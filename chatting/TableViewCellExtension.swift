//
//  TableViewCellExtension.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/11.
//

import UIKit

protocol ReusableView {
	static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReusableView {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

//
//  Observable.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/13.
//

import Foundation

class Observable<T> {
	private var listener: ((T) -> Void)?
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	init(_ value: T) {
		self.value = value
	}
	
	func bind(_ closure: @escaping (T) -> Void) {
		closure(value)
		listener = closure
	}
}

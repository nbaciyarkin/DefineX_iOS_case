//
//  Bindable.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }

    var observer: ((T?) -> Void)?

    func bind(observer: @escaping (T?) -> Void) {
        self.observer = observer
    }

}

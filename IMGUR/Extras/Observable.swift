//
//  Observable.swift
//  Globant3
//
//

import UIKit

class Observable<ObservedType> {
    private var _value: ObservedType?
    public var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    var valueChanged: ((ObservedType?) -> Void)?
    
    init(_ value: ObservedType) {
        _value = value
    }
}

class BoundLabel: UILabel {
    func bind(to observable: Observable<String>) {
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

class BoundImageView: UIImageView {
    func bind(to observable: Observable<UIImage>) {
        observable.valueChanged = {[weak self] newValue in
            self?.image = newValue
        }
    }
}

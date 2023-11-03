//
//  ReusableProtocol.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/04.
//

import Foundation

protocol ResusableProtocol {
    static var identifier: String { get }
}

extension NSObject: ResusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

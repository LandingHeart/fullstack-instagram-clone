//
//  Optional.swift
//  Instagram
//
//  Created by Huang Yan on 2/22/23.
//
import Foundation
/// In Swift 5.6 or above: extension String?
extension Optional where Wrapped == String {
    public var isNilorEmpty: Bool {
        return self == nil || self == ""
    }
}

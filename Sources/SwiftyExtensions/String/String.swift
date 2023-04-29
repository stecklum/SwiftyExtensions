//
//  String.swift
//  
//
//  Created by Tom Stecklum on 30.04.23.
//

import Foundation

extension String {
    
    public var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    public func localized(with comment: String) -> String {
        NSLocalizedString(self, comment: comment)
    }
    
}

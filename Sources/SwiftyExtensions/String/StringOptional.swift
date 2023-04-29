//
//  StringOptional.swift
//  
//
//  Created by Tom Stecklum on 29.04.23.
//

import Foundation

extension String? {
    
    /// Safely unwraps optional strings test
    /// - Returns: the unwrapped string or an empty string, if the string was nil
    public func unwrapped() -> String {
        guard let self else { return "" }
        return self
    }
    
    /// Checks wether the provides optional String is null or empty
    /// - Returns: true, if the string is empty or null, false if the string contains any characters
    public func isNullOrEmpty() -> Bool {
        guard unwrapped().isEmpty else { return false }
        return true
    }
    
}

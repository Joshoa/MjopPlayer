//
//  Notification+Extensions.swift
//  MjopPlayer
//
//  Created by Marcos Joshoa on 08/05/24.
//

import SwiftUI
import Combine

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

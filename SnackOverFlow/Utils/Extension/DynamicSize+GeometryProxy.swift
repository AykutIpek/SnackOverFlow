//
//  DynamicSize+GeometryProxy.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI

extension GeometryProxy{
    /// Dynamic height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dh(height: Double) -> Double {
        return size.height * height
    }
    /// Dynamic width by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device width
    func dw(width: Double) -> Double {
        return size.width * width
    }
}

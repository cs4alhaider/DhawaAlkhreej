//
//  Double+Extension.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 12/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

extension BinaryFloatingPoint {
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        let divisor = Self((0..<places).reduce(1.0) { (accum, _) in 10.0 * accum })
        return (self * divisor).rounded() / divisor
    }
}

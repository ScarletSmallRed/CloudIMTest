//
//  Inputs.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/11.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import Foundation

struct Inputs: OptionSet {
    let rawValue: Int
    
    static let user = Inputs(rawValue: 1)
    static let pass = Inputs(rawValue: 1 << 1)
    static let mail = Inputs(rawValue: 1 << 2)
    
}

extension Inputs {
    var boolValue: Bool {
        return self.rawValue == 0b111
    }
}

//
//  Points.swift
//  taipeiTOur
//
//  Created by apple on 2022/8/23.
//

import Foundation

struct Points: Codable{
    var total: Int
    var data: [Point]
    struct Point: Codable{
        var name: String
        var introduction: String
    }
}

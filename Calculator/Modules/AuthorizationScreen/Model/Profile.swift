//
//  GenderType.swift
//  Calculator
//
//  Created by Кирилл Колесников on 27.02.2022.
//

import Foundation

enum GenderType: String {
    case male = "M"
    case female = "Ж"
}

struct Profile {
    var name: String
    let gender: GenderType
    let age: Int
}

//
//  Profile.swift
//  PetProject
//
//  Created by Кирилл Колесников on 27.02.2022.
//

import Foundation

struct Profile {
    var name: String
    let gender: GenderType
    let age: Int
}

enum GenderType: String {
    case male = "M"
    case female = "Ж"
}


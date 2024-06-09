//
//  task.swift
//  Portfolio
//
//  Created by Бектур Каримов on 9/6/24.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

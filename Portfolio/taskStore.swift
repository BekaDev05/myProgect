//
//  taskStore.swift
//  Portfolio
//
//  Created by Бектур Каримов on 9/6/24.
//

import SwiftUI
import Combine

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
}

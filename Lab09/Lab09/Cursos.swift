//
//  Cursos.swift
//  Lab09
//
//  Created by Mac03 on 12/05/25.
//

import Foundation

class Cursos: Identifiable, ObservableObject {
    let id = UUID()
    let title: String
    let language: String
    let description: String
    
    init(title: String, language: String, description: String) {
        self.title = title
        self.language = language
        self.description = description
    }
}

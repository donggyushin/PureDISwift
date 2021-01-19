//
//  StringGenerator.swift
//  PureDISwift
//
//  Created by 신동규 on 2021/01/19.
//


protocol StringGeneratorProtocol {
    func generate() -> String
}

class StringGenerator:StringGeneratorProtocol {
    func generate() -> String {
        return "Hello world"
    }
}

class StringGenerator2:StringGeneratorProtocol {
    let text:String
    
    init(text:String) {
        self.text = text
    }
    
    func generate() -> String {
        return "Hello \(text)"
    }
}

//
//  Session.swift
//  VK-2
//
//  Created by Julie on 10.02.2021.
//

import UIKit

class Session {
    
    static let shared = Session()
    private init() { }
    
    var token: String = ""
    var userid: String = ""
    
}

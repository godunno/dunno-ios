//
//  User.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/8/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import Foundation
import Argo

struct User {
    let id: Int
    let name: String
    let email: String?
}

extension User: JSONDecodable {
    static func create(id: Int)(name: String)(email: String?) -> User {
        return User(id: id, name: name, email: email)
    }
    
    static func decode(j: JSONValue) -> User? {
        return User.create
            <^> j <| "id"
            <*> j <|  "name"
            <*> j <|? "email"
    }
}
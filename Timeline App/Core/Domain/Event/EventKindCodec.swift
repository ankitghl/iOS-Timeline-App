//
//  EventKindCodec.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//


import Foundation

enum EventKindCodec {
    static func encode(_ kind: EventKind) -> Data {
        try! JSONEncoder().encode(kind)
    }
    
    static func decode(_ data: Data) -> EventKind {
        try! JSONDecoder().decode(EventKind.self, from: data)
    }
}

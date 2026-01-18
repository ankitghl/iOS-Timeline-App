//
//  EventReader.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation

protocol EventReader {
    func events(from start: Date?, to end: Date?, limit: Int, offset: Int) throws -> [Event]
}

//
//  EventWriter.swift
//  Timeline App
//
//  Created by Ankit Gohel on 17/01/26.
//

import Foundation

protocol EventWriter {
    func append(_ event: Event) throws
}

//
//  Album.swift
//  SampleApi
//
//  Created by Artur Gruchała on 17/01/2022.
//

import Foundation

public struct Album: Codable {
    public let userId: Int
    public let id: Int
    public let title: String
}

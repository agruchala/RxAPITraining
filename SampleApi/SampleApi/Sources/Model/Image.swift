//
//  Image.swift
//  SampleApi
//
//  Created by Artur Gruchała on 17/01/2022.
//

import Foundation

public struct Image: Codable {
    public let albumId: Int
    public let id: Int
    public let title: String
    public let url: URL
    public let thumbnailUrl: URL
}

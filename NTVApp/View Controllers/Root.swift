//
//  Root.swift
//  NTVApp
//
//  Created by TURGUT on 21.03.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//



import Foundation

import Foundation

// MARK: - Root
struct Root: Codable {
    let status: String?
    let feed: Feed?
    let items: [Item]?
}

// MARK: - Feed
struct Feed: Codable {
    let url: String?
    let title, link, author, description: String?
    let image: String?
    
}

// MARK: - Item
struct Item: Codable {
    let title, pubDate: String?
    let link, guid: String?
    let author: Author?
    let thumbnail: String?
    let description, content: String?
    let enclosure: Enclosure?

    init(title: String, pubDate: String, link: String, guid: String, author: Author?, thumbnail: String, description: String, content: String, enclosure: Enclosure?) {
        self.title = title
        self.pubDate = pubDate
        self.link = link
        self.guid = guid
        self.author = author
        self.thumbnail = thumbnail
        self.description = description
        self.content = content
        self.enclosure = enclosure
        
    }
   
  
}

enum Author: String, Codable {
    case ntv = "NTV"
}

// MARK: - Enclosure
struct Enclosure: Codable {

}

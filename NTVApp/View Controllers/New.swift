

import Foundation

struct New: Codable {
    let title, pubDate: String?
    let link, guid: String?
    let thumbnail: String?
    let description, content: String?
    
    init(title: String, pubDate: String, link: String, guid: String, thumbnail: String, description: String, content: String) {
        self.title = title
        self.pubDate = pubDate
        self.link = link
        self.guid = guid
        self.thumbnail = thumbnail
        self.description = description
        self.content = content
    }
}


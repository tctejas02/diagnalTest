//
//  Model_Data.swift
//  DIAGNALTEST
//
//  Created by tejas chaudhari on 19/05/22.
//

import Foundation

struct Model_Data : Codable {
    let page : Page?

    enum CodingKeys: String, CodingKey {

        case page = "page"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Page.self, forKey: .page)
    }

}

struct Page : Codable {
    let title : String?
    let totalcontentitems : String?
    let pagenum : String?
    let pagesize : String?
    let contentitems : Contentitems?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case totalcontentitems = "total-content-items"
        case pagenum = "page-num"
        case pagesize = "page-size"
        case contentitems = "content-items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        totalcontentitems = try values.decodeIfPresent(String.self, forKey: .totalcontentitems)
        pagenum = try values.decodeIfPresent(String.self, forKey: .pagenum)
        pagesize = try values.decodeIfPresent(String.self, forKey: .pagesize)
        contentitems = try values.decodeIfPresent(Contentitems.self, forKey: .contentitems)
    }

}

struct Contentitems : Codable {
    let content : [Content]?

    enum CodingKeys: String, CodingKey {

        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        content = try values.decodeIfPresent([Content].self, forKey: .content)
    }

}

struct Content : Codable {
    let name : String?
    let posterimage : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case posterimage = "poster-image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        posterimage = try values.decodeIfPresent(String.self, forKey: .posterimage)
    }

}

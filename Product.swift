
//Product.swift
//  APIFetchingUsingJSONDecoder
//
//  Created by Mac on 15/04/25.

import Foundation
struct Product: Decodable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rate: Double
    var count: Int

    enum ProductKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }

    enum RatingKeys: String, CodingKey {
        case rate
        case count
    }

    init(from decoder: Decoder) throws {
        let mainContainer = try decoder.container(keyedBy: ProductKeys.self)
        id = try mainContainer.decode(Int.self, forKey: .id)
        title = try mainContainer.decode(String.self, forKey: .title)
        price = try mainContainer.decode(Double.self, forKey: .price)
        description = try mainContainer.decode(String.self, forKey: .description)
        category = try mainContainer.decode(String.self, forKey: .category)
        image = try mainContainer.decode(String.self, forKey: .image)

        let ratingContainer = try mainContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        rate = try ratingContainer.decode(Double.self, forKey: .rate)
        count = try ratingContainer.decode(Int.self, forKey: .count)
    }
}

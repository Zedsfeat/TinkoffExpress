//
//  CatalogService.swift
//  TinkoffExpress
//
//  Created by Полина Рыфтина on 07.05.2023.
//

import Foundation

protocol CatalogService {
    func loadItems(completion: @escaping ([Product]) -> Void)
}

final class MockCatalogService: CatalogService {
    func loadItems(completion: @escaping ([Product]) -> Void) {
        let products: [Product] = [
            .init(
                productTypeId: ProductType.kettle.rawValue,
                title: "Чайник электрический",
                price: 3556,
                image: "kettle"
            ),
            .init(
                productTypeId: ProductType.phone.rawValue,
                title: "Мобильный телефон",
                price: 43999,
                image: "phone"
            ),
            .init(
                productTypeId: ProductType.hammer.rawValue,
                title: "Молоток",
                price: 399,
                image: "hammer"
            )
        ]
        completion(products)
    }
}

private enum ProductType: String {
    case kettle
    case phone
    case hammer
}

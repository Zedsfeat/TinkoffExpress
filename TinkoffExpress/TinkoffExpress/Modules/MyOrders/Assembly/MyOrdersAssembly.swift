//
//  MyOrdersAssembly.swift
//  TinkoffExpress
//
//  Created by zedsbook on 23.04.2023.
//

import UIKit

protocol IMyOrdersAssembly {
    func createMyOrdersView() -> UIViewController
}

final class MyOrdersAssembly: IMyOrdersAssembly {
    func createMyOrdersView() -> UIViewController {
        let network = TEApiService()
        let restService = RestMyOrdersService(networkService: network)
        let router = MyOrdersRouter(orderCheckoutAssembly: OrderCheckoutAssembly())
        let presenter = MyOrdersPresenter(
            router: router,
            service: restService
        )
        let viewController = MyOrdersViewController(myOrdersPresenter: presenter)
        presenter.view = viewController
        router.transitionHandler = viewController
        return viewController
    }
}

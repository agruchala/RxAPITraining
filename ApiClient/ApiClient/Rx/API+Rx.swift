//
//  API+Rx.swift
//  ApiClient
//
//  Created by Artur Gruchała on 18/01/2022.
//

import RxSwift
import SampleApi

extension ImageApi: ReactiveCompatible { }

// 1
extension Reactive where Base: ImageApi {
    // 2
    var getImages: Single<[Image]> {
        // 3
        Single.create { single in
            // 4
            base.getImages { images, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                guard let images = images else {
                    single(.failure(APIError.noData))
                    return
                }
                single(.success(images))
            }
            // 5
            return Disposables.create { }
        }
    }
}

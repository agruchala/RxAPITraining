//
//  API+Rx.swift
//  ApiClient
//
//  Created by Artur Gruchała on 18/01/2022.
//

import RxSwift
import SampleApi

extension ImageApi: ReactiveCompatible { }

extension Reactive where Base: ImageApi {
    var getImages: Single<[Image]> {
        Single.create { single in
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
            return Disposables.create()
        }
    }
}

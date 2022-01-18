//
//  CollectionViewCell.swift
//  ApiClient
//
//  Created by Artur Gruchała on 18/01/2022.
//

import UIKit
import SampleApi

class CollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    private var task: URLSessionDataTask?
    
    var image: Image! {
        didSet {
            task = URLSession.shared.dataTask(with: image.url, completionHandler: { [weak self] data, _, _ in
                guard let data = data,
                      let img = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = img
                }
            })
            task?.resume()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        imageView.backgroundColor = .gray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

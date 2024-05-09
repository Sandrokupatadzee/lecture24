//
//  UIImageViewExtension.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import UIKit

extension UIImageView {
    func fetchImage(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _ , _ in
            guard let data = data, let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}

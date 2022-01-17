//
//  ViewController.swift
//  ApiClient
//
//  Created by Artur Gruchała on 17/01/2022.
//

import UIKit
import SampleApi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageApi().getImages { images, error in
            // TODO: Implement
            print(images)
        }
    }


}


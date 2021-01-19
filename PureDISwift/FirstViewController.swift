//
//  FirstViewController.swift
//  PureDISwift
//
//  Created by 신동규 on 2021/01/19.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: Properties
    

    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    
    // MARK: Helpers
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    

}

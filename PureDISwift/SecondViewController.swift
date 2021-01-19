//
//  SecondViewController.swift
//  PureDISwift
//
//  Created by 신동규 on 2021/01/19.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: Properties
    private let stringGenerator:StringGenerator = StringGenerator()
    
    private lazy var stringLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        drawView()
    }
    
    // MARK: Helpers
    func drawView() {
        self.stringLabel.text = stringGenerator.generate()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stringLabel)
        stringLabel.translatesAutoresizingMaskIntoConstraints = false
        stringLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stringLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }

}

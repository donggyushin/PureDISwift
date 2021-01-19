//
//  FirstViewController.swift
//  PureDISwift
//
//  Created by 신동규 on 2021/01/19.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: Properties
    
    private let stringGenerator:StringGeneratorProtocol
    private let secondViewDependency: SecondViewController.Dependency
    
    private lazy var stringLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var redirectButton:UIButton = {
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.setTitle("두번째 뷰", for: UIControl.State.normal)
        bt.addTarget(self, action: #selector(redirectButtonTapped), for: UIControl.Event.touchUpInside)
        return bt
    }()

    // MARK: Lifecycles
    init(generator:StringGeneratorProtocol, secondViewDependency: SecondViewController.Dependency) {
        self.stringGenerator = generator
        self.secondViewDependency = secondViewDependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        view.addSubview(redirectButton)
        redirectButton.translatesAutoresizingMaskIntoConstraints = false
        redirectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redirectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    func presentSecondViewController() {
        
        let secondView = SecondViewController(generator: secondViewDependency.generator())
        self.present(secondView, animated: true, completion: nil)
    }
    
    // MARK: Selectors
    @objc func redirectButtonTapped() {
        presentSecondViewController()
    }

}

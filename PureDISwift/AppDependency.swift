//
//  AppDependency.swift
//  PureDISwift
//
//  Created by 신동규 on 2021/01/19.
//

struct AppDependency {
    let firstViewControllerDependency: FirstViewController.Dependency
    
    static func resolve() -> AppDependency {
        // 두번째 뷰컨트롤러의 의존성
        let secondViewDependency: SecondViewController.Dependency = .init(generator: { StringGenerator() })
        // 첫번째 뷰컨트롤러의 의존성
        let firstViewDependency: FirstViewController.Dependency = .init(generator: { StringGenerator2(text: "Donggyu") }, secondViewControllerDependency: secondViewDependency)
        
        return AppDependency(firstViewControllerDependency: firstViewDependency)
    }
}

// 첫번째 뷰컨트롤러의 의존성
extension FirstViewController {
    struct Dependency {
        // 클로저를 사용해 게으른 생성이 가능합니다
        // 게으른 생성이 필수는 아닙니다. 바로 주입해도 됩니다.
        let generator:() -> StringGeneratorProtocol
        
        // 첫번째 뷰컨에서 두번째 뷰컨트오 바로 이어지기 때문에 두번째 뷰컨의 의존성도 같이 넣어줍니다.
        let secondViewControllerDependency: SecondViewController.Dependency
    }
}
// 두번째 뷰컨트롤러의 의존성
extension SecondViewController {
    struct Dependency {
        let generator:() -> StringGeneratorProtocol
    }
}

//
//  Driver+BindLabel.swift
//  MovieDB
//
//  Created by Michael Conchado on 20/12/22.
//

import RxSwift
import RxCocoa

extension Driver where Element == Driver<String> {
    static func bindLabel(_ text: BehaviorRelay<String>, label: UILabel, disposeBag: DisposeBag) {
        text.asDriver().drive(label.rx.text).disposed(by: disposeBag)
    }
}

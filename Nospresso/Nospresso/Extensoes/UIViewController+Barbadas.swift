//
//  UIViewController+Barbadas.swift
//  Nospresso
//
//  Created by Camille Grings on 17/10/20.
//

import UIKit

extension UIViewController {
    func removerTextoBotaoVoltar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

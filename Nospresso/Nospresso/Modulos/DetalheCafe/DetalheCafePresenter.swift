//
//  DetalheCafePresenter.swift
//  Nospresso
//
//  Created by Camille Grings on 20/10/20.
//

import UIKit

class DetalheCafePresenter {
    var view: DetalheCafeViewType?
    var cafe: Cafe?
    let api = Api()
}

extension DetalheCafePresenter: DetalheCafePresenterType {
    func telaCarregou() {
        guard let cafe = cafe else { return }
        
        view?.exibirTitulo(titulo: cafe.nome)
        
        api.requisitar(
            endpoint: .cafe(id: cafe.id),
            sucesso: { (cafe: Cafe) in
                self.view?.exibirDados(do: cafe)
            },
            falha: { _ in })
    }
}


extension DetalheCafePresenter {
    class func criarModulo(passando cafe: Cafe) -> UIViewController {
//        let controller = UIStoryboard(name: "Name", bundle: .main).instantiateViewController(identifier: "DetalheCafeViewController") as? DetalheCafeViewController
        
        let controller = R.storyboard.main.detalheCafeViewController()!
        let presenter = DetalheCafePresenter()
        
        controller.presenter = presenter
        presenter.view = controller
        
        return controller
    }
}

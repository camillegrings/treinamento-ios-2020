//
//  DetalheCafe+Protocolos.swift
//  Nospresso
//
//  Created by Camille Grings on 20/10/20.
//

import Foundation

protocol DetalheCafeViewType {
    func exibirTitulo(titulo: String)
    func exibirDados(do cafe: Cafe)
}

protocol DetalheCafePresenterType {
    func telaCarregou()
}

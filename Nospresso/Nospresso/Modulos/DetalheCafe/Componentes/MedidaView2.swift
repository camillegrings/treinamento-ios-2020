//
//  MedidaView.swift
//  Nospresso
//
//  Created by Camille Grings on 22/10/20.
//

import UIKit

class MedidaView: UIView {
    
    class func doNib() -> MedidaView {
        R.nib.medidaView.firstView(owner: nil)!
    }
    
    @IBOutlet weak var canequinhaImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    func configurar(com medida: Cafe.Medida) {
        canequinhaImageView.image = medida.imagem
        nomeLabel.text = medida.rawValue
    }
}

extension Cafe.Medida {
    var imagem: UIImage? {
        switch self {
        case .ristretto:
            return Imagens.ic_ristretto()
        case .espresso:
            return Imagens.ic_espresso()
        case .lungo:
            return Imagens.ic_lungo()
    }
}
}

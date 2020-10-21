//
//  CategoriaDeCafeHeaderView.swift
//  Nospresso
//
//  Created by Camille Grings on 17/10/20.
//

import UIKit

class CategoriaDeCafeHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    func configurar(para categoria: CategoriaCafe) {
        tituloLabel.text =  categoria.categoria
    }

}

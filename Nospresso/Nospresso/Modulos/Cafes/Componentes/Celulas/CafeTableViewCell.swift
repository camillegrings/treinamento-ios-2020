//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeDescricaoLabel: UILabel!
    @IBOutlet weak var cafeIntensidadeLabel: UILabel!
    @IBOutlet weak var cafePrecoLabel: UILabel!
    
    func configurar(com cafe: Cafe) {
        cafeImageView.carregarImagem(usando: cafe.imagem)
        cafeNameLabel.text = cafe.nome
        cafeDescricaoLabel.text = cafe.descricao.capitalized
        cafeIntensidadeLabel.text = "Intensidade \(cafe.intensidade ?? 0)"
        cafePrecoLabel.text = cafe.precoUnitario.comoDinheiro
    }
}

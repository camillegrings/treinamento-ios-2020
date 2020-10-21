//
//  DetalheCafeViewController.swift
//  Nospresso
//
//  Created by Camille Grings on 20/10/20.
//

import UIKit

class DetalheCafeViewController: UIViewController {
    var presenter: DetalheCafePresenterType?

    @IBOutlet weak var cafeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.telaCarregou()
        // Do any additional setup after loading the view.
    }

}

extension DetalheCafeViewController: DetalheCafeViewType {
    func exibirTitulo(titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
        }
    }
}

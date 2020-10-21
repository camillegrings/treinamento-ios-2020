import UIKit

enum Endpoint {
    case maquinas
    case acessorios
    case capsulas
    case cafe(id: Int)
    
    var url: String {
        switch self {
        case .cafe(let id):
            return "cafes/\(id)"
        default:
            return "\(self)"
        }
    }
}

typealias ResultadoSucesso<T: Decodable> = (T) -> Void
typealias ResultadoFalha = (String) -> Void


class Api {
    let urlBase: String = "http://localhost:3000"
    
    func requisitar<T: Decodable>(endpoint: Endpoint, sucesso: @escaping ResultadoSucesso<T>, falha: @escaping ResultadoFalha) {
        let urlCompleta = "\(urlBase)/\(endpoint.url)"
        
        guard let url = URL(string: urlCompleta) else { return }
        

        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
            guard erro == nil else {
                // TODO: validar erro
                return
            }
            
            guard let dados = dados else {
                // TODO: validar dados inválidos
                return
            }
            
            let decodificador = JSONDecoder()
            
            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                // TODO: tratar erro
                print(error)
            }
        }.resume()
    }
}

let api = Api()

//api.requisitar(
//    endpoint: .maquinas,
//    sucesso: { (dados: ListaDeMaquinas) in
//    print(dados)
//    },
//    falha: { erro in }
//)
//
//api.requisitar(
//    endpoint: .capsulas,
//    sucesso: { (dados: [Capsula]) in
//    print(dados)
//    },
//    falha: { erro in }
//)

api.requisitar(
    endpoint: .acessorios,
    sucesso: { (dados: [Acessorio]) in
    print(dados)
    },
    falha: { erro in }
)

import Foundation

public struct Maquina: Decodable, CustomStringConvertible {
    public var description: String {nome}
    
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String
}

public typealias ListaDeMaquinas = [Maquina]

enum MedidaCafe: String, Decodable {
    case ristretto,
         lungo,
         espresso
}

public struct Capsula: Decodable {
    let categoria: String
    let cafes: [Cafe]
    
}

public struct Cafe: Decodable {
    let id: Int
    let nome: String
    let precoUnitario: Double
    let descricao: String
    let imagem: String
    let medidas: [MedidaCafe]
}

public struct AcessorioItem: Decodable {
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String?
    let imagem: String
}

public struct Acessorio: Decodable {
    let categoria: String
    let itens: [AcessorioItem]
}



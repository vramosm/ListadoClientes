//
//  Cliente.swift
//  ListadoClientes
//
//  Created by Víctor Ramos on 5/8/23.
//

import Foundation
struct Cliente: Identifiable {
    let id: UUID
    let codigo: String
    let nombre: String
    let telefono: String
    let email: String
    var visitado: Bool
}

func datosDeEjemplo() -> [Cliente] {
    return [
        Cliente(id: UUID(), codigo: "001", nombre: "Juan Pérez", telefono: "111-111-1111", email: "juan@example.com", visitado: true),
        Cliente(id: UUID(), codigo: "002", nombre: "María Gómez", telefono: "222-222-2222", email: "maria@example.com", visitado: false),
        Cliente(id: UUID(), codigo: "003", nombre: "Carlos López", telefono: "333-333-3333", email: "carlos@example.com", visitado: true),
        Cliente(id: UUID(), codigo: "004", nombre: "Laura Martínez", telefono: "444-444-4444", email: "laura@example.com", visitado: false),
    ]
}

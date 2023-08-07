//
//  ClienteListView.swift
//  ListadoClientes
//
//  Created by Víctor Ramos on 5/8/23.
//

import SwiftUI

struct ClienteListView: View {
    @State private var visitadosSeleccionados = false
    @State private var noVisitadosSeleccionados = false
    @State private var ordenarPorCodigo = false
    @State private var ordenarPorNombre = false

    private var clientesFiltrados: [Cliente] {
        var clientes = datosDeEjemplo() 
        
        if visitadosSeleccionados && !noVisitadosSeleccionados {
            clientes = clientes.filter { $0.visitado }
        } else if noVisitadosSeleccionados && !visitadosSeleccionados {
            clientes = clientes.filter { !$0.visitado }
        }

        if ordenarPorCodigo {
            clientes = clientes.sorted { $0.codigo < $1.codigo }
        } else if ordenarPorNombre {
            clientes = clientes.sorted { $0.nombre < $1.nombre }
        }
        
        return clientes
    }

    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        Toggle("Visitados", isOn: $visitadosSeleccionados)
                        Toggle("No visitados", isOn: $noVisitadosSeleccionados)
                    }
                    .padding()

                    HStack {
                        Button("Ordenar por Código") {
                            ordenarPorCodigo = true
                            ordenarPorNombre = false
                        }
                        Button("Ordenar por Nombre") {
                            ordenarPorCodigo = false
                            ordenarPorNombre = true
                        }
                    }
                    .padding()

                    List(clientesFiltrados) { cliente in
                        VStack(alignment: .leading) {
                            Text("Código: \(cliente.codigo)")
                            Text("Nombre: \(cliente.nombre)")
                            ZStack {
                                Text("Teléfono: \(cliente.telefono)")
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        realizarLlamada(telefono: cliente.telefono)
                                    }
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            Text("Email: \(cliente.email)")
                            Text("Visitado: \(cliente.visitado ? "Sí" : "No")")
                        }
                    }
                }
                .navigationBarTitle("Listado de clientes")
            }
        }

    private func realizarLlamada(telefono: String) {
        if let phoneNumberURL = URL(string: "tel://\(telefono)"), UIApplication.shared.canOpenURL(phoneNumberURL) {
            UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
        } else {
            print("No se puede realizar la llamada desde este dispositivo.")
        }
    }
}

struct ClienteListView_Previews: PreviewProvider {
    static var previews: some View {
        ClienteListView()
    }
}

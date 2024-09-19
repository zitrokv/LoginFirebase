//
//  Usuario.swift
//  LoginFirebase
//
//  Created by Mañanas on 19/9/24.
//

import Foundation

struct Usuario: Codable {
    let idUsu: String
    let aliasUsu: String
    let datosPersonales: DatosPersonales
    let realizaAcciones: [Accion]
    let tiempoEmpleado: Float
}

struct Accion : Codable {
    let idAccion: Int
    let verboAccion: String
    let descAccion: String
    let image: Image
    let tiempoAccion: Float
}

struct DatosPersonales: Codable {
    let nombre: String
    let edad: Int
    let profesion: String
}

struct Image: Codable {
    let url: String

}

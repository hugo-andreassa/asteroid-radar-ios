//
//  Asteroid.swift
//  NeoWs
//
//  Created by Hugo Andreassa Amaral (P) on 01/04/22.
//

import Foundation

struct Asteroid {
    let id: Int
    let codename: String // Nome
    let closeApproachDate: String // Data de aproximação da terra
    let absoluteMagnitude: Double // Magnetude absoluta
    let estimatedDiameter: Double // Diametro estimado
    let relativeVelocity: Double // Velocidade Relativa
    let distanceFromEarth: Double // Distancia da terra
    let isPotentiallyHazardous: Bool // Se é potencialmente perigoso
}

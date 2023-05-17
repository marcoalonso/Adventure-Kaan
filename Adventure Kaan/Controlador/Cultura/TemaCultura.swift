//
//  TemaCultura.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

struct TemaCultura {
    let nombre: String
    let imagen: UIImage
    let texto: String
}


var temasCultura: [TemaCultura] = [
    TemaCultura(nombre: "Religión", imagen: UIImage(named: "religion")!, texto: "Hacia el año 1500 A.C, aproximadamente, grupos procedentes de la Costa Golfa de México emigraron hacia la región de la actual Guatemala; ahí establecieron y desarrollaron una rica cultura que dio lugar a la civilización maya, llamada 'Del Viejo Imperio'.Este se conformó por una serie de ciudades-estado. Posteriormente, bajo el dominio tolteca, los mayas tuvieron que emigrar pues el suelo estaba agotado por los procedimientos rudimentarios de cultivo.Poco a poco se extendieron y durante la época del Nuevo Imperio llegaron a la actual Península de Yucatán, donde fundaron la ciudad de Chichén Itzá y se aliaron con las ciudades de Uxmal y Mayapán, formando así la Liga de Mayapán o Triple Alianza.Hacia fine del siglo X de nuestra era, un grupo invasor proveniente del norte, los itzaes, se estableció en Chichén Itzá. Este grupo aportó a los mayas ideas religiosas y un espíritu militarista, aunque con el paso del tiempo adoptó la cultura maya.")
]

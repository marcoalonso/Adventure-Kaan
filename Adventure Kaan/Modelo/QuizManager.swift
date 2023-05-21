//
//  QuizManager.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 21/05/23.
//

import Foundation
import UIKit

struct QuizManager {
    let preguntas = [
        Pregunta(texto: "Los mayas desarrollaron un sistema de escritura jeroglífica.", respuesta: "VERDADERO", image: UIImage(named: "escritura")!),
        
        Pregunta(texto: "El calendario maya solo tenía 260 días.", respuesta: "VERDADERO", image: UIImage(named: "calendario")!),
        
        Pregunta(texto: "El juego de pelota maya se jugaba con una pelota de madera.", respuesta: "FALSO", image: UIImage(named: "pelota")!),
        
        Pregunta(texto: "Las pirámides mayas solo servían como tumbas.", respuesta: "FALSO", image: UIImage(named: "tumbas")!),
        
        Pregunta(texto: "Los mayas eran expertos en astronomía y podían predecir eclipses.", respuesta: "VERDADERO", image: UIImage(named: "eclipses")!),
        
        Pregunta(texto: "Los mayas fueron los primeros en cultivar y consumir cacao.", respuesta: "VERDADERO", image: UIImage(named: "cacao")!),
        
        Pregunta(texto: "Los mayas no desarrollaron sistemas de terrazas agrícolas.", respuesta: "FALSO", image: UIImage(named: "agricola")!),
        
        Pregunta(texto: "El Popol Vuh es un texto maya que narra la historia de los dioses aztecas.", respuesta: "FALSO", image: UIImage(named: "dios")!),
        
        Pregunta(texto: "Se conoce la razón exacta del colapso de la civilización maya.", respuesta: "FALSO", image: UIImage(named: "colapso")!),
        
        Pregunta(texto: "Los mayas no tuvieron contacto con otras civilizaciones mesoamericanas.", respuesta: "FALSO", image: UIImage(named: "mesoamericanas")!),

        
        
    ]
    
    var numeroPregunta = 0
    
    
    mutating func revisarRespuesta(respuestaUsuario: String) -> Bool {
        /// Si la respuesta del usuario es igual a la propiedad respuesta de la pregunta en la pocision "n" de mi listado de preguntas
        if respuestaUsuario == preguntas[numeroPregunta].respuesta {
            return true
        } else {
            return false
        }
    }
    
    
    func obtenerTextoPregunta() -> String {
        return preguntas[numeroPregunta].texto
    }
    
    
    func obtenerProgreso() -> Float {
        let progreso = Float(numeroPregunta + 1) / Float(preguntas.count)
        return progreso
    }
    
    
    func obtenerImagen() -> UIImage {
        return preguntas[numeroPregunta].image
    }

    ///Saber si hay mas pregunta o no.
    mutating func siguientePregunta() -> Bool {
        if numeroPregunta + 1 < preguntas.count {
            numeroPregunta = numeroPregunta + 1
            return true
        } else {
            ///Ya no hay mas preguntas, llegaste a la ultima pregunta
            return false
        }
    }
}

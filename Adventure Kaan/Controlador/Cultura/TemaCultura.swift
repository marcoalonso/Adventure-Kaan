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
    TemaCultura(nombre: "Historia", imagen: UIImage(named: "bg_culture_logo_1")!, texto: "Hacia el año 1500 A.C, aproximadamente, grupos procedentes de la Costa Golfa de México emigraron hacia la región de la actual Guatemala; ahí establecieron y desarrollaron una rica cultura que dio lugar a la civilización maya, llamada 'Del Viejo Imperio'.Este se conformó por una serie de ciudades-estado. Posteriormente, bajo el dominio tolteca, los mayas tuvieron que emigrar pues el suelo estaba agotado por los procedimientos rudimentarios de cultivo.Poco a poco se extendieron y durante la época del Nuevo Imperio llegaron a la actual Península de Yucatán, donde fundaron la ciudad de Chichén Itzá y se aliaron con las ciudades de Uxmal y Mayapán, formando así la Liga de Mayapán o Triple Alianza.Hacia fine del siglo X de nuestra era, un grupo invasor proveniente del norte, los itzaes, se estableció en Chichén Itzá. Este grupo aportó a los mayas ideas religiosas y un espíritu militarista, aunque con el paso del tiempo adoptó la cultura maya."),
    
    TemaCultura(nombre: "Religión", imagen: UIImage(named: "bg_culture_logo_2")!, texto: "Los mayas rendían culto a sus muertos; la gente pobre era enterrada bajo su casa, mientras que los nobles eran incinerados y sus cenizas se guardaban en vasijas que se enterraban en los templos.Sus dioses más importantes fueron Kukulkán, o serpiente emplumada, dios de la civilización; Ah Puch, señor de la muerte; Cac, dios del agua y de la lluvia; Yumkax, dios del maíz; Ixchel, diosa de la Luna, del embarazo y de las inundaciones.Además habían otros dioses menores, como los patrones de los días y de los meses. El juego de pelota, o tlachtli, era también un ritual religioso, Se practicaba en un campo rectangular en el que participaban dos equipos, cada uno con siete jugadores; consistía en introducir una pelota de goma maciza en un anillo incrustado en la pared; los jugadores podían utilizarse únicamente los hombros, las caderas o las rodillas, nunca las manos."),
    
    TemaCultura(nombre: "Arte", imagen: UIImage(named: "bg_culture_logo_3")!, texto: "La civilización maya existió por más de 1500 años.Durante ese tiempo, los mayas crearon muchas obras de arte.El arte de los mayas estuvo muy influenciado por su religión y por otras culturas como los olmecas y los toltecas.La escultura entre los mayas es un arte subordinado a la arquitectura.La decoración de varios edificios consiste principalmente en los bajorrelieves que cubren sus paredes, ejecutados unas veces en una piedra caliza blanda, muy abundante en Yucatán, y otras de árbol, que le daban tal resistencia que ha durado hasta nuestros días."),
    
    TemaCultura(nombre: "Agricultura", imagen: UIImage(named: "bg_culture_logo_4")!, texto: "Los mayas rendían culto a sus muertos; la gente pobre era enterrada bajo su casa, mientras que los nobles eran incinerados y sus cenizas se guardaban en vasijas que se enterraban en los templos.Sus dioses más importantes fueron Kukulkán, o serpiente emplumada, dios de la civilización; Ah Puch, señor de la muerte; Cac, dios del agua y de la lluvia; Yumkax, dios del maíz; Ixchel, diosa de la Luna, del embarazo y de las inundaciones.Además habían otros dioses menores, como los patrones de los días y de los meses. El juego de pelota, o tlachtli, era también un ritual religioso, Se practicaba en un campo rectangular en el que participaban dos equipos, cada uno con siete jugadores; consistía en introducir una pelota de goma maciza en un anillo incrustado en la pared; los jugadores podían utilizarse únicamente los hombros, las caderas o las rodillas, nunca las manos."),
    
    TemaCultura(nombre: "Astronomía", imagen: UIImage(named: "bg_culture_logo_5")!, texto: "Los Mayas tenían su propio calendario solar y conocían la periodicidad de los eclipses.Inscribieron en monumentos de piedra fórmulas para predecir eclipses solares y la salida heliaca de Venus.Su Cosmología se basaba en La Vía Láctea, a la que llamaban Wakah Chan y relacionaban con Xibalbá, el camino al inframundo.Tenían un Zodiaco, basado en la Eclíptica. Sólo los sacerdotes tenían acceso al conocimiento astronómico, pero la gente los respetaba y organizaba su vida de acuerdo a sus predicciones.Los estudios sobre los astros que realizaron los mayas siguen sorprendiendo a los científicos. Su obsesión por el movimiento de los cuerpos celestes se basaba en la concepción cíclica de la historia, y la astronomía fue la herramienta que utilizaron para conocer la influencia de los astros sobre el mundo."),
    
    TemaCultura(nombre: "Calendario", imagen: UIImage(named: "bg_culture_logo_6")!, texto: "El calendario sagrado o ritual (Tzolkin) de 260 días y el calendario solar (Haab) de 365 días, que se combinan entre sí para formar un ciclo de 52 años llamado la Cuenta larga o rueda Calendárica.Esta cuenta larga registra los días desde una fecha “era”, que los mayas establecieron el día 4 ahaw del mes 8 cumkú, y que en su sistema de notación corresponde a 13.0.0.0.0 que equivale, según la correlación generalmente aceptada, al 13 de agosto del año 3114 antes de Cristo.Es día se completó un ciclo de 5,125 años anterior al que estamos viviendo en la actualidad."),
]

//
//  ValorTamano.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit

class Valor: NSObject {

    var valorTamano:String=""
    var valorMasa:String=""
    var valorQueso:String=""
    var valorIngredientes:String=""
    
    init(tamano:String) {
        valorTamano=tamano
    }
    
    init(tamano:String,masa:String) {
        valorTamano=tamano
        valorMasa=masa
    }
    
    init(tamano:String, masa:String, queso:String) {
        valorTamano=tamano
        valorMasa=masa
        valorQueso=queso
    }
    
    init(tamano:String, masa:String, queso:String, ingredientes:String) {
        valorTamano=tamano
        valorMasa=masa
        valorQueso=queso
        valorIngredientes=ingredientes
    }
}

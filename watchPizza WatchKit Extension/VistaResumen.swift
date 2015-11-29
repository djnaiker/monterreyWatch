//
//  VistaResumen.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit
import Foundation


class VistaResumen: WKInterfaceController {

    @IBOutlet var varTamano: WKInterfaceLabel!
    
    @IBOutlet var varMasa: WKInterfaceLabel!
    
    @IBOutlet var varQueso: WKInterfaceLabel!
    
    @IBOutlet var varIngredientes: WKInterfaceLabel!
    
    @IBAction func confirmar() {
        
        
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        varTamano.setText(c.valorTamano)
        varMasa.setText(c.valorMasa)
        varQueso.setText(c.valorQueso)
        varIngredientes.setText(c.valorIngredientes)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

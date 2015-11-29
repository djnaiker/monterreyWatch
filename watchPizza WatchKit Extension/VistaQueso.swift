//
//  VistaQueso.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit
import Foundation


class VistaQueso: WKInterfaceController {
    
    var queso = ["Mozzarela","Parmesano","Cheddar", "Sin Queso"]
    var seleccion=""
    var tamano=""
    var masa=""

    @IBOutlet var pickerQueso: WKInterfacePicker!
    
    @IBAction func selectQueso(value: Int) {
        seleccion=queso[value]
    }
    
    @IBAction func continuarQueso() {
        let valorContexto=Valor(tamano: tamano, masa: masa, queso: seleccion)
        
        pushControllerWithName("idIngredientes", context:valorContexto)
        print(tamano)
        print(masa)
        print(seleccion)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        seleccion=queso[0]
        
        let c = context as! Valor
        tamano=c.valorTamano
        masa = c.valorMasa
        
        var itemArr = [WKPickerItem]()
        
        for n in 0...3 {
            let k = WKPickerItem()
            k.title = String(queso[n])
            itemArr.append(k)
        }
        
        pickerQueso?.setItems(itemArr)
        
        pickerQueso?.setEnabled(true)
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

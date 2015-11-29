//
//  VistaTamano.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit
import Foundation


class VistaTamano: WKInterfaceController {
    var tamano = ["Pequeña","Mediana","Familiar"]
    var seleccion:String=""

    @IBOutlet var pickerTamano: WKInterfacePicker!
    
    @IBAction func pickerSelect(value: Int) {
        seleccion=tamano[value]
    }
    
    @IBAction func continuarTamano() {
        let valorTamano=Valor(tamano: seleccion)
        pushControllerWithName("idMasa", context:valorTamano )
        
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        seleccion=tamano[0]
        
        var itemArr = [WKPickerItem]()
        
        for n in 0...2 {
            let k = WKPickerItem()
            k.title = String(tamano[n])
            itemArr.append(k)
        }

        pickerTamano?.setItems(itemArr)
        
        pickerTamano?.setEnabled(true)
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

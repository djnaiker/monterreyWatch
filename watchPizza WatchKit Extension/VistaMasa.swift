//
//  VistaMasa.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit
import Foundation


class VistaMasa: WKInterfaceController {
    
    var masa = ["Delgada","Crujiente","Gruesa"]
    var tamano:String=""
    var seleccionMasa:String=""

    @IBAction func continuarMasa() {
        let valorContexto=Valor(tamano: tamano, masa: seleccionMasa)
        
        pushControllerWithName("idQueso", context:valorContexto)
        print(tamano)
        print(seleccionMasa)
        
    }
    
    @IBAction func selectMasa(value: Int) {
        seleccionMasa=masa[value]
    }
    
    
    @IBOutlet var pickerMasa: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        seleccionMasa=masa[0]
        let c = context as! Valor
        tamano=c.valorTamano
        
        var itemArr = [WKPickerItem]()
        
        for n in 0...2 {
            let k = WKPickerItem()
            k.title = String(masa[n])
            itemArr.append(k)
        }
        
        pickerMasa?.setItems(itemArr)
        
        pickerMasa?.setEnabled(true)
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

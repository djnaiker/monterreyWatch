//
//  VistaIngredientes.swift
//  watchPizza
//
//  Created by David Perez Conde on 28/11/15.
//  Copyright © 2015 David Perez Conde. All rights reserved.
//

import WatchKit
import Foundation


class VistaIngredientes: WKInterfaceController {
    var contadorIngredientes=0
    
    var ingredientes=""
    var queso=""
    var masa=""
    var tamano=""
    
    @IBOutlet var varJamon: WKInterfaceSwitch!
    @IBOutlet var varPepperoni: WKInterfaceSwitch!
    @IBOutlet var varPavo: WKInterfaceSwitch!
    @IBOutlet var varSanchicha: WKInterfaceSwitch!
    @IBOutlet var varAceituna: WKInterfaceSwitch!
    @IBOutlet var varCebolla: WKInterfaceSwitch!
    @IBOutlet var varPimiento: WKInterfaceSwitch!
    @IBOutlet var varPina: WKInterfaceSwitch!
    @IBOutlet var varAnchoa: WKInterfaceSwitch!
    
    var jamonStatus:Bool=false
    var pepperoniStatus:Bool=false
    var pavoStatus:Bool=false
    var salchicaStatus:Bool=false
    var aceitunaStatus:Bool=false
    var cebollaStatus:Bool=false
    var pimientoStatus:Bool=false
    var pinaStatus:Bool=false
    var anchoaStatus:Bool=false
    
    @IBAction func jamon(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
             jamonStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                 jamonStatus=false
                varJamon.setOn(false)
            }
        }else{
             contadorIngredientes=contadorIngredientes-1
             jamonStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func pepperoni(value: Bool) {
        if(checkNumMax() && value==true){
            contadorIngredientes=contadorIngredientes+1
            pepperoniStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                varPepperoni.setOn(false)
                pepperoniStatus=false
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            pepperoniStatus=false
            checkNumMax()
        }
    }

    @IBAction func pavo(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            pavoStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                pavoStatus=false
                varPavo.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            pavoStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func salchicha(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            salchicaStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                salchicaStatus=false
                varSanchicha.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            salchicaStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func aceituna(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            aceitunaStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                aceitunaStatus=false
                varAceituna.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            aceitunaStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func cebolla(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            cebollaStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                cebollaStatus=false
                varCebolla.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            cebollaStatus=false
            checkNumMax()
        }
    }

    @IBAction func pimiento(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            pimientoStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                pimientoStatus=false
                varPimiento.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            pimientoStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func pina(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            pinaStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                pinaStatus=false
                varPina.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            pinaStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func anchoa(value: Bool) {
        if(value==true){
            contadorIngredientes=contadorIngredientes+1
            anchoaStatus=true
            if(!checkNumMax()){
                contadorIngredientes=contadorIngredientes-1
                anchoaStatus=false
                varAnchoa.setOn(false)
            }
        }else{
            contadorIngredientes=contadorIngredientes-1
            anchoaStatus=false
            checkNumMax()
        }
    }
    
    @IBAction func continuar() {
        ingredientes=""
        getStringIngredientes()
        
        let valorContexto=Valor(tamano: tamano, masa: masa, queso:queso, ingredientes: ingredientes)
        
        pushControllerWithName("idResumen", context:valorContexto)
        print(tamano)
        print(masa)
        print(queso)
        print(ingredientes)
    }
    
    @IBOutlet var botonContinuar: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        varJamon.setOn(false)
        varPepperoni.setOn(false)
        varPavo.setOn(false)
        varSanchicha.setOn(false)
        varAceituna.setOn(false)
        varCebolla.setOn(false)
        varPimiento.setOn(false)
        varPina.setOn(false)
        varAnchoa.setOn(false)
        botonContinuar.setEnabled(false)
        
        let c = context as! Valor
        tamano=c.valorTamano
        masa = c.valorMasa
        queso = c.valorQueso
           
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func checkNumMax()->Bool{
        if(contadorIngredientes==0){
            botonContinuar.setEnabled(false)
        }else{
            botonContinuar.setEnabled(true)
        }
        return contadorIngredientes<6
    }
    
    func getStringIngredientes(){
        if(jamonStatus){
            ingredientes=ingredientes+"Jamon "
        }
        if(pepperoniStatus){
            ingredientes=ingredientes+"Pepperoni "
        }
        if(pavoStatus){
            ingredientes=ingredientes+"Pavo "
        }
        if(salchicaStatus){
            ingredientes=ingredientes+"Salchichas "
        }
        if(aceitunaStatus){
            ingredientes=ingredientes+"Aceitunas "
        }
        if(cebollaStatus){
            ingredientes=ingredientes+"Cebolla "
        }
        if(pimientoStatus){
            ingredientes=ingredientes+"Pimiento "
        }
        if(pinaStatus){
            ingredientes=ingredientes+"Piña "
        }
        if(anchoaStatus){
            ingredientes=ingredientes+"Anchoa "
        }
    }

}

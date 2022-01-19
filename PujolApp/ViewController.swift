//
//  ViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    var menuOption : RestaurantOptionView?
    var inventarioOption : RestaurantOptionView?
    var pedidoOption : RestaurantOptionView?
    
    // los valores de colores deben ir de 0 a 1, dividiendo los colores entre 255
    var backgroundColor = UIColor(displayP3Red: 0.60, green: 0.80, blue: 0.60, alpha: 1)
    
    // toma el ancho de toda la pantalla
    var width = UIScreen.main.bounds.width
    
    //lo que se va a mostrar en la pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = backgroundColor
        initUI()
    }
    
    func initUI(){

        menuOption = RestaurantOptionView(iconName: "menu", titleString: "Menu Pujol", frame: CGRect(x: 20, y: 100, width: width - 40, height: 50))
        view.addSubview(menuOption!)
        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(goToMenu))
        menuOption?.addGestureRecognizer(tapMenu)
        
        //frame nos permite localizar en forma de cordenadas y dar ancho y largo que se va mostrar en la vista
        inventarioOption = RestaurantOptionView(iconName: "inventario", titleString: "Inventario", frame:CGRect(x: 20, y: 200, width: width - 40, height: 50))
        view.addSubview(inventarioOption!)
        let tapInventario = UITapGestureRecognizer(target: self, action: #selector(goToInventario))
        inventarioOption?.addGestureRecognizer(tapInventario)
        
        pedidoOption = RestaurantOptionView(iconName: "pedido", titleString: "Hacer un pedido", frame: CGRect(x: 20, y: 300, width: width - 40, height: 50))
        view.addSubview(pedidoOption!)
        
        //UITapGestureRecognizer -> toma el click en pedidoOption como acción de tap y mostrar la vista
        let tapPedido = UITapGestureRecognizer(target: self, action: #selector(goToPedido))
        // asigna el gesture a una view
        pedidoOption?.addGestureRecognizer(tapPedido)
        
    }
    
    //de manera animada se presenta de abajo para arriba un vista temporal
    @objc func goToMenu(){
        print("Vamos por el menu!")
        
        let menuViewController = MenuViewController() // se inicializa el objeto
        //se pasa el objeto a present donde se presenta el viewController, de manera animada, completion -> ejecuta y se realiza otro proceso
        present(menuViewController, animated: true, completion: nil)
    }
    
    @objc func goToInventario(){
        print("Vamos por el inventario!")
        let inventarioViewController = InventarioViewController()
        present(inventarioViewController, animated: true, completion: nil)
    }
    
    @objc func goToPedido(){
        print("Vamos por el pedido!")
        let pedidoViewControllewr = PedidoViewController()
        present(pedidoViewControllewr, animated: true, completion: nil)
    }



}


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
    var imageMenu: UIImageView?
    
    // los valores de colores deben ir de 0 a 1, dividiendo los colores entre 255
    var backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    
    // toma el ancho de toda la pantalla
    var width = UIScreen.main.bounds.width
    
    //lo que se va a mostrar en la pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = backgroundColor
        initUI()
    }
    
    func initUI(){

        menuOption = RestaurantOptionView(iconName: "menu", titleString: "Menu Pujol")
        //frame: CGRect(x: 20, y: 100, width: width - 40, height: 50)
        view.addSubview(menuOption!)
        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(goToMenu))
        menuOption?.addGestureRecognizer(tapMenu)
        menuOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 130, right: 20, bottom: nil)
        //frame nos permite localizar en forma de cordenadas y dar ancho y largo que se va mostrar en la vista
        inventarioOption = RestaurantOptionView(iconName: "inventario", titleString: "Inventario")
        //frame:CGRect(x: 20, y: 200, width: width - 40, height: 50)
        view.addSubview(inventarioOption!)
        let tapInventario = UITapGestureRecognizer(target: self, action: #selector(goToInventario))
        inventarioOption?.addGestureRecognizer(tapInventario)
        inventarioOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 250, right: 20, bottom: 10, withAnchor: .bottom)
        
        pedidoOption = RestaurantOptionView(iconName: "pedido", titleString: "Hacer un pedido")
        // frame: CGRect(x: 20, y: 300, width: width - 40, height: 50)
        view.addSubview(pedidoOption!)
        
        //UITapGestureRecognizer -> toma el click en pedidoOption como acción de tap y mostrar la vista
        let tapPedido = UITapGestureRecognizer(target: self, action: #selector(goToPedido))
        // asigna el gesture a una view
        pedidoOption?.addGestureRecognizer(tapPedido)
        pedidoOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 370, right: 20, bottom: 10, withAnchor: .bottom)
        
        imageMenu = UIImageView()
        imageMenu?.image = UIImage(named: "comida")
        view.addSubview(imageMenu!)
        imageMenu?.addAnchorsAndSize(width: nil, height: 200, left: 40, top: 500, right: 40, bottom: 10, withAnchor: .bottom)
        
        
        
        
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


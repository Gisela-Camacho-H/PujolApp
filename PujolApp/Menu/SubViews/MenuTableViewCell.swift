//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by GiselaCamacho on 17/01/22.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell{
    
    var ownContent: UIView?
    var nameProduct: UILabel?
    var descriptionProduct: UILabel?
    var priceProduct : UILabel?
    
    var addButton: UIButton?
    var imageProduct : UIImageView?
    
    var producto: Producto?
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    
    init(producto : Producto){
        super.init(style: .default, reuseIdentifier: nil)
        self.producto = producto
        self.backgroundColor = .clear
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/4 - 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        
        nameProduct = UILabel(frame: CGRect(x: 5, y: 10, width: width/2, height: 20))
        nameProduct?.text = producto?.nombre
        nameProduct?.font = .boldSystemFont(ofSize: 18)
        nameProduct?.textAlignment = .left
        ownContent?.addSubview(nameProduct!)
        
        descriptionProduct = UILabel(frame: CGRect(x: 5, y: 35, width: width/2, height: 70))
        descriptionProduct?.text = producto?.descripcion
        descriptionProduct?.numberOfLines = 0
        descriptionProduct?.textAlignment = .left
        descriptionProduct?.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(descriptionProduct!)
        
        priceProduct = UILabel(frame: CGRect(x: 5, y: 100, width: width/2, height: 50))
        priceProduct?.text = "MX$\(String(describing: producto?.precio ?? 0.00))"
        priceProduct?.textAlignment = .left
        priceProduct?.font = .systemFont(ofSize: 18)
        ownContent?.addSubview(priceProduct!)
        
        
        imageProduct = UIImageView(frame: CGRect(x: 230, y: 40 , width: 110, height: 110)) //declaramos imagen
        imageProduct?.image = UIImage(named: producto?.imagen ?? "") //asigna imagen
        imageProduct?.layer.cornerRadius = 10
        imageProduct?.layer.masksToBounds = true
        ownContent?.addSubview(imageProduct!)
        
        addButton = UIButton(frame: CGRect(x: 5, y: 150 , width: width/4 , height: 40))
        addButton?.backgroundColor = .white
        addButton?.layer.borderColor = UIColor.orange.cgColor
        addButton?.layer.borderWidth = 1
        addButton?.layer.cornerRadius = 5
        addButton?.setTitleColor(.orange, for: .normal)
        addButton?.setTitle("Agregar", for: .normal)
        ownContent?.addSubview(addButton!)
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


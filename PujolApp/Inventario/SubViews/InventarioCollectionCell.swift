//
//  InventarioCollectionCell.swift
//  PujolApp
//
//  Created by GiselaCamacho on 24/01/22.
//

import Foundation
import UIKit

class InventarioCollectionCell : UICollectionViewCell{
    
    var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "backB")
        return image
    }()
    
    var nameProduct : UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 10)
        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        let color = UIColor(displayP3Red: .random(in: 0...1), green:.random(in: 0...1) , blue: .random(in: 0...1), alpha: 1)
        self.backgroundColor = color
        
        self.addSubview(imageProduct)
        imageProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 30)
        
        self.addSubview(nameProduct)
        nameProduct.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: imageProduct)
    }
    
    func setData (producto: Producto){
        print(producto.nombre ?? "")
        imageProduct.image = UIImage(named: producto.imagen ?? "")
        nameProduct.text = producto.nombre ?? ""
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}

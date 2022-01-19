//
//  RestaurantOptionView.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import Foundation
import UIKit

class RestaurantOptionView : UIView{  // se crea una clase que hereda de UIView (super clase)
    
    var icon : UIImageView? // imagen
    var titleSection : UILabel? // titulo Label (texto)
    

    init(iconName : String, titleString : String, frame : CGRect){
        //se necesita un super init por que se está heredando de otra clase
        super.init(frame: frame)
        self.backgroundColor = .white
        
        // caracteristicas de ancho de borde, color de borde y redondear las orillas
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 10
        
        icon = UIImageView(frame: CGRect(x: 10, y: 5, width: 40, height: 40))
        icon?.backgroundColor = .yellow
        icon?.image = UIImage(named: iconName)
        icon?.contentMode = .scaleAspectFit
        self.addSubview(icon!)
        
        titleSection = UILabel(frame: CGRect(x: 70, y: 0, width: frame.width - 80, height: 50))
        titleSection?.backgroundColor = .white
        titleSection?.text = titleString
        titleSection?.textAlignment = .center
        titleSection?.font = UIFont(name: "Helvetica Bold", size: 17)
        self.addSubview(titleSection!)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

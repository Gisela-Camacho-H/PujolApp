//
//  DetailProductViewController.swift
//  PujolApp
//
//  Created by GiselaCamacho on 19/01/22.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    var topImageView : UIImageView?
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    var backButton : UIButton?
    var backLabel : UIButton?
    var descriptionView: UIView?
    var descriptionTextView : UILabel?
    var productoCalorias : UILabel?
    var productoPorcion : UILabel?
    var Mproducto: Producto?
    var descriptionLabel : UILabel?
    var imageLine : UIImageView?
    
   init(producto : Producto){
       self.Mproducto = producto
       super.init(nibName: nil, bundle: nil)
        self.backgroundColor = .white
        initUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        initUI()
        
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/4))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
        
        backButton = UIButton(frame: CGRect(x: 20, y: 175, width: 20, height: 20))
        backButton?.setImage(UIImage(named: "backB"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        backLabel = UIButton(frame: CGRect(x: 35, y: 170, width: 100, height: 30))
        backLabel?.setTitle("Regresar", for: .normal)
        backLabel?.setTitleColor(.black, for: .normal)
        backLabel?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backLabel!)
        
        
        createProductView()
        createDescription()
    }
    
    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 20, y: height/4, width: width - 40, height: height/4))
        productContentView?.backgroundColor = .clear
        view.addSubview(productContentView!)
        
        
        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20
        
        productContentView?.addSubview(productCard!)
        
        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
        productImage?.image = UIImage(named: Mproducto?.imagen ?? "")
        
        productContentView?.addSubview(productImage!)
        
        productName = UILabel(frame: CGRect(x: 170, y: height/8 + 5, width: 180, height: 50))
        productName?.text = Mproducto?.nombre
        productName?.font = .boldSystemFont(ofSize: 20)
        
        productContentView?.addSubview(productName!)
        
        productPrice = UILabel(frame: CGRect(x: 170, y: height/8 + 50, width: 160, height: 50))
        productPrice?.text = "MX$\(String(describing: Mproducto?.precio ?? 0.00))"
        productPrice?.font = .boldSystemFont(ofSize: 20)
        
        productContentView?.addSubview(productPrice!)
    }

    func createDescription(){
        descriptionView = UIView()
        descriptionView?.backgroundColor = .white
        
        
        view.addSubview(descriptionView!)
        
        descriptionView?.addAnchorsAndSize(width: nil, height: height/4, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: productContentView)
        descriptionView?.layer.cornerRadius = 20
        descriptionView?.layer.borderColor = UIColor.lightGray.cgColor
        descriptionView?.layer.borderWidth = 2
        
        descriptionLabel = UILabel()
        //UILabel(frame: CGRect(x: 140, y: 440, width: 160, height: 50))
        descriptionLabel?.text = "Descripción"
        descriptionLabel?.font = .boldSystemFont(ofSize: 22)
        descriptionLabel?.textAlignment = .center
        descriptionView?.addSubview(descriptionLabel!)
        descriptionLabel?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 10, right: 10, bottom: nil)
        
        
        descriptionTextView = UILabel()
        //= UILabel(frame: CGRect(x: 40, y: 480, width: width - 80, height: 70))
        descriptionTextView?.text = Mproducto?.descripcion
        descriptionTextView?.numberOfLines = 0
        descriptionTextView?.textAlignment = .center
        descriptionTextView?.font = .boldSystemFont(ofSize: 15)
        descriptionView?.addSubview(descriptionTextView!)
        
        descriptionTextView?.addAnchorsAndSize(width: nil, height: 60, left: 10, top: 0, right: 10, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
        
        
        
        productoCalorias = UILabel()
        //frame: CGRect(x: 60, y: 560, width: 100, height: 50)
        productoCalorias?.text = "calorías:\(String(describing: Mproducto?.calorias ?? 0))"
        productoCalorias?.font = .boldSystemFont(ofSize: 15)
        descriptionView?.addSubview(productoCalorias!)
        productoCalorias?.addAnchorsAndSize(width: width/3, height: 80, left: 40, top: 0, right: 10, bottom: 10, withAnchor: .top, relativeToView: descriptionTextView)
        
        
        
        productoPorcion = UILabel()
        //frame: CGRect(x: 230, y: 560, width: 140, height: 50)
        productoPorcion?.text = "Porción:\(String(describing: Mproducto?.peso ?? 0))"
        productoPorcion?.font = .boldSystemFont(ofSize: 15)
        descriptionView?.addSubview(productoPorcion!)
        
        productoPorcion?.addAnchorsAndSize(width: width/3, height: 80, left: 210, top: 0, right: 10, bottom: 10, withAnchor: .top, relativeToView: descriptionTextView)
        
        
        imageLine = UIImageView(frame: CGRect(x: 185, y: 550, width: 20, height: 90))
        imageLine?.image = UIImage(named: "linea")
        view?.addSubview(imageLine!)

        
        
    }
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

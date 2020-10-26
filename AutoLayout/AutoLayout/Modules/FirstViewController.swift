//
//  ViewController.swift
//  AutoLayout
//
//  Created by Camille Grings on 21/10/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var buttonAddFavorite: UIButton!
    @IBOutlet weak var viewQuantity: UIView!
    @IBOutlet weak var viewSize: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func createLayout() {
        buttonAddFavorite.layer.borderWidth = 1
        buttonAddFavorite.layer.borderColor = UIColor.lightGray.cgColor
        
        viewQuantity.addTopBorderWithColor(color: UIColor.lightGray, width: 0.5)
        viewSize.addTopBorderWithColor(color: UIColor.lightGray, width: 0.5)
        viewQuantity.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        viewSize.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        viewQuantity.addRightBorderWithColor(color: UIColor.lightGray, width: 0.5)
    }


}


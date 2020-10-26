//
//  SecondViewController.swift
//  AutoLayout
//
//  Created by Camille Grings on 24/10/20.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var viewButtonCart: UIView!
    @IBOutlet weak var viewRecipeDetails: UIView!
    @IBOutlet weak var viewStarter: UIView!
    @IBOutlet weak var viewFirstFood: UIView!
    @IBOutlet weak var viewSecondFood: UIView!
    @IBOutlet weak var viewStarPoints: UIView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var viewChangeQuantity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func onCloseButtonPress(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func createLayout() {
        buttonClose.layer.cornerRadius = 20
        viewButtonCart.layer.cornerRadius = 20
        
        viewRecipeDetails.clipsToBounds = true
        viewRecipeDetails.layer.cornerRadius = 20
        viewRecipeDetails.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        
        viewStarter.addBottomBorderWithColor(color: UIColor.red, width: 2)
        
        viewFirstFood.addTopBorderWithColor(color: UIColor.systemGray6, width: 10)
        viewSecondFood.addTopBorderWithColor(color: UIColor.systemGray6, width: 10)
        
        viewStarPoints.layer.cornerRadius = 12
        
        buttonAdd.layer.cornerRadius = 15
        buttonAdd.layer.borderWidth = 1
        buttonAdd.layer.borderColor = UIColor(named: "MoneyGreen")?.cgColor
        
        viewChangeQuantity.layer.borderWidth = 1
        viewChangeQuantity.layer.borderColor = UIColor(named: "MoneyGreen")?.cgColor
        
        
        viewChangeQuantity.clipsToBounds = true
        viewChangeQuantity.layer.cornerRadius = 15
        viewChangeQuantity.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    
}

//
//  GameViewController.swift
//  ARMajic
//
//  Created by Visal Prom on 6/25/18.
//  Copyright © 2018 Visal Prom. All rights reserved.
//

import ARKit
import LBTAComponents
class GameViewController: UIViewController {
    
    let arView: ARSCNView = {
        let view = ARSCNView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var plusButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        return button
    }()
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpViews()
        
        // add configuration to arView
        arView.session.run(configuration, options: []) // left option blank
        // debug option
        arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
    }
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
    func setUpViews(){
        view.addSubview(arView)
        //reduce 4 lines codes
        arView.fillSuperview() // method has ()
        
        view.addSubview(plusButton)
        plusButton.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor , bottom: view.safeAreaLayoutGuide.bottomAnchor, right:nil, topConstant:0, leftConstant: 24 , bottomConstant:12 , rightConstant:0, widthConstant: 60, heightConstant: 60 )
        
        //first method
//        arView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        arView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        arView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        arView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // second method
//        arView.anchor(view.topAnchor, left: view.leftAnchor , bottom: view.bottomAnchor, right:view.rightAnchor, topConstant:0, leftConstant: 0 , bottomConstant:0, rightConstant:0, widthConstant: 0, heightConstant: 0)
    }
    
}

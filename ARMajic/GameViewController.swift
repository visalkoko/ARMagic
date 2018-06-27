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
    var objpizza = SCNNode()
    let arView: ARSCNView = {
        let view = ARSCNView()
        
        // no need this lines as it we used fillSuperView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var plusButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(handlePlusButtonTaped), for: .touchUpInside)
        button.layer.zPosition = 1
        button.imageView?.contentMode = .scaleAspectFill
    
        return button
    }()
    @objc func handlePlusButtonTaped(){
        print("Tapped on plus button")
        addbox()
        
        
    }
    
    var minusButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(handleMinusButtonTaped), for: .touchUpInside)
        button.layer.zPosition = 1
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    @objc func handleMinusButtonTaped(){
        print("Tapped on minus button")
        removeAllBoxes()
        
    }
    
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpViews()
        
        // add configuration to arView
        arView.session.run(configuration, options: []) // left option blank
        // debug option
        arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
//        arView.autoenablesDefaultLighting = true // auto add light to scene to make edges of box
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
        
        view.addSubview(minusButton)
        minusButton.anchor(nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant:0, leftConstant: 0 , bottomConstant:5 , rightConstant:24, widthConstant: 85, heightConstant: 85)
        
        //first method
//        arView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        arView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        arView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        arView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // second method
//        arView.anchor(view.topAnchor, left: view.leftAnchor , bottom: view.bottomAnchor, right:view.rightAnchor, topConstant:0, leftConstant: 0 , bottomConstant:0, rightConstant:0, widthConstant: 0, heightConstant: 0)
    }
    
    func addbox(){
        
        //add box
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0.002) // chamferRadius can extend the edges round
        boxNode.position = SCNVector3(0,0,-0.2) // x,y,z ex: z = -0.3 = 30 centimeters
        boxNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "water") // can add materials or img/ UIColor
        boxNode.name = "box"
        
        arView.scene.rootNode.addChildNode(boxNode)
        
        
        // add pizza
//        objpizza = make2dNode(image:#imageLiteral(resourceName: "pizza"),width: 0.07,height: 0.07)
//        arView.scene.rootNode.addChildNode(objpizza)
        
    }
//    func make2dNode(image: UIImage, width: CGFloat = 0.1, height: CGFloat = 0.1) -> SCNNode {
//        let plane = SCNPlane(width: width, height: height)
//        plane.firstMaterial!.diffuse.contents = image
//        let node = SCNNode(geometry: plane)
//        node.constraints = [SCNBillboardConstraint()]
//        return node
//    }
    func removeAllBoxes(){
        arView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == "box"{
                node.removeFromParentNode()
            }
         
        }
    }
    
}

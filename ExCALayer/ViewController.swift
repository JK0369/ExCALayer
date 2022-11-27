//
//  ViewController.swift
//  ExCALayer
//
//  Created by 김종권 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {
  private let myView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private var circleLayer: CALayer {
    let layer = CAShapeLayer()
    layer.path = UIBezierPath(ovalIn: myView.bounds).cgPath
    return layer
  }
  private var borderLayer: CALayer {
    let layer = CAShapeLayer()
    layer.path = UIBezierPath(
      roundedRect: myView.bounds.insetBy(dx: 5, dy: 5),
      cornerRadius: myView.bounds.height / 2
    ).cgPath
    layer.fillColor = UIColor.clear.cgColor
    layer.strokeColor = UIColor.green.cgColor
    return layer
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(myView)
    
    NSLayoutConstraint.activate([
      myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      myView.widthAnchor.constraint(equalToConstant: 200),
      myView.heightAnchor.constraint(equalToConstant: 200)
    ])
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    myView.layer.mask = circleLayer
  }
}

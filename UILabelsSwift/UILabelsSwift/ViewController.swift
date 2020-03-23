//
//  ViewController.swift
//  UILabelsSwift
//
//  Created by Field Employee on 3/23/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let formatter = DateFormatter()
    // initially set the format based on your datepicker date / server String
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display Label With today's date
        formatter.dateFormat = "yyyy-MM-dd"
        
        var label = UILabel(frame: CGRect(x: screenWidth / 2, y: screenHeight / 2, width: 200, height: 21))
        decorateLabel(&label)
        label.text = formatter.string(from: Date())
        self.view.addSubview(label)
        drawLabes(4)
        drawLabelsInVStackView()
        drawLabelsInHStackView()
        drawClickableLabel()
    }
    
    func drawClickableLabel() {
        var label = UILabel(frame: CGRect(x: screenWidth / 4, y: (screenHeight / 4), width: 90, height: 21))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        decorateLabel(&label)
        label.text = "Clickable"
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        self.view.addSubview(label)
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
    func drawLabelsInHStackView() {
        let label1 = UILabel()
        label1.text = "Hello"
        label1.backgroundColor = .magenta

        let label2 = UILabel()
        label2.text = "Horizontal Stack view"

        let stackView = UIStackView(arrangedSubviews: [label1, label2])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor), stackView.rightAnchor.constraint(equalTo: view.rightAnchor), stackView.heightAnchor.constraint(equalToConstant: 50), stackView.widthAnchor.constraint(equalToConstant: screenWidth / 2)])
    }
    
    func drawLabelsInVStackView() {
        let label1 = UILabel()
        label1.text = "Hello"
        label1.backgroundColor = .cyan

        let label2 = UILabel()
        label2.text = "Vertical Stack view"

        let stackView = UIStackView(arrangedSubviews: [label1, label2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor), stackView.leftAnchor.constraint(equalTo: view.leftAnchor), stackView.heightAnchor.constraint(equalToConstant: 50), stackView.widthAnchor.constraint(equalToConstant: screenWidth / 2)])
    }
    
    func drawLabes(_ n: Int) {
        for i in 1...n {
            var label = UILabel(frame: CGRect(x: screenWidth / 2, y: (screenHeight / 8) + CGFloat(i * 21), width: 200, height: 21))
            decorateLabel(&label)
            label.text = "Label Number \(i)"
            self.view.addSubview(label)
        }
    }

    func decorateLabel(_ label: inout UILabel) {
        label.backgroundColor = .clear
        label.textColor = .red
        label.font = UIFont(name:"Verdana",size:18)
        label.numberOfLines = 2
        label.shadowColor = .darkGray
        label.shadowOffset = CGSize(width: 1, height: 1)
    }

}


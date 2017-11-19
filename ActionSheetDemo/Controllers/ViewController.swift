//
//  ViewController.swift
//  ActionSheetDemo
//
//  Created by Tim Beals on 2017-11-18.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Touch for actions", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupSubviews()
    }

    func setupSubviews() {
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonTouched(sender:)), for: .touchUpInside)
    }

    @objc private func buttonTouched(sender: UIButton) {
        print("Button touched")

        let alertController = UIAlertController(title: "Hello, friend", message: "Here are your choices:", preferredStyle: .actionSheet)
        
        if let image = UIImage(named: "test-img-3") {
            alertController.addImage(image: image)
        }
        
        let oKaction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(oKaction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    private func okHandler(alert: UIAlertAction) {
        print("ok handler entered")
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}


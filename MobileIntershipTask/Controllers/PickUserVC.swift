//
//  PickUserVC.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 25/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import UIKit

class PickUserVC: UIViewController {
    
    var user: User!

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textfield.makeRounded(10)
        
        let placeholder = NSAttributedString(string: "username", attributes: [
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            ])
        
        textfield.attributedPlaceholder = placeholder
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let pickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pick!", for: .normal)
        button.addTarget(self, action: #selector(handlePickButtonTap), for: .touchUpInside)
        button.makeRounded(10)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc fileprivate func handlePickButtonTap() {
        guard let username = usernameTextField.text else { return }
        
        DataService.instance.fetchUser(username: username) { (gituser) in
            
            guard let user = gituser else {
                DispatchQueue.main.async {
                    self.showAlert()
                }
                print("User nil")
                return
            }
            
            self.user = user
            //print("Pobrano dane \(user.login!)")
        }
    }
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Username not found", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func addViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.937696188, blue: 0.8126211533, alpha: 1)
        
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(pickButton)
    }
    
    fileprivate func addConstraints() {
        usernameLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: usernameLabel.centerXAnchor).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        pickButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15).isActive = true
        pickButton.centerXAnchor.constraint(equalTo: usernameTextField.centerXAnchor).isActive = true
        pickButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pickButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor, multiplier: 2/3).isActive = true
    }
}


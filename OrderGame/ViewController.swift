//
//  ViewController.swift
//  OrderGame
//
//  Created by Дмитрий Процак on 23.07.2022.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel = UILabel()
    var segmentControl = UISegmentedControl(items: ["32cm", "48cm", "52cm"])
    var itemImageView = UIImageView()
    var descriptionLabel = UILabel()
    var stepper = UIStepper()
    var sendButton = UIButton()
    
    var itemDescription = "пицца Пеперони 32см в количестве - 1шт" {
        //когда будет меняться
        didSet {
            descriptionLabel.text = itemDescription
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(segmentControl)
        view.addSubview(itemImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(stepper)
        view.addSubview(sendButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            itemImageView.widthAnchor.constraint(equalToConstant: 300),
            itemImageView.heightAnchor.constraint(equalToConstant: 300),
            itemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            segmentControl.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            descriptionLabel.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
        
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stepper.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
        
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 100),
            sendButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
          
        
        //MARK: Title
        titleLabel.text = "Пеперони"
        titleLabel.font = UIFont.systemFont(ofSize: 33)
        titleLabel.textAlignment = .center
        
        //MARK: Image
        itemImageView.layer.cornerRadius = 15
        itemImageView.clipsToBounds = true //чтоб не выходила за пределы
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.image = UIImage(named: "pizza")
        
        //MARK: Segment
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        
        //MARK: Description
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = itemDescription
        
        //MARK: Stepper
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)
        
        //MARK: Button
        sendButton.setTitle("Добавить", for: .normal)
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.setTitleColor(.darkGray, for: .highlighted)
        sendButton.layer.cornerRadius = 10
        sendButton.backgroundColor = UIColor(red: 220/252, green: 220/252, blue: 220/252, alpha: 0.9)
        sendButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
    }
    
    @objc func sendAction() {
        print("Добавлено")
    }
    
    @objc func stepperAction(sender: UIStepper) {
        
    }

    @objc func segmentAction(sender: UISegmentedControl) {
        
    }

}


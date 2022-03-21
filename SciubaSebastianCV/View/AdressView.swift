//
//  AdressView.swift
//  SciubaSebastianCV
//
//  Created by akra on 16/03/2022.
//

import UIKit
import MapKit

class AdressView : UIViewController {
    
    let container = UIView()
    var stackView = UIStackView()
    let mapView = MKMapView()
    
    let homeLabel = ContactTitleLabel(labelTitle: "Home".localized)
    let adressLabel = UILabel()
    let cityLabel = UILabel()
    let countrylabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupData()
        setupMapView()
        configureContainer()
        configureStackView()
        configureMapView()
    }
    
    private func setupData() {
        adressLabel.text = "\(Constants.adres)"
        cityLabel.text = "\(Constants.city)"
        countrylabel.text = "Poland".localized
    }
//    MARK: - StackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [homeLabel, adressLabel, cityLabel, countrylabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
//    MARK: - MapView
    
    private func setupMapView() {
        let annotation = MKPointAnnotation()
        let latitude = Constants.latitude
        let longitude = Constants.longitude
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: annotation.coordinate,span: span)
        mapView.setRegion(region, animated: true)
        mapView.isScrollEnabled = false
    }
//    MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.45),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            mapView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            mapView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
            mapView.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -5)
        ])
    }
}

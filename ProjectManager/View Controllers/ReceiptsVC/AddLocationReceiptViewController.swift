//
//  AddLocationReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit
import MapKit

class AddLocationReceiptViewController: UIViewController {
    
    @IBOutlet var mapKitView: MKMapView!
    @IBOutlet var locationTextField: UITextField!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if locationTextField.text == "" {
            Alert.showIncompleteFormAlert(on: self)
        } else{
            performSegue(withIdentifier: "toDateVC", sender: UIButton.self)
        }
    }
    
    func setUpLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()
            checkLocationAuthorization()
        } else {
            
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapKitView.showsUserLocation = true
            mapKitView.showsBuildings = true
            centerViewOnUserLocation()
            break
        case .denied:
            Alert.showBasicAlert(on: self, with: "Location Services Disabled", message: "Please go to settings and enable locations services to use the map feature.")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            Alert.showBasicAlert(on: self, with: "Location Services Restricted", message: "This device's location services are restricted.")
            break
        case .authorizedAlways:
            mapKitView.showsUserLocation = true
            mapKitView.showsBuildings = true
            centerViewOnUserLocation()
            break
        @unknown default:
            fatalError()
        }
    }
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapKitView.setRegion(region, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDateVC", let destination = segue.destination as? AddDateReceiptViewController {
            guard let location = locationTextField.text else {return}
            destination.locationString = location
        }
    }
    
}

extension AddLocationReceiptViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension AddLocationReceiptViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapKitView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        checkLocationAuthorization()
    }
}

//
//  ViewController.swift
//  MapView
//
//  Created by Nguyen Quang Ha on 04/10/2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let map = MKMapView()
    var location: CLLocationManager?
    private var longtitude : Double?
    private var latitude : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        addView()
    }
    
    private func getLocation() {
        location = CLLocationManager()
        location?.delegate = self
        location?.requestAlwaysAuthorization()
        location?.startUpdatingLocation()
    }
    
    private func addView() {
        addMap()
    }
    
    private func addMap() {
        view.addSubview(map)
        map.frame = view.bounds
    }

    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            longtitude = location.coordinate.longitude
            latitude = location.coordinate.latitude
        }
        let pick = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longtitude ?? 0)
        map.setRegion(MKCoordinateRegion(center: pick, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
    }
}


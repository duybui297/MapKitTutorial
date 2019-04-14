//
//  ViewController.swift
//  MapKitTutorial
//
//  Created by Duy Bui on 4/4/19.
//  Copyright © 2019 DuyBui. All rights reserved.
//

import UIKit
import MapKit

struct Stadium {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}

class ViewController: UIViewController {

  let locationManager = CLLocationManager()
  @IBOutlet weak var mapView: MKMapView!
  
  let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
                  Stadium(name: "Stamford Bridge", lattitude: 51.4816, longtitude: -0.191034),
                  Stadium(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
                  Stadium(name: "Olympic Stadium", lattitude: 51.5383, longtitude: -0.016587),
                  Stadium(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
                  Stadium(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096)]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checkLocationServices()
    fetchStadiumsOnMap(stadiums)
  }
  
  
  func checkLocationServices() {
    if CLLocationManager.locationServicesEnabled() {
      checkLocationAuthorization()
    } else {
      // Show alert letting the user know they have to turn this on.
    }
  }
  
  
  func checkLocationAuthorization() {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse:
      mapView.showsUserLocation = true
  
    // For these case, you need to show a pop-up telling users what's up and how to turn on permisneeded if needed
    case .denied:
      break
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
      mapView.showsUserLocation = true
    case .restricted: 
      break
    case .authorizedAlways:
      break
    }
  }
  
  func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
    for stadium in stadiums {
      let annotations = MKPointAnnotation()
      annotations.title = stadium.name
      annotations.coordinate = CLLocationCoordinate2D(latitude: stadium.lattitude, longitude: stadium.longtitude)
      mapView.addAnnotation(annotations)
    }
  }
}

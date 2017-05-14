//
//  ViewController.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/27/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var history: UIView!
    @IBOutlet weak var viewSearch: UIView!
   
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    // Update the map once the user has made their selection.
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        // Clear the map.
        mapView.clear()
        
        // Add a marker to the map.
        if selectedPlace != nil {
            let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
            marker.title = selectedPlace?.name
            marker.snippet = selectedPlace?.formattedAddress
            marker.map = mapView
        }
        
       // likelyPlaces
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        history.layer.shadowColor = UIColor.black.cgColor
//        history.layer.shadowOffset = CGSize(width: 0, height: 1)
//        history.layer.shadowOpacity = 1
//        history.layer.shadowRadius = 0.5
//        history.clipsToBounds = false
//        history.layer.masksToBounds = false
        
        let radius1: CGFloat = history.frame.width / 2.0 //change it to .height if you need spread for height
        let shadowPath1 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius1, height: history.frame.height))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        history.layer.cornerRadius = 2
        history.layer.shadowColor = UIColor.black.cgColor
        history.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        history.layer.shadowOpacity = 0.5
        history.layer.shadowRadius = 2.0 //Here your control your blur
        history.layer.masksToBounds =  false
        history.layer.shadowPath = shadowPath1.cgPath
        
        
        let radius: CGFloat = viewSearch.frame.width / 2.0 //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: viewSearch.frame.height))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        viewSearch.layer.cornerRadius = 2
        viewSearch.layer.shadowColor = UIColor.black.cgColor
        viewSearch.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        viewSearch.layer.shadowOpacity = 0.5
        viewSearch.layer.shadowRadius = 2.0 //Here your control your blur
        viewSearch.layer.masksToBounds =  false
        viewSearch.layer.shadowPath = shadowPath.cgPath
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
       
        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we&#39;ve got a location update.
        view.addSubview(mapView)
        mapView.isHidden = true
        
        // Populate the array with the list of likely places.
        func listLikelyPlaces() {
            // Clean up from previous sessions.
            likelyPlaces.removeAll()
            
            placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
                if let error = error {
                    // TODO: Handle the error.
                    print("Current Place error: \(error.localizedDescription)")
                    return
                }
                
                // Get likely places and add to the list.
                if let likelihoodList = placeLikelihoods {
                    for likelihood in likelihoodList.likelihoods {
                        let place = likelihood.place
                        self.likelyPlaces.append(place)
                    }
                }
            })
        }
        
//        // Prepare the segue.
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "segueToSelect&quot" {
//                if let nextViewController = segue.destination as? PlacesViewController {
//                    nextViewController.likelyPlaces = likelyPlaces
//                }
//            }
//        }
        
        
        // Delegates to handle events for the location manager.
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    @IBAction func leftSideButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    @IBAction func rightSideButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.right, animated: true, completion: nil)
    }
    
 

}
extension ViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
         
        //listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted")
        case .denied:
            print("User denied access to location")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}



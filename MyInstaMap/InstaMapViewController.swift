//
//  InstaMapViewController.swift
//  MyInstaMap
//
//  Created by User on 8/29/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import AlamofireImage

class InstaMapViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var accessToken: String?
    //create locationManager
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mediaSearchAnnotions = [MediaSearchAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup navigation bar
        setupNav()
        //setup locationManager
        setupLocationManager()
        //setup mapView
        setupMapView()
    }
    
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(backAction))
    }
    
    @objc private func backAction(){
        AuthenticateAPI.shared.doLogoutInstagram() { [weak self] response in
            if (response == nil) {
                self?.navigationController?.popViewController(animated: true)
            } else {
                if let errorMessage = response?[Constants.ERROR_MSG_KEY] {
                    self?.showErrorAlertWithTitle(Constants.ERROR_MSG_KEY, message: errorMessage)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationManagerStatus()
        fetchAndDisplayMediaAnnotationToMapView()
    }
    
    func fetchAndDisplayMediaAnnotationToMapView() {
        
        guard self.accessToken != nil else {
            return
        }
        
        let center = mapView.convert(CGPoint(x: self.view.center.x, y: self.view.center.y), toCoordinateFrom: self.view) as CLLocationCoordinate2D
        
        MediaAPI.shared.getMediaOnline(latitude: String(center.latitude), longtitude: String(center.longitude), accessToken: self.accessToken!) { response in
            guard response != nil else { return }
            
            if let mediaSearchModel = response?[Constants.RESPONSE_DATA_KEY] {
                
                print(mediaSearchModel)
                let foundPlaces = MediaSearchAnnotation.getPlaces(media: mediaSearchModel as! MediaSearchModel)
                
                let filteredPlaces = foundPlaces.filter { !(self.mediaSearchAnnotions.contains($0)) }
                
                self.mediaSearchAnnotions.append(contentsOf: filteredPlaces);
                
                self.mapView?.addAnnotations(self.mediaSearchAnnotions)

            } else {
                if let errorMessage = response?[Constants.ERROR_MSG_KEY] {
                    self.showErrorAlertWithTitle(Constants.ERROR_MSG_KEY, message: errorMessage as! String)
                }
                
            }
        }
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    //
    //    func requestLocationAccess() {
    //        let status = CLLocationManager.authorizationStatus()
    //
    //        switch status {
    //        case .authorizedAlways, .authorizedWhenInUse:
    //            return
    //        case .denied, .restricted:
    //            print("location access denied")
    //            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
    //        default:
    //            locationManager.requestWhenInUseAuthorization()
    //        }
    //    }
    
    func checkLocationManagerStatus() {
        //status is not determined
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
            //authorization were denied
        else if CLLocationManager.authorizationStatus() == .denied {
            self.showErrorAlertWithTitle(Constants.ERROR_MSG_KEY, message: "Location services were previously denied. Please enable location services for this app in Settings.")
        }
            //do have authorization
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension InstaMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        defer { currentLocation = locations.last }
        
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000)
                mapView.setRegion(viewRegion, animated: false)
            }
        }
    }
}

extension InstaMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        } else {
            
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? CustomMKAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
            annotationView.image = UIImage(named: "ic_place")
            annotationView.canShowCallout = false
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {

        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }

        let mediaAnnotation = view.annotation as! MediaSearchAnnotation
        let calloutView = CustomCalloutView(frame: CGRect.init(x: 0, y: 0, width: 300, height: 165))
        calloutView.userNameLabel.text = mediaAnnotation.title ?? ""
        calloutView.textLabel.text = mediaAnnotation.subtitle ?? ""
        
        
        //
        //        let button = UIButton(frame: calloutView.starbucksPhone.frame)
        //        button.addTarget(self, action: #selector(ViewController.callPhoneNumber(sender:)), for: .touchUpInside)
        //        calloutView.addSubview(button)
        if let photoUrl = mediaAnnotation.photoUrl {
            let url = NSURL (string: photoUrl)
            calloutView.imageView.af_setImage(withURL: url! as URL)
        }
        
	
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height * 0.52)
        
        view.addSubview(calloutView)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: CustomMKAnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        //        print("will change ", animated)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //        print("did  change ", animated)
        fetchAndDisplayMediaAnnotationToMapView();
    }
}

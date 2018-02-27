//
//  ViewController.swift
//  MapTouch
//
//  Created by Steven Lipton on 2/15/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {
    //Two Rivers WI, the likely home of the Ice cream sundae
    let baseCoordinate = CLLocationCoordinate2DMake(44.1487225,-87.5684114)
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func tapGuesture(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            let locationInView = sender.location(in: mapView)
            let tappedCoordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(coordinate: tappedCoordinate)
        }
    }
    @IBAction func clearAnnotations(_ sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    func addAnnotation(coordinate:CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    func setupMap(){
        let region = MKCoordinateRegionMakeWithDistance(baseCoordinate, 500, 500)
        mapView.region = region
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
}


//
//  ViewController.swift
//  UberMapLook
//
//  Created by Ammad on 25/02/2018.
//  Copyright © 2018 Ammad. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    // MARK: - IBOutlets and variables

    @IBOutlet weak var mapView: GMSMapView!
    let lat = -23.562573
    let long = -46.654952
    let zoom: Float = 18

    // MARK: - UIViewContoller Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    // Set the status bar style to complement custom style.

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Helper Methods

    func setupViewController() {
        createMapView()
        addMarker()

        do {

            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                self.mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

            } else {
                NSLog("Unable to find style.json")
            }

        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }

    func createMapView() {
        let camera = GMSCameraPosition.camera(withLatitude:lat,
                                              longitude: long, zoom: zoom)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
    }

    func addMarker() {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, long)
        marker.title = "Av. Paulista"
        marker.snippet = "São Paulo"
        marker.map = mapView
    }
}

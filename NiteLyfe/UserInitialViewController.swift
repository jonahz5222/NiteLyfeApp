//
//  UserInitialViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit
import MapKit
class UserInitialViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        let regionRadius:CLLocationDegrees = 5000
        let initialLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(38.946047, -92.330131)
        //var artworks = [pinAnnotation]()
        // Flat Branch, Shakespeares, Seoul taco, Tropical
        var latitudes = [38.950148, 38.948679, 38.951276, 38.951848]
         var longtitudes = [-92.332041, -92.327943, -92.3256, -92.331157]
        // 1000 meters: alittle more than half a mile
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(initialLocation, regionRadius, regionRadius), animated: true)
        mapView.delegate = self
        for index in 1...4{
            if(index<5){
                let my_latitude: Double = latitudes[index-1]
                let my_longitude: Double = longtitudes[index-1]
                // show artwork on map
                let artwork = pinAnnotation(title: "King David Kalakaua",
                                            locationName: "Waikiki Gateway Park",
                                            discipline: "Sculpture",
                                            coordinate: CLLocationCoordinate2D(latitude: my_latitude, longitude: my_longitude))
                //artworks.append(artwork)
                mapView.addAnnotation(artwork)
            }
        }
        //mapView.addAnnotations(artworks)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func loadInitialData() {
//        // 1
//        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
//            else { return }
//        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
//
//        guard
//            let data = optionalData,
//            let json = try? JSONSerialization.jsonObject(with: data),
//            let dictionary = json as? [String: Any],
//            let works = dictionary["data"] as? [[Any]]
//            else { return }
//        // 5
//        let validWorks = works.flatMap { pinAnnotation(json: $0) }
//        artworks.append(contentsOf: validWorks)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
extension UserInitialViewController: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? pinAnnotation else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}

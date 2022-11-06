//
//  MapView.swift
//  FindMyCar
//
//  Created by Angela Chen on 11/2/22.
//  Copyright © 2022 Steph K. Ananth. All rights reserved.
//

import SwiftUI

import MapKit

struct MapView: UIViewRepresentable {
  
    let viewController: ViewController
    var location = Location()
  

  
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
      uiView.showsUserLocation = true
      //location.getCurrentLocation()
      //Augmenting the MapView
      
      //The only things that need to be done are to switch the call from getCurrentLocation to loadLocation so we load from the plist in updateUIView and to add loadLocation to the top of makeUIView.
      location.loadLocation()

      
      let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude
      )
      let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      uiView.setRegion(region, animated: true)
    }

    func makeUIView(context: Context) -> MKMapView {
      location.loadLocation()
      let mapView = MKMapView(frame: .zero)
      let droppedPin = MKPointAnnotation()
      //location.getCurrentLocation()
         droppedPin.coordinate = CLLocationCoordinate2D(
           latitude: location.latitude, // fill in with your current location latitude ,
           longitude: location.longitude // fill in with your current location longitude
         )
      // PART 4 STEP 3?
         droppedPin.title = "Your car is Here"
         droppedPin.subtitle = "Look it's your car!"
      mapView.addAnnotation(droppedPin)
      return mapView
    }
  
  

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
      MapView(viewController: ViewController())
    }
}

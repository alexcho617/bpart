//
//  FundingMapView.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//

import SwiftUI
import MapKit


struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let country: String
    let tag: String //물 교육 인권 일자리 보건 Water, Education, Human Rights, Workforce, Health
}


struct FundingMapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.783195, longitude: 15),span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 70))
    @State private var selectedPlace: Location?
    
    let geo_dummy = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 29.912289, longitude: 5.641287), country: "South Sudan", tag: "Education"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 0.175897, longitude: 10.466159), country: "Gahna", tag: "Education"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 7.171549, longitude: 23.314558), country: "Algeria", tag: "Water"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 16.879637, longitude: -8.890065), country: "Tanzania", tag: "Human Rights"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 20.957217, longitude: 12.525986), country: "Ethiopia", tag: "Health"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 19.157224, longitude: 24.507183), country: "Botswana", tag: "Water")
        ]
    

    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: geo_dummy) {dummy in
            MapAnnotation(coordinate: dummy.coordinate) {
                Image(systemName: "pin.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width:30, height:30)
                    .clipShape(Circle())
                    .onTapGesture{
                        selectedPlace = dummy
                    }
//                VStack {
//                    Circle()
//                        .stroke(.red, lineWidth: 3)
//                        .frame(width: 44, height: 44)
//                    //UIImage(named: "green-square-Retina")
//                }
            }
        }.sheet(item: $selectedPlace){ place in
            Text(place.country)
                .presentationDetents([.fraction(0.25), .fraction(0.75)])
        }
    }
}

struct FundingMapView_Previews: PreviewProvider {
    static var previews: some View {
        FundingMapView()
    }
}

//
//  ContentView.swift
//  Hello-Maps
//


import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    private var locationManager = LocationManager.shared
    @State private var selectedMapOption: MapOptions = .standard
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Map(position: $position) {
                Annotation("Coffee", coordinate: .coffee) {
                    Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .cornerRadius(4.0)
                }
                
                Annotation("Restaurant", coordinate: .restaurant) {
                    Image(systemName: "fork.knife.circle")
                }
                
                UserAnnotation()
            }
            .mapStyle(selectedMapOption.mapStyle)
            
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }.pickerStyle(.segmented)
            .background(.white)
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}


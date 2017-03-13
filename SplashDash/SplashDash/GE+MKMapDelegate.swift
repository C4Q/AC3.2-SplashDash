//
//  GE+MKMapDelegate.swift
//  SplashDash
//
//  Created by Tong Lin on 3/1/17.
//  Copyright © 2017 SHT. All rights reserved.
//

import UIKit
import MapKit

extension GameViewController: MKMapViewDelegate{
    
    func setupMapView(){
        let overlayPath = "http://tile.openstreetmap.org/{z}/{x}/{y}.png"
        let overlay = MKTileOverlay(urlTemplate: overlayPath)
        overlay.canReplaceMapContent = true
        self.mapView.add(overlay)
    }
    
//    func drawPolyLine(with location: CLLocationCoordinate2D) {
//        let myPolyline = MKPolyline(coordinates: [lastLocation, location], count: 2)
//        lastLocation = location
//        mapView.add(myPolyline)
//    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let myOverlay = overlay as? SplashOverlay{
            let splashOverlay = SplashOverlayView(overlay: myOverlay, teamName: myOverlay.teamName, splashImageTag: myOverlay.splashImageTag)
            return splashOverlay
        } else if overlay is MKCircle{
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = .orange
            return circleRenderer
        } else if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.lineWidth = CGFloat(Int(arc4random_uniform(15) + 5))
            lineView.strokeColor = .green
            lineView.miterLimit = 0
            lineView.lineDashPhase = 100
            return lineView
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {
        for _ in renderers{
            scene.dropSplash(on: CGPoint(x: self.view.frame.midX, y: self.view.frame.midY))
        }
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        switch mapView {
        case invisibleMapView:
            takeScreenshot()
        default:
            return
        }
    }
}

//
//  MapViewController.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 21/03/1443 AH.
//

//import Foundation
import UIKit
import MapKit
class MapViewController: UIViewController {
  var mapView: MKMapView!
  var segmentedControl: UISegmentedControl!
  var pointsOfInterestLabel: UILabel!
  var pointsOfInterestSwitch: UISwitch!
  
  var pointsOfInterestSwitchTopConstraint: NSLayoutConstraint!
  var pointsOfInterestSwitchCenterConstraint: NSLayoutConstraint!
  var pointsOfInterestLabelTopConstraint: NSLayoutConstraint!
  var pointsOfInterestLabelCenterConstraint: NSLayoutConstraint!
  
  
  override func loadView()
  {
    mapView = MKMapView()
    view = mapView
    
    segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged),
                               for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let margins = view.layoutMarginsGuide
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    pointsOfInterestLabel = UILabel()
    pointsOfInterestLabel.text = "Points of Interest"
    pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestLabel)
    
    pointsOfInterestSwitch = UISwitch()
    pointsOfInterestSwitch.isOn = true
    pointsOfInterestSwitch.addTarget(self,
                        action: #selector(togglePointsOfInterest),
                        for: .valueChanged)
    pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pointsOfInterestSwitch)
    
    
    pointsOfInterestSwitchTopConstraint = pointsOfInterestSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    pointsOfInterestLabelCenterConstraint = pointsOfInterestLabel.centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor)
    pointsOfInterestLabelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    pointsOfInterestSwitchCenterConstraint = pointsOfInterestSwitch.centerYAnchor.constraint(equalTo: pointsOfInterestLabel.centerYAnchor)
    updateVerticalPoiConstraints()
    
    
    let pointsPfInterestLabelLeadingConstraint = pointsOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let pointsOfInterestSwitchLeadingConstraint = pointsOfInterestSwitch.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor, constant: 8)
    pointsPfInterestLabelLeadingConstraint.isActive = true
    pointsOfInterestSwitchLeadingConstraint.isActive = true
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    print("MapViewController loaded its view.")
  }
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl)
  {
    switch segControl.selectedSegmentIndex
    {
    case 0: mapView.mapType = .standard
    case 1: mapView.mapType = .hybrid
    case 2: mapView.mapType = .satellite
    default: break
    }
  }
  
  @objc func togglePointsOfInterest(_ sender: UISwitch)
  {
    if sender.isOn
    {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
      pointsOfInterestLabel.font = UIFont.systemFont(ofSize: 20)
    }
    else
    {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
      pointsOfInterestLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    updateVerticalPoiConstraints()
  }
  
  func updateVerticalPoiConstraints()
  {
    
    if pointsOfInterestLabel.intrinsicContentSize.height < pointsOfInterestSwitch.intrinsicContentSize.height
    {
      pointsOfInterestSwitchTopConstraint.isActive = true
      pointsOfInterestLabelCenterConstraint.isActive = true
      pointsOfInterestLabelTopConstraint.isActive = false
      pointsOfInterestSwitchCenterConstraint.isActive = false
      
    }
    else
    {
      pointsOfInterestLabelTopConstraint.isActive = true
      pointsOfInterestSwitchCenterConstraint.isActive = true
      pointsOfInterestSwitchTopConstraint.isActive = false
      pointsOfInterestLabelCenterConstraint.isActive = false
    }
  }
}

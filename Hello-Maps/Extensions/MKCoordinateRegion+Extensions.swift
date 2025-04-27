//
//  MKCoordinateRegion+Extensions.swift
//  Hello-Maps
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/27.
//

import Foundation
import MapKit


/*Equatable 协议是 Swift 中用于定义两个实例是否相等的核心协议。它要求遵循该协议的类型必须实现 == 运算符，从而让开发者可以明确判断两个实例是否“逻辑上相等”。*/
extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == rhs.span.longitudeDelta{
            return true
        } else {
            return false
        }
    }
    
    static var coffee: MKCoordinateRegion {
        MKCoordinateRegion(center: .coffee, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    static var restaurant: MKCoordinateRegion{
        MKCoordinateRegion(center: .restaurant, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    static var school: MKCoordinateRegion{
        MKCoordinateRegion(center: .school, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

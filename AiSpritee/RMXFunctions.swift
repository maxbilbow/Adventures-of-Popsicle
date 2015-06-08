//
//  RMX.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import UIKit

extension RMX {
 
    
    static func makeButton(target: NSObject, title: String? = nil, selector: String? = nil, view: UIView, row: (CGFloat, CGFloat), col: (CGFloat, CGFloat)) -> UIButton {
        let btn = UIButton(frame: getRect(withinRect: view, row: row, col: col))//(view!.bounds.width * col.0 / col.1, view!.bounds.height * row.0 / row.1, view!.bounds.width / col.1, view!.bounds.height / row.1))
        if let title = title {
            btn.setTitle(title, forState:UIControlState.Normal)
        }
        if let selector = selector {
            btn.addTarget(target, action: Selector(selector), forControlEvents:UIControlEvents.TouchDown)
        }
        
        btn.enabled = true
        view.addSubview(btn)
        return btn
    }
    
    static func getRect(withinRect sender: Any, row: (CGFloat, CGFloat), col: (CGFloat, CGFloat)) -> CGRect {
        var bounds: CGRect!
        if sender is UIView {
            bounds = (sender as! UIView).bounds
        } else if sender is CGRect {
            bounds = sender as! CGRect
        }
        
        return CGRectMake(bounds.width * (col.0 - 1) / col.1, bounds.height * (row.0 - 1) / row.1, bounds.width / col.1, bounds.height / row.1)
    }
}
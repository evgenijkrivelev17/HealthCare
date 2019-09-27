//
//  CAVerticalTextLayer.swift
//  HealthCare
//
//  Created by Евгений on 9/27/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

class CAVerticalTextLayer : CATextLayer {

    override func draw(in ctx: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height-fontSize)/2 - fontSize/10

        ctx.saveGState()
        ctx.translateBy(x: 0.0, y: yDiff)
        super.draw(in: ctx)
        ctx.restoreGState()
    }
}

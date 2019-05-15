//
//  ImageTools.swift
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 02/05/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

import Foundation
import Cocoa
import CoreGraphics

class ImageTools {
    class func convertNSImageToCGImage(image: NSImage) -> CGImage! {
        return image.cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
}

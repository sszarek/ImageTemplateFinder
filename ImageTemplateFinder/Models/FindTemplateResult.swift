//
//  File.swift
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 10/05/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

import Foundation

@objc
class FindTemplateResult: NSObject {
    let xCoord: Int
    let yCoord: Int

    @objc init(xCoord: Int, yCoord: Int) {
        self.xCoord = xCoord
        self.yCoord = yCoord
    }
}

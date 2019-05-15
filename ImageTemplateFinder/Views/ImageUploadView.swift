//
//  ImageUploadView.swift
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 28/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

import Cocoa

class ImageUploadView: NSView {
    @IBOutlet weak var openImageButton: NSButton!
    @IBOutlet weak var infoLabel: NSTextField!

    var selectedFile: URL!

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let path = NSBezierPath()
        
        path.move(to: NSMakePoint(0, 0))
        path.line(to: NSMakePoint(0, 200))
        path.line(to: NSMakePoint(200, 200))
        path.line(to: NSMakePoint(200, 0))
        path.close()
        
        path.stroke()
    
    }

    @IBAction func onFileOpen(sender: Any) {
        let dialog = NSOpenPanel()
        dialog.title = "Choose a .jpg file"
        dialog.showsHiddenFiles = false
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes = ["jpg"]

        if dialog.runModal() == NSApplication.ModalResponse.OK {
            selectedFile = dialog.url
        }
    }
}

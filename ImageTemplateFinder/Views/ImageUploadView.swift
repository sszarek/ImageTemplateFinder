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
    @IBOutlet weak var infoLabel:    NSTextField!
    
    var selectedFile: URL!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    @IBAction func onFileOpen(_sender: Any) {
        let dialog = NSOpenPanel()
        dialog.title = "Choose a .jpg file"
        dialog.showsHiddenFiles = false
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes = ["jpg"]
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            selectedFile = dialog.url
        }
    }
}

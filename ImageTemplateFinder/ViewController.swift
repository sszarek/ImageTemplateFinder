//
//  ViewController.swift
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 17/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var templateView: NSImageView!
    @IBOutlet weak var closeImageButton: NSButton!
    @IBOutlet weak var closeTemplateButton: NSButton!
    
    @IBAction func openImageButtonClicked(_ sender: Any) {
        guard let url = getImageUrl() else { return }
        imageView.image = NSImage.init(contentsOf: url)
        closeImageButton.isEnabled = true
    }
    @IBAction func closeImageButtonClicked(_ sender: Any) {
        imageView.image = nil
        closeImageButton.isEnabled = false
    }
    
    @IBAction func openTemplateButtonClicked(_ sender: Any) {
        guard let url = getImageUrl() else { return }
        templateView.image = NSImage.init(contentsOf: url)
        closeTemplateButton.isEnabled = true
    }
    
    @IBAction func closeTemplateButtonClicked(_ sender: Any) {
        templateView.image = NSImage(named: NSImage.Name("picture"))
        closeTemplateButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func getImageUrl() -> URL? {
        let dialog = NSOpenPanel()
        dialog.title = "Choose a .jpg file"
        dialog.showsHiddenFiles = false
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes = ["jpg"]
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            return dialog.url
        }
        
        return nil
    }
}


//
//  ViewController.swift
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 17/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var templateImageView: NSImageCell!
    @IBOutlet weak var imageImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func openTemplateButtonClicked(_ sender: Any) {
        guard let url = getImageUrl() else { return }
         templateImageView.image = NSImage.init(contentsOf: url)
    }
    
    @IBAction func openImageButtonClicked(_ sender: Any) {
        guard let url = getImageUrl() else { return }
        imageImageView.image = NSImage.init(contentsOf: url)
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


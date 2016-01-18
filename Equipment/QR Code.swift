//
//  QR Code.swift
//  Equipment
//  Code Template/Project from: http://www.appcoda.com/qr-code-reader-swift/ via Simon Ng
//  Modified by Betsy Li on 1/17/16.
//  Copyright © 2016 Simon Ng. All rights reserved.
//

import AVFoundation
import UIKit

var success = false
class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
        captureSession = nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.running == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.running == true) {
            captureSession.stopRunning();
        }
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            foundCode(readableObject.stringValue);
        }
        if (success == true) {
            self.performSegueWithIdentifier("QRSegue", sender: self)
            //    dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func foundCode(code: String) {
        if (code.rangeOfString("ThinkPad Laptop") != nil) || (code.rangeOfString("SparkFun Kit") != nil) {
            equipment = code.substringWithRange(Range<String.Index>(start: code.startIndex.advancedBy(1), end: code.endIndex.advancedBy(0)))
            equipid = code.substringWithRange(Range<String.Index>(start: code.startIndex.advancedBy(0), end: code.endIndex.advancedBy(-(code.characters.count - 1))))
            if ((equipment == "ThinkPad Laptop") && (thinkPadData.contains(equipid))) {
                success = true
            }
            else if ((equipment == "SparkFun Kit") && (sparkFunData.contains(equipid))) {
                success = true
            }
            else {
                self.performSegueWithIdentifier("errorSegue", sender: self)
            }
        }
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
}


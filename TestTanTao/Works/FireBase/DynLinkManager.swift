//
//  DynLinkManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/12.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import FirebaseDynamicLinks

class DynLinkManager: NSObject {

    static var shared = DynLinkManager();
    
    func testLink() {
        
//        guard let bundleID = Bundle.main.bundleIdentifier else {
//            return ;
//        }
        
//        let linkString = "https://LinkLink"
//        guard let link = URL(string: linkString) else { return }
//        let dynamicLinksDomain = "taoerist.page.link"
//        let linkBuilder = DynamicLinkComponents(link: link, domain: dynamicLinksDomain)
//
//        linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: bundleID)
//        linkBuilder.iOSParameters?.appStoreID = "923960562"
//        linkBuilder.iOSParameters?.minimumAppVersion = "1.0"
//        linkBuilder.iOSParameters?.fallbackURL = URL(string: "https://itunes.apple.com/cn/app/id923960562?mt=8");
//
//        linkBuilder.androidParameters = DynamicLinkAndroidParameters(packageName: "com.example.android")
//        linkBuilder.androidParameters?.minimumVersion = 123
//
//        linkBuilder.analyticsParameters = DynamicLinkGoogleAnalyticsParameters(source: "orkut",medium: "social",campaign: "example-promo")
//
//        linkBuilder.iTunesConnectParameters = DynamicLinkItunesConnectAnalyticsParameters()
//        linkBuilder.iTunesConnectParameters?.providerToken = "123456"
//        linkBuilder.iTunesConnectParameters?.campaignToken = "example-promo"
//
//        linkBuilder.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
//        linkBuilder.socialMetaTagParameters?.title = "Example of a Dynamic Link"
//        linkBuilder.socialMetaTagParameters?.descriptionText = "This link works whether the app is installed or not!"
//        linkBuilder.socialMetaTagParameters?.imageURL = URL(string: "https://www.example.com/my-image.jpg")
//
//        guard let longDynamicLink = linkBuilder.url else {
//            return
//        }
//        print("The long URL is: \(longDynamicLink)")
//
//        linkBuilder.shorten { (url, warnings, error) in
//            if (error != nil) {
//                print(error?.localizedDescription);
//                print(warnings);
//                return ;
//            }
//            print(url)
//        }
    }
    
    func generateLink() {
        
//        // [START buildFDLLink]
//        // general link params
//        let linkString = "LinkLink"
//
//        guard let link = URL(string: linkString) else {
//            return ;
//        }
//        let components = DynamicLinkComponents(link: link, domain: "taoerist.page.link")
//
//        // analytics params
//        let analyticsParams = DynamicLinkGoogleAnalyticsParameters.init(source: "source", medium: "medium", campaign: "campaign")
//        analyticsParams.term = "term term"
//        analyticsParams.content = "content content"
//        components.analyticsParameters = analyticsParams
//
//        guard let bundleID = Bundle.main.bundleIdentifier else {
//            return ;
//        }
//
//        let iOSParams = DynamicLinkIOSParameters()
//        iOSParams.fallbackURL = URL(string: "")
//        iOSParams.minimumAppVersion = ""
//        iOSParams.customScheme = ""
//        iOSParams.iPadBundleID  = bundleID
//        iOSParams.iPadFallbackURL = URL.init(string: "")
//        iOSParams.appStoreID = "12345678"
//        components.iOSParameters = iOSParams
//
        //        // iTunesConnect params
        //        let appStoreParams = DynamicLinkItunesConnectAnalyticsParameters()
        //        appStoreParams.affiliateToken = dictionary[.affiliateToken]?.text
        //        appStoreParams.campaignToken = dictionary[.campaignToken]?.text
        //        appStoreParams.providerToken = dictionary[.providerToken]?.text
        //        components.iTunesConnectParameters = appStoreParams
        //
        //        if let packageName = dictionary[.packageName]?.text {
        //            // Android params
        //            let androidParams = DynamicLinkAndroidParameters(packageName: packageName)
        //            androidParams.fallbackURL = dictionary[.androidFallbackURL]?.text.flatMap(URL.init)
        //            androidParams.minimumVersion = dictionary[.minimumVersion]?.text.flatMap {Int($0)} ?? 0
        //            components.androidParameters = androidParams
        //        }
        
//        // social tag params
//        let socialParams = DynamicLinkSocialMetaTagParameters()
//        socialParams.title = "social title"
//        socialParams.descriptionText = "descrip tion"
//        socialParams.imageURL = URL(string: "https:///image")
//        components.socialMetaTagParameters = socialParams
//
        //        // OtherPlatform params
        //        let otherPlatformParams = DynamicLinkOtherPlatformParameters()
        //        otherPlatformParams.fallbackUrl = dictionary[.otherFallbackURL]?.text.flatMap(URL.init)
        //        components.otherPlatformParameters = otherPlatformParams
        //
        //        longLink = components.url
        //        print(longLink?.absoluteString ?? "")
        //        // [END buildFDLLink]
        
        //        // Handle longURL.
        //        tableView.reloadRows(at: [IndexPath(row: 0, section: 2)], with: .none)
        
//        // [START shortLinkOptions]
//        let options = DynamicLinkComponentsOptions()
//        options.pathLength = .unguessable
//        components.options = options
//        // [END shortLinkOptions]
//        
//        components.shorten { (shortURL, warnings, error) in
//            if let error = error {
//                print(error.localizedDescription);
//                return ;
//            }
//            print(shortURL?.absoluteString ?? "nil")
//        }
    }
}

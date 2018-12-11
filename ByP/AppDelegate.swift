//
//  AppDelegate.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        window?.makeKeyAndVisible()
        setupDatabase()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    private func setupDatabase() {
        do {
            let realm = try Realm()
            if realm.objects(Place.self).isEmpty {
                try realm.write {
                    let place1 = Place(name: "Buda a ferencvárosi partról", imageString: "buda", directoryNumber: "17671")
                    place1.painter = "Markó Henrik"
                    place1.datePainted = "1869"
                    place1.orderId = 0
                    place1.latitude = 47.478696
                    place1.longitude = 19.068037
                    realm.add(place1)

                    let place2 = Place(name: "Belgrád rakpart", imageString: "belgrad", directoryNumber: "16505")
                    place2.painter = "Irinyi József"
                    place2.datePainted = "1880-as évek"
                    place2.orderId = 1
                    place2.latitude = 47.488688
                    place2.longitude = 19.053955
                    realm.add(place2)

                    let place3 = Place(name: "Egyetem tér", imageString: "egyetem", directoryNumber: "969")
                    place3.painter = "Egerváry"
                    place3.datePainted = "1890"
                    place3.orderId = 2
                    place3.latitude = 47.490782
                    place3.longitude = 19.059063
                    realm.add(place3)

                    let place4 = Place(name: "Ferenciek tere", imageString: "ferenciek", directoryNumber: "643")
                    place4.painter = "Schickedanz Albert"
                    place4.datePainted = "1887"
                    place4.orderId = 3
                    place4.latitude = 47.493133
                    place4.longitude = 19.055943
                    realm.add(place4)

                    let place5 = Place(name: "Rózsa tér", imageString: "rozsa", directoryNumber: "591")
                    place5.painter = "Lechner Gyula"
                    place5.datePainted = "1890-es évek"
                    place5.orderId = 4
                    place5.latitude = 47.492471
                    place5.longitude = 19.053850
                    realm.add(place5)

                    let place6 = Place(name: "Petőfi téri piac", imageString: "petofi_piac", directoryNumber: "3678")
                    place6.painter = "Lechner Gyula"
                    place6.datePainted = "1900"
                    place6.orderId = 5
                    place6.latitude = 47.492273
                    place6.longitude = 19.052561
                    realm.add(place6)

                    let place7 = Place(name: "Petőfi tér", imageString: "petofi", directoryNumber: "1135")
                    place7.painter = "Balló E."
                    place7.datePainted = "1890 körül"
                    place7.orderId = 6
                    place7.latitude = 47.491970
                    place7.longitude = 19.051887
                    realm.add(place7)

                    let place8 = Place(name: "Váczi utca", imageString: "vaczi", directoryNumber: "51.1127.1")
                    place8.painter = "Erdőssy Béla"
                    place8.datePainted = "1914"
                    place8.orderId = 7
                    place8.latitude = 47.494632
                    place8.longitude = 19.052119
                    realm.add(place8)

                    let place9 = Place(name: "Kristóf tér", imageString: "kristof", directoryNumber: "2.492")
                    place9.painter = "Lechner Gyula"
                    place9.datePainted = "1901"
                    place9.orderId = 8
                    place9.latitude = 47.495281
                    place9.longitude = 19.052870
                    realm.add(place9)

                    let place10 = Place(name: "Operaház", imageString: "operahaz", directoryNumber: "24166")
                    place10.painter = "Schickedanz Albert"
                    place10.datePainted = "1890"
                    place10.orderId = 9
                    place10.latitude = 47.503250
                    place10.longitude = 19.060578
                    realm.add(place10)
                }
            } else {
                logger("Realm already initialized with \(realm.objects(Place.self).count) objects.")
                realm.objects(Place.self).toArray()
                    .map {
                        logger($0.coordinates)
                    }
            }
        } catch {
            logger("Realm init failed")
        }
    }
}


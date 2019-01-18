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
                    place1.isActive = true
                    place1.latitude = 47.478696
                    place1.longitude = 19.068037
                    place1.infoText = "Markó Henrik a magyar romantikus tájképfestészet megteremtőjének, id. Markó Károlynak volt az unokája. A hazai lexikonokban, vagy a korszakot ismertető művészeti könyvekben nem találkozhatunk nevével csak az olasz nyelvű irodalomban. Markó Henrik, azaz Enrico Marko Firenzében született az 1850-es évek közepe tájékán, és valószínűleg 1920 körül halt meg Genova közelében. Csak kevés adat maradt fenn életéről, azt viszont biztosan lehet tudni, hogy rövid időt Budapesten töltött. Ekkor festette meg a Buda a ferencvárosi partról című festményét 1896-ban. A Gellért-hegy látképét ábrázoló alkotás ma a Fővárosi Képtár gyűjteményében található. Kevesen tudják, hogy a Gellért-hegy lejtőit évszázadokon keresztül szőlőültetvények borították. Az ízletes budai zöld és kéknyelű fajtából főleg fehérbor készült, melyek olyannyira népszerűek voltak, hogy hamisították őket. Az ültetvények a 19.század végére filoxérajárvány miatt kipusztultak. A használhatatlanná vált területeket ekkor kezdték el beépíteni. A festményen jól látható a hegy ikonikus építménye, a Citadella. Az 1848-as szabadságharc leverése után, a bécsi haditanács úgy határozott, hogy a hadászati szempontból elavult budai vár helyett egy jól védhető erődrendszert kell kiépíteni Budán, amelynek az esetleges támadók visszaverése mellett, fontosabb célja volt, hogy az építmény megfélemlítse és féken tartsa a város lakosságát. Az olasz eredetű citadella szó, fellegvárat jelent.  Az erődöt 1850-ben kezdték el építeni Haynau tábornagy vezényletével. A citadella hadászatilag már az építésekor elavultnak számított, és nem felelt meg a modern kor hadviselési követelményeinek, melynek nagy része soha nem került megépítésre. A Citadella osztrák tüzérsége csak egyszer kapott munkát, amikor Ferenc József születésnapján díszlövéseket adtak le. Az 1867-es osztrák-magyar kiegyezést követően az erőd elvesztette hadászati jelentőségét, azonban a katonaság még 30 évig, az 1897-es kivonulásig használta. A II. világháború alatt a fővárost védő német és magyar csapatok légvédelmi bázisául szolgált, míg kazamatáiban raktárat és sebesült-ellátó helyet rendeztek be. A háború után 1947-ben avatták fel a Citadella előtt Kisfaludi Strobl Zsigmond alkotását, a Felszabadulási emlékművet, melyet „a felszabadító szovjet hősök emlékére a hálás magyar nép” állíttatott. Az emlékmű központi alakja a szabadságot szimbolizáló, a kezében pálmafaágat tartó nőalak, mely hamarosan a város egyik legfontosabb jelképévé vált. A felirat, a hozzátartozó jelképekkel, a rendszerváltáskor el lett távolítva. Sajnos az épület állaga és a környezete erősen leromlott állapotú. Pedig 1987 óta a Duna-part látképe és a Budai várnegyed a világörökség részét képezi, mely területnek része a Gellért-hegyen álló Citadella is."
                    realm.add(place1)

                    let place2 = Place(name: "Belgrád rakpart", imageString: "belgrad", directoryNumber: "16505")
                    place2.painter = "Irinyi József"
                    place2.datePainted = "1880-as évek"
                    place2.orderId = 1
                    place2.latitude = 47.488688
                    place2.longitude = 19.053955
                    place2.infoText = "A festményen látható épület az egykori Ferenc József, ma Belgrád rakpart 27. számon található. Az 1987 óta az Unesco Világörökség részét képező Dunaparti látkép mára már megszürkült lakóháza, egykor luxus bérház volt. Az épület tervezője Hültl Dezső, aki 1892-ben a József Műegyetemen szerzett építészeti oklevelet, és aki szakmája első hazai doktora volt. Professzora, és későbbi apósa Hauszmann Alajos, a kor egyik legtevékenyebb és legjellegzetesebb képviselője volt a magyar építészetben. Hültl építészeti pályáját apósa mellett, a budai vár művezetőségén kezdte. Nem csak tervezett, hanem tanárként is dolgozott. 1910-ben egyetemi magántanári képesítést szerzett „lakóházak tervezése” tárgykörben. Hültl építészeti irodája a Ferenc József rakparti épülettel debütált. A XIX. század végén a környék településrendezési lázban égett. Az Eskü téri híd (ma Erzsébet híd) építése miatt több, a Pénzügyminisztérium tulajdonába tartozó építési telek jött létre. Annak ellenére, hogy három évtizedes adómentességet ígértek bérházak építtetőinek, az épület Hal tér helyén fekvő telkét nem tudták eladni. Így végül a minisztérium saját terhére építtette a két belső udvart is magában rejtő épületet, a Vagyontalan Hivatalnokok Árváinak Alapja számára, 1902 és 1904 között. Az építkezésen többek között olyan neves kőfaragók is részt vettek, mint Andretti Anzelm és Seenger Béla, akik a Bazilika kőfaragó munkáiban is oroszlánrészt vállaltak. A neobarokk jelzővel is jellemzett, kívül-belül polgári pompában úszó bérház első két szintje, tizenhat hatszobás lakosztállyal várta a gazdag, népes cselédséggel rendelkező bérlőket: jómódú polgárokat és magas pozíciót betöltő állami tisztviselőket. A harmadik és a negyedik emeleten főleg hivatalnokok, tanárok és kereskedők laktak, három-öt szobás lakásokban. Az épület nem csak kívül volt impozáns. A belső homlokzatát fehér ónmázas kerámia burkolta, mely a fény tükrözésével a belső terek világosságát növelte. Falikutak, díszes antikizáló márványoszlopok és míves stukkók teszik pompázatossá a lépcsőházat a mai napig. Az épület a második világháborúig a környék legszebb tetőszerkezetével rendelkezett. Budapest ostromakor azonban a harmadik szint egy találat következtében leégett. A háború után a lakóházat renoválták, és az egykori tágas lakásokat felaprózták. Az épület, mely olyan híres lakókkal büszkélkedhetett mint Gróf Ráday Gedeon főispán, Mácsai István Munkácsy-díjas festőművész, Eörsi István Kossuth- és József Attila-díjas író vagy Szakcsi Lakatos Béla Kossuth- és Liszt Ferenc díjas jazz-zenész, a mai napig nem nyerte vissza régi pompáját."
                    realm.add(place2)

                    let place3 = Place(name: "Egyetem tér", imageString: "egyetem", directoryNumber: "969")
                    place3.painter = "Egerváry"
                    place3.datePainted = "1890"
                    place3.orderId = 2
                    place3.latitude = 47.490782
                    place3.longitude = 19.059063
                    place3.infoText = "Egerváry Potemkin Ágost (1858-1930) Esztergomban született. Budapesten és Münchenben szerezte sokoldalú művészeti ismereteit. A képzőművészet mellett írással és színészettel is foglalkozott. Mesterei: Greguss János, Székely Bertalan, Hollósy Simon, Liezenmayer Sándor. 1886-tól vett részt a budapesti kiállítási életben. 1910-ben Törökországban dolgozott. Törökországi sorozata és több műve jelenleg a Magyar Nemzeti Galéria gyűjteményében található. Ezen a festményén az 1890 körüli Ferenciek terét örökítette meg dél felől, az Egyetem felépítése előtt. Balról a templom impozáns épülete sejlik fel. Az egykori pálos, a jelenlegi egyetemi templomot az egyetlen magyar alapítású, XIII. századbeli szerzetesek, a pálosok rendje emelte. A magyar remeték pálos rendjét Boldog Özséb esztergomi kanonok szervezte meg. 1329-ben részesedett pápai megerősítésben. 1686, Buda török alóli felszabadítása után költöztek Pestre a pálosok, amikor az egykori mecsetet néhány szomszédos házzal megvásárolták. Az ő történetük és lelkiségük ihlette a templom műalkotásait. A rendház 1715-1744 között épült. A lebontott dzsámi helyére a jelenlegi templom alapkövét 1723-ban rakták le. Építésze valószínűleg Mayerhoffer András volt, a magyar egyházi és világi barokk építészet egyik legtehetségesebb alakja. a külső munkálatok (kapu, két torony) és belső berendezések (padok, szószék, főoltár és freskók) csak 1770-ben készültek el. A pálos rend 1786. évi feloszlatása után a templom az Egyetem tulajdona lett. A török hódoltságtól mentes Nagyszombatban 1635-ben létesített egyetem 1777-ben Budára, a királyi palotába költözhetett, majd onnan  1784-ben Pestre. E Királyi Magyar Egyetem központja (és 1805-től jogi kara is) a pálos templom (később egyetemi templom) melletti pálos Nagyszeminárium háromemeletes épületébe került. A 19. század végén, a dualizmus második felének fejlesztései európai színvonalra emelték az egyetemi infrastruktúrát, ennek keretében a Nagyszeminárium helyén 1897-ben épült késő eklektikus stílusban az egyetemi központ és a jogi kar jelenleg is működő épülete.  Az Egyetem tér arculatát meghatározó fehér épülettömb erősen kiugró, nyitott földszinti árkádos középső része fölött több emeletet átfogó oszlopsor húzódik. (Az  1861-től Magyar Királyi Tudományegyetem 1921-ben vette fel Pázmány Péter, majd 1950-ben Eötvös Loránd nevét.) A festmény képterének közepén a mai Papnövelde és Egyetemi utca sarkát ismerhetjük fel. A festőművész nem mulasztotta el megeleveníteni a tér színes forgatagát: úrihölgyek sétálnak, újságosfiú rikkant, urak tárgyalnak a díszes kirakat előtt, utcaseprő söpör. A bérkocsiállomás felé igyekvők alakját az egész festményt uraló, szürkés-sárgás köd nyeli el."
                    realm.add(place3)

                    let place4 = Place(name: "Ferenciek tere", imageString: "ferenciek", directoryNumber: "643")
                    place4.painter = "Schickedanz Albert"
                    place4.datePainted = "1887"
                    place4.orderId = 3
                    place4.latitude = 47.493133
                    place4.longitude = 19.055943
                    place4.infoText = "Az egykori Ferences kolostort 1876 és 1877 között építették át, ekkor kapta a Ferenciek Bazára elnevezést. Ahogy a századfordulót megelőző évtizedektől, úgy ma is átjáróházként használják és üzletsorral kapcsolódik a vásárlónegyed-jellegű környékhez. Az itt található Kárpátia Étterem története egészen az 1930-as évekre nyúlik vissza, a fővárosi nagypolgári élet egyik meghatározó helyszíneként. Még a tizenkilencedik század végén rendeztek itt több termet betöltö orientalista vándorkiállítást is emeleten: a több száz darabból álló gyűjtemény prezsaszőnyegekből, vázákból, fém és porcelán díszekből, török díszekből állt, a nézőközönséget elkápráztatva. Az  udvaron pedig valódi bazár bontakozott ki a különböző kereskedők sokaságából: szabók, cipészek, kalaposok és virágárusok népesítették be a belső részt. Ami napjainkban is megmaradt, az az étterem, illetve termeiben  a freskókról kibontakozó történelem: Szigetvár ostroma, Tinódi Lantos Sebestyén és Balassi Bálint alakja, a regösök világa elevenedik meg a látogatótömegek előtt. Az Eötvös Loránd Tudományegyetem könyvtárának épülete a mai Ferenciek tere és a Reáltanoda utca sarkán. A nagyszabású gyűjteménnyel rendelkező intézmény napjainkig az ország egyik legfontosabb nyilvános szakkönyvtára. Az épület a tizenkilencedik század második felére jellemző eklektikus pompájában gazdagítja Budapest belvárosi műemléki építészeti emlékeit. Termeiben Than Mór illetve Lotz Károly freskóival is találkozhatunk. Szkalnitzky Antal tervei alapján, 1876-ban épült. A korszakban alakult ki a főváros tudományos intézményeinek, egyetemeinek és művészeti iskoláinak alapítása, fejlesztése is – ekkoriban elnökölt Liszt is a Zeneakadémia élén. Részben ennek köszönhetően vált Budapest a széleskörű ismeretek és a kultúra pezsgő városává, ahol az értelmiségi elit a könyvtárakat, színházakat és a kávézókat járta. Ekkoriban az egyetemi hallgatóság több, mint 80%-a vidékről érkezett: kis falvaikat, tanyavilágukat hátrahagyva például olyan impozáns termekben tölthették napjaikat, mint az Egyetemi Könyvtár pompázatos helyiségei."
                    realm.add(place4)

                    let place5 = Place(name: "Rózsa tér", imageString: "rozsa", directoryNumber: "591")
                    place5.painter = "Lechner Gyula"
                    place5.datePainted = "1890-es évek"
                    place5.orderId = 4
                    place5.isActive = true
                    place5.latitude = 47.492471
                    place5.longitude = 19.053850
                    place5.infoText = "A 17. század végén letelepedett Lechner család számára nagyon fontos volt a főváros épülésért, szépüléséért vívott harc. Idősebb Lechner Nepomuki János az 1808-ban alakult Szépítő Bizottmány tollnoka volt, melyet József nádor irányított. Ő volt az építési engedélyek kiadásának nagyhatalmú ura. Az ő nevéhez fűződik a Városliget fásítása, a polgárok odacsábításának érdekében. Lechner Nepomuki János hozatta be Párizsból a liget első körhintájának falovait. Fia ügyvéd volt, aki az anyai öröksége révén egy kőbányai téglagyár tulajdonosa lett. Itt nem csak egyszerű téglákat gyártottak, hanem a kerámia több fajtáját is, például a Dohány utcai zsinagóga részére készült majolikákat és terrakottákat. Művészi hajlamait fiai is örökölték. Ödön a szecessziós építészet egyik legnagyobb mestere, míg Gyula a kor elismert festője és műfordítója volt. Lechner Gyulát a Budapest iránt érzett szeretete késztette arra, hogy elinduljon az 1884-85-ös budapesti látképpályázaton. A fővárosi tanács a „Rózsa tér” és a „Sebestyén tér” című műveit 300 forintért vette meg, a képzőművészeti bizottság javaslatára. Az említett pályázat egyik szempontja volt, hogy „ a főváros szebb és érdekesebb pontjai közül első sorban azokat örökítse meg, melyek a főváros természetes fejlődése folytán a közel jövőben változás alá fognak esni.” Az Erzsébet híd megépítésével a Belváros teljesen átalakult, és sok más utcához és térhez hasonlóan, a Rózsa tér is eltűnt. Ezért ma már nehéz rekonstruálni a teret, amely a mai Duna utca egy részén és a jobb oldali Klotild palota között állt. Nevét vélhetően a téren tartott virágvásárokról kapta. Később virágok helyett cipő, óra, esernyő és más használati tárgyak kereskedése folyt itt. A környék híres vendéglője, a „Török császár” is itt állt, amelyben a hajnalig tartó ferblicsaták nagy népszerűségnek örvendtek az ifjú egyetemisták körében. A polgármester két fia is itt játszott rendszeresen, állítólag. Egy városi legenda szerint a fiúk, hogy adósságukat törlesszék, édesapjuk díszmagyarját is zálogba adták. Ez éppen akkor történt, amikor a Pestre érkező uralkodó fogadására a polgármester urat rendelték ki, akinek díszmagyarban kellett volna köszöntenie őfelségét. A két ifjúnak hatalmas kamat mellett kellett gyorsan kiváltaniuk a zálogba adott ruhát. Ez a kávéház is eltűnt az 1890-es években, akárcsak a Rózsa tér többi, szép klasszicista és copf épülete."
                    realm.add(place5)

                    let place6 = Place(name: "Petőfi téri piac", imageString: "petofi_piac", directoryNumber: "3678")
                    place6.painter = "Lechner Gyula"
                    place6.datePainted = "1900"
                    place6.orderId = 5
                    place6.latitude = 47.492273
                    place6.longitude = 19.052561
                    place6.infoText = "A Belvárosi Nagyoldogasszony Főplébánia temploma a történelmi belváros egyik legnagyobb múlttal rendelkező épülete: a római korból megmaradt Contra Aquinqum romjaira épült. Még az 1300-as években szentelték fel, és azóta meglehetősen sokat látott: a török hódoltság alatt mecsetként használták (egy megmaradt  imafülke mai napig őrzi ennek emlékét), átélt egy tűzvészt, egy barokkizáló átépítést és számos rekonstrukciót. Az épület – nem meglepő módon – építészettörténeti szempontból is jelentős. A régészeti feltárások során olyan érdekességek bukkantak elő, mint például a Mátyás-korabeli oratórium faragott ablaka, számos gótikus díszítő kőfaragvány, és az egykori előcsarnok gazdagon tagolt ikerkapuja is. A templomot frontális homlokzata felől megközelítve ma nehéz elképzelni, hogy az eredetileg gótikus stílusban, karcsú pillérekkel magasodott az égbe a Dunaparton – az alapos megfigyelés azonban tartogathat meglepetéseket. A helyszín a mai képen szinte szinte felismerhetetlen: a lebontásra került épület helyén ma az Erzsébet hídra vezető, forgalmas felüljáró található. Az egykori Eskü teret (amelyet ma Március 15. térként ismerünk), portékáikat kínáló árusok hangja, szaladgáló gyerekek nevetése, elszabadult élőállatok rikácsolása és szüntelenül alkudozó háziasszonyok hangja töltötte be, mivel gyakran rendeztek piacokat a mai Torony utca, Duna utca és a Hal tér csomópontjában. A kereskedelmi élet a korábbi feudális viszonyok felbomlása után épp ekkoriban virágzott fel, és nem meglepő módon szintén Budapest várt a központjává. Érdekes, hogy ez a környék a mai napig a vásárlás egyik fontos helyszíne, habár a hangulat gyökeresen megváltozott: Budáról érkező, illetve oda tartó buszok és autók, hatalmas tömegek, fényképezkedő turistacsoportok és hatalmas mennyiségű reklám tölti be az egyébként hajdanán nyüzsgőnek számító környéket."
                    realm.add(place6)

                    let place7 = Place(name: "Petőfi tér", imageString: "petofi", directoryNumber: "1135")
                    place7.painter = "Balló E."
                    place7.datePainted = "1890 körül"
                    place7.orderId = 6
                    place7.isActive = true
                    place7.latitude = 47.491970
                    place7.longitude = 19.051887
                    place7.infoText = "A Belvárosi Nagyoldogasszony Főplébánia temploma a történelmi belváros egyik legnagyobb múlttal rendelkező épülete: a római korból megmaradt Contra Aquinqum romjaira épült. Még az 1300-as években szentelték fel, és azóta meglehetősen sokat látott: a török hódoltság alatt mecsetként használták (egy megmaradt  imafülke mai napig őrzi ennek emlékét), átélt egy tűzvészt, egy barokkizáló átépítést és számos rekonstrukciót. Az épület – nem meglepő módon – építészettörténeti szempontból is jelentős. A régészeti feltárások során olyan érdekességek bukkantak elő, mint például a Mátyás-korabeli oratórium faragott ablaka, számos gótikus díszítő kőfaragvány, és az egykori előcsarnok gazdagon tagolt ikerkapuja is. A templomot frontális homlokzata felől megközelítve ma nehéz elképzelni, hogy az eredetileg gótikus stílusban, karcsú pillérekkel magasodott az égbe a Dunaparton – az alapos megfigyelés azonban tartogathat meglepetéseket. A helyszín a mai képen szinte szinte felismerhetetlen: a lebontásra került épület helyén ma az Erzsébet hídra vezető, forgalmas felüljáró található. Az egykori Eskü teret (amelyet ma Március 15. térként ismerünk), portékáikat kínáló árusok hangja, szaladgáló gyerekek nevetése, elszabadult élőállatok rikácsolása és szüntelenül alkudozó háziasszonyok hangja töltötte be, mivel gyakran rendeztek piacokat a mai Torony utca, Duna utca és a Hal tér csomópontjában. A kereskedelmi élet a korábbi feudális viszonyok felbomlása után épp ekkoriban virágzott fel, és nem meglepő módon szintén Budapest várt a központjává. Érdekes, hogy ez a környék a mai napig a vásárlás egyik fontos helyszíne, habár a hangulat gyökeresen megváltozott: Budáról érkező, illetve oda tartó buszok és autók, hatalmas tömegek, fényképezkedő turistacsoportok és hatalmas mennyiségű reklám tölti be az egyébként hajdanán nyüzsgőnek számító környéket."
                    realm.add(place7)

                    let place8 = Place(name: "Váczi utca", imageString: "vaczi", directoryNumber: "51.1127.1")
                    place8.painter = "Erdőssy Béla"
                    place8.datePainted = "1914"
                    place8.orderId = 7
                    place8.latitude = 47.494632
                    place8.longitude = 19.052119
                    place8.infoText = "Erdőssy Béla (1871-1928) a korszak nagymesterétől, Lotz Károlytól tanult a budapesti Mintarajziskolában, hogy később ő maga is kimagasló rézkarcokat és metszeteket alkosson. 1897-től egészen 1925-ig tanított a Képzőművészeti Főiskolán. Rendszeres résztvevője volt a Műcsarnok és a Nemzeti Szalon tárlatainak, de szerepeltek munkái Londonban, Berlinben és Lipcsében is. „Tarka vásári epizódokat és havas téli tájakat kevesen tudtak olyan megjelenítő erővel vászonra vinni, mint ő,” akinek „zamatos magyarságát nem rontotta meg a főváros”- írta róla később a Színházi Élet. Ezen az 1914-es festményén a csúszós, téli Váci utca észak-déli irányú részletét láthatjuk, a Duna utca felől. A fagyos fehérség hatását a nyomasztó, sötét épülettömegek pontozzák ellen. A havas úton nehézkesen haladó konflisok elől elhúzódnak a didergő járókelők. A festő sajátos módon megnövelte és átszínezte a képen a háttérből kiemelkedő Angolkisasszonyok templomát, amelyet ma Belvárosi Szent Mihály-templomként ismerhetünk. A jelenleg látható barokk stílusú templomot a török kiűzése után 1700-1765 között építették fel. Az 1785 és 1786 közötti időszakra a pálosok kapták meg az épületet, mert II. József magyar király feloszlatta a domonkos rendet. Majd 1787-ben az angolkisasszonyok tanító rendjéhez került. Miután 1945. augusztus 19-én az amerikai hadsereg visszaadta Magyarországnak a Salzburgban megtalált Szent Jobbot, azt a Szent Mihály-templomban őrizték az Angolkisasszonyok rendjének 1950-es feloszlatásáig. A 18. században épült katolikus templomban egy 1892-ben készült Rieger orgonát is megcsodálhatnak a hívek, illetve a rendszeresen tartott egyház-zeneművészeti események látogatói. A Váci utca Budapest legforgalmasabb sétálóutcája, mely a Vörösmarty teret köti össze a Vámház körúttal, már a 18. század végén a legdivatosabb vásárlóutcává alakult át. Az utca a festményen található szakasza, a Szabadsajtó út és a Fővám tér közé esik. Korábban hívták Rózsa utcának és Tyúk utcának is. Mai nevét 1899-ben kapta, amikor az északi-déli irányban végig haladó két utcát összevonták. A mai Váci utca déli részének képe sokat megőrzött a 19.századból, több klasszicista és eklektikus épület látható itt."
                    realm.add(place8)

                    let place9 = Place(name: "Kristóf tér", imageString: "kristof", directoryNumber: "2.492")
                    place9.painter = "Lechner Gyula"
                    place9.datePainted = "1901"
                    place9.orderId = 8
                    place9.latitude = 47.495281
                    place9.longitude = 19.052870
                    place9.infoText = "Lechner Gyula 1880-tól az Iparrajziskola tanára volt. Nem csak festő volt, hanem műfordító is. Ő fordította le német nyelvre az „Ember tragédiáját”. Festménye, a „Kristóf tér” az 1884-85-ös látképpályázaton szerepelt. Ugyan a fővárosi tanács nem e mű megvétele mellett döntött, a Fővárosi Múzeum viszont megvásárolta a művésztől gyűjteménye számára a képet, 1909-ben. Ahogy több európai nagyvárosban, úgy Budapesten is divat volt az utcákat és a tereket az ott található vendéglőről vagy üzletről elnevezni. Itt is ez történt. A festményen szereplő tér a nevét a mai Váci utca 6. szám alatt működött patikáról kapta. Az 1791-ben megnyílt patika cégérén Szent Kristóf volt. A 19.században az épület új tulajdonoshoz került, és újjá lett építve. A ház legfeltűnőbb helyére, a sarkára ekkor került fel a Bauer Mihály kőfaragó által készített hatalmas méretű, Szent Kristófot ábrázoló szobor. A műalkotás olyan feltűnést keltett, hogy a korabeli polgárok is a csodájára jártak. Többször írtak is róla valamelyik sajtóban. „Más rosz szivek azt állították gunyosan, hogy Nagy Kristóf tulajdonkép valamely híres úszómester emlékszobra. A magyar viselet korában a közgúny kicsapongása annyira ment, hogy nyilvánosan szóba lőn hozva a Nagy Kristóf mezítelen bőrének magyaros divat szerint való körülsujtásolása és beszarufázása, nehogy botrányos zsinórtalansága a közönséget nemzeti önérzetében továb is sértegethesse.” Írta Hevesi Lajos újságíró a szoborról, egy 1876-ban megjelent munkájában. Az épületet 1909-ben lebontották. A szobor először a Központi Városháza udvarára került. A második világháborúban azonban eltűnt. A Kristóf tér másik érdekes épülete volt Pest első háromemeletes háza. Az eredetileg egy emeletes épületet tulajdonosa, Bene Ferenc orvosprofesszor, az 1838-as árvizet követően átépítette. Hild Józsefet, a kor híres klasszicista építészét bízta meg az új, az előzőnél magasabb és szebb épület megtervezésével. Még egy érdekesség a térrel kapcsolatban. Egy rendszerváltás előtt keletkezett dokumentum alapján, a tér nevét egy helyi elöljáró meg szerette volna változtatni, hogy az ne egy szent nevét viselje. „Már átiratot küldtünk a Munkásmozgalmi Intézetnek, hogy küldjön részünkre névsort azokról a mártír halált halt elvtársakról, akik ebben a kerületben lelték halálukat, úgy a 19-es forradalom után, mint a fasizmus ideje alatt, hogy azokról nevezhessünk el utcákat.” A tér azonban máig megtartotta nevét."
                    realm.add(place9)

                    let place10 = Place(name: "Operaház", imageString: "operahaz", directoryNumber: "24166")
                    place10.painter = "Schickedanz Albert"
                    place10.datePainted = "1890"
                    place10.orderId = 9
                    place10.latitude = 47.503250
                    place10.longitude = 19.060578
                    place10.infoText = "Schickedanz Albert az Operaházról alkotott festményét az 1884-85. évi budapesti látképpályázatra festette.  Az épület jobb oldalán jól kivehető, a Hajós utcában nyílt Opera Kávéház. Ez a vendéglátóhely lett a törzshelye az Operaház énekeseinek, zenészeinek és karnagyainak.  A festmény 1944-ben került a mai Budapesti Történeti Múzeum tulajdonába, a festő lányától, Schickedanz Vilmától. Az Operaház megépítésének gondolata 1830-as években merült fel először, amikor úgy határoztak, ne szerepeljenek operák, csak prózai művek a Nemzeti Színház repertoárjában.  Végül az 1870-es években, Lónyai Menyhért miniszterelnök bízta meg a Nemzeti Színház igazgatóját, hogy tegyen javaslatot a leendő Operaház helyének kijelöléséről. A lehetséges helyszínek közül végül, az egykori Hermina tér mellett döntött az akkori kormány. Ennek oka, hogy a telek, melyen megvalósulhatott az építkezés, a legolcsóbb variáció volt. A telek akkor még üresen állt, így azonnal elkezdődhetett az építkezés. Az 1873-ban meghirdetett nemzetközi tervpályázaton végül a zsűri Ybl Miklós terveit fogadta el. A kivitelezés nem volt egyszerű feladat, mert a hatalmas épületet egy kicsi téren kellett felépíteni. Csak magyar iparosok és művészek közreműködésével valósulhatott meg az építkezés, az építési bizottság külön kikötése alapján. A gyönyörű barokk és neoreneszánsz épület építését a korabeli sajtó végig nagy figyelemmel kísérte végig. „... Hogy mikor készül el az épület teljesen, az attól függ, vajon a költségfedezet folytonos kiszolgáltatásban nem lesz-e fennakadás. Ez esetben három év alatt kész dalműszínházunk van, s Magyarország fővárosa e tekintetben is a nyugati világvárosok mellé sorakozik...”- írta meg a Vasárnapi újság 1879-ben. Ám az építkezés csak 1884-ben fejeződhetett be. Főhomlokzatán, ma is megtalálható a háromárkádos kocsifelhajtó, és tetején a terasz. Az épület bal oldalán az úgynevezett királyi lépcsőház, míg jobb oldalán a művészbejáró látható. Ide kerültek Liszt Ferenc és Erkel Ferenc szobrai, melyek Stróbl Alajos alkotásai. Ma már a megnyitáshoz képest nem ezek az alkotások találhatóak a fő párkánynál. Az 1940-es években ugyanis, a rossz minőségi anyagokra hivatkozva (az egyik szétmállott), minden szobrot eltávolítottak. Csak több mint húsz évvel később kaptak helyet új szobrok az eredetiek helyébe. Lengyel, cseh és orosz művészek kerültek a régiek utódaiként, a kor szellemének megfelelően. Az Operaház belső megjelenése éppoly impozáns, mint a külseje. Lotz Károly egyik fő műve, az „ Apolló az Olümposzon” című freskó lett megfestve a nézőtér mennyezetére, mely még a mai napig is látható. Than Mór, Székely Bertalan, Scholtz Róber és Aggházy Gyula is részt vettek az épület belső faldíszítésében, akik a kor kiemelkedő művészei voltak. 1960-ban az Operaház egy nagy külső és belső rekonstrukción esett át. Felújítása folyamatosan tart."
                    realm.add(place10)
                }
            } else {
                logger("Realm already initialized with \(realm.objects(Place.self).count) objects.")
            }
        } catch {
            logger("Realm init failed")
        }
    }
}


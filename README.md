# DefineX_iOS_case

 Proje geliştirilirken programmaticallyUI yakalaşımıyla geliştirilmiştir ve StoryBoard kullanılmamıştır.ProgrammaticallyUI, StroyBoard kullanırken birden fazla kişinin çalıştığı projelerde Merge Conflict hatalarını olabildiğince azaltabilmek amacıyla düşünülerek uygulanmıştır.

 -Set Up Proje

 Projeyi clone ettikten sonra SwiftGen klasörünü siliniz (içerisinde ki Assets ve strings file'ları da silinmiş olacak). Silmiş olduğunuz hiyerarşide tekrar boş bir SwiftGen klasörü oluşturunuz.("Pods/SwiftGen/bin/swiftgen" command'i ile tekrardan run etme adımı mevcut)
 -
 İlk önce Terminal -> $ Pod dosyaları için pod install  
 -
 SwiftGen için Terminal -> $ Pods/SwiftGen/bin/swiftgen 
 -
 Finder'dan Proje içerisinde SwiftGen dosyasını bulunuz, içerisinde oluşan Asset file ve strings file'ı Xcode içerisinde en başta içerisini silmiş olduğumuz SwiftGen Folder'a sürükleyerek bırakın.


<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/054b7959-2bd8-4e0e-9c44-1f835fa02628.png" alt="Swagger" width="900" height="500"/>


 -<h2>Package Management</h2> 

  - Package Managers
   - SPM(Swift Package Manager)
   - 3rd Part Libraries:
     - Alamofire
     - SDWebImage
     - SkyFloatingLabelTextField
     - SnapKit
  - Homebrew
   - 3rd Party Libraries:
     - Swiftlint
  
  - CocoaPods
   - 3rd Part Libraries:
     - SwiftGen
     - SwiftMessages
     - Firebase
     - Firebase/Core
     - Firebase/Analytics
     - Firebase/Crashlytics
     - Firebase/RemoteConfig
     - Firebase/Messaging
   
 # Private Youtube Video Link
<h2>Video Link</h2>   
   -Link : https://youtu.be/yC0EWJLi7PM

# DefineX - SCENES
<h2>Login Screen</h2> 

- END POINT olmayan butonlar için "Coming Soon" ya da "Çok Yakında" yazısı ile Ekranın Üst tarafında AlertView basıldı.
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/99a526b5-ee74-44dd-b9d8-57ebd0f334e1.png" alt="Swagger" width="200" height="400"/>


- Düzgün formatta e-mail değeri girildiğinde e-mail UITextField'ının alt çizgisi yeşil renge dönüştürülüyor(-en).
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/850a62e7-4868-4323-b946-e325790ea77b.png" alt="Swagger" width="200" height="400"/>
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/018875f0-b800-4e53-90c9-a1e49c735a03.png" alt="Swagger" width="200" height="400"/>


<h2>Discover Screen</h2> 
 <h3> - DiscoverScene açıldı(-EN).</h3>
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/bacc7811-ccd6-4646-82b9-1cc1657d0fb7.png" alt="Swagger" width="200" height="400"/>

 <h3> - DiscoverScene açıldı(-TR).</h3>
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/8b19d4e8-9639-410f-bd33-a52a0deef1c6" alt="Swagger" width="200" height="400"/>


Firebase Tracker implement edildi ve görüntülenen controller  verileri FirebaseAnalytics'e loglandı. 
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/e830569a-3f06-4994-83f5-0a9d0d30cf18.png" alt="Swagger" width="900" height="500"/>
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/bbbb18e4-06c6-4d5c-aa1d-e23caede92ea.png" alt="Swagger" width="900" height="500"/>


# DefineX_iOS_case

 Proje geliştirilirken programmaticallyUI yakalşımıyla geliştirilmiştir ve StoryBoard kullanılmamıştır.ProgrammaticallyUI, StroyBoard kullanırken birden fazla kişinin çalıştığı projelerde Merge Conflict hatalarını olabildiğince azaltabilmek amacıyla düşünülerek uygulanmıştır.

- Package Managers
  - SPM(Swift Package Manager)
  - Kullanılılan 3rd Part Libraries:
    - Alamofire
    - SDWebImage
    - SkyFloatingLabelTextField
    - SnapKit
- Homebrew
  - Kullanılılan 3rd Part Libraries:
    Swiftlint

- CocoaPods
  - Kullanılılan 3rd Part Libraries:
    - SwiftGen
    - SwiftMessages
    - Firebase
    - Firebase/Core
    - Firebase/Analytics
    - Firebase/Crashlytics
    - Firebase/RemoteConfig
    - Firebase/Messaging
   
# DefineX - SCENES
<h2>Login Screen</h2> 

- END POINT olmayan butonlar için "Coming Soon" ya da "Çok Yakında" yazısı ile Ekranın Üst tarafında AlertView basıldı.
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/99a526b5-ee74-44dd-b9d8-57ebd0f334e1.png" alt="Swagger" width="200" height="400"/>


- Düzgün formatta e-mail değeri girildiğinde e-mail UITextField'ının alt çizgisi yeşil renge dönüştürülüyor(-en).
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/850a62e7-4868-4323-b946-e325790ea77b.png" alt="Swagger" width="200" height="400"/>
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/018875f0-b800-4e53-90c9-a1e49c735a03.png" alt="Swagger" width="200" height="400"/>


<h2>Discover Screen</h2> 
- DiscoverScene açıldı(-en)
<img src="https://github.com/nbaciyarkin/DefineX_iOS_case/assets/60100510/bacc7811-ccd6-4646-82b9-1cc1657d0fb7.png" alt="Swagger" width="200" height="400"/>


- TextFiled'a en az 3 kelime girildikten sonra filmler listelenmeye başlıyor

<img src="https://user-images.githubusercontent.com/60100510/222155855-ab1ce775-5421-4b45-b445-2f71187879f8.png" alt="Swagger" width="200" height="400"/>  <img src="https://user-images.githubusercontent.com/60100510/222156099-2ee222ab-6ef1-4598-8b68-162a2f35483d.png" alt="Swagger" width="200" height="400"/>

<h2>Movie Detail Screen</h2> 
<img src="https://user-images.githubusercontent.com/60100510/222156711-60e50090-2ed0-4364-b3d0-e3df45abca4e.png" alt="Swagger" width="200" height="400"/>

Firebase Tracker implement edildi ve görüntülenen film detayı verileri FirebaseAnalytics'e loglandı. 
<img src="https://user-images.githubusercontent.com/60100510/222160313-4b43f482-b04c-4a0d-9c79-3feb8d84a2ab.png" alt="Swagger" width="900" height="500"/>

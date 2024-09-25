# eschool

//to run the application
```shell
flutter run
```

//To update iOS pods
```shell
cd ios
pod init
pod update
pod install
cd ..
```

//To clean the pub cache
```shell
flutter clean
flutter pub cache clean
flutter pub get
```

//To repair the pub cache
```shell
flutter clean
flutter pub cache repair
flutter pub get
```

//to generate android application
```shell
flutter build apk --split-per-abi
open  build/app/outputs/flutter-apk/
```

// to solve most common iOS errors
```shell
flutter clean
rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Flutter/Flutter.framework
rm -Rf Flutter/Flutter.podspec
rm ios/podfile.lock
cd ios 
pod deintegrate
sudo rm -rf ~/Library/Developer/Xcode/DerivedData
flutter pub cache repair
flutter pub get 
pod install 
pod update 
```

# Update

* 23/9/24
- mengubah tema tampilan apps
- mengubah nama mapel menjadi kode mapel
- memperbaiki font dan button, yang dimana pada beberapa device menjadi overflow
- memperbaiki konsistensi detail siswa
- memperbaiki konsistensi beberapa ui
- mengubah desain button pada page Tugas
- mengubah beberapa warna svg Ketika timed out, dan kode 500 page
- mengganti dependenci flutter_windowmanager yang tidak support ke window_manager
- mengganti dependenci carousel_slider yang tidak support ke carousel_slider_plus
- mengganti versi flutter_inappwebview ke any



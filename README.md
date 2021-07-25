
 ```
     __  ___                      ________          __   
    /  |/  /___ _______   _____  / / ____/___  ____/ /__ 
   / /|_/ / __ `/ ___/ | / / _ \/ / /   / __ \/ __  / _ \
  / /  / / /_/ / /   | |/ /  __/ / /___/ /_/ / /_/ /  __/
 /_/  /_/\__,_/_/    |___/\___/_/\____/\____/\__,_/\___/ 
                                                                                                                                         
```                                                      
Code testing using MarvelAPI.

# Project info
> - Xcode 12.4
> - Swift 5.3
> - MVVM
> - Swift Package Manager

<br/>

# Architecture: MVVM

The architecture MVVM (Model, View, ViewModel) is the future of almost all projects in iOS platform. The transition to SwiftUI and Combine is clear, but this architecture has some reasons for use it with traditional iOS projects.
Is very simple, and make easy follow it for junior members and they will feel comfortable usign it, being more difficult that them will not to follow it.
Takes less steps in comparison of Clean Architectures, that needs to jump across 5 classes for do a simple task. That means less files, less project scheme complexity.
In addition, it's very organized, and it is easy to find everything, because everything has a proper place to be placed.

I could have use others like VIP, VIPER (Clean), even Coordinator pattern, but MVVM is the best way to prepare the project  for evolutives and avoid to have to drop it to bin and make a new one when the new frameworks being usual.

<br/>

# Swift Package Manager

SPM is the native framework for product distribution officially released almost two years ago by Apple.

The concept of modulairzation and reusability should be clear for take advantage of this and get most out of it.

In this project, I’ve made a main package named 'MarvelPackage’ composed of several libs. The limitation of this project has been the requirement of use only one repository, saved by the possibility of build a multi-target package for separate and isolate each product into the same package. Ideally, each product have one package, and also one repository, but isnt a problem for SPM.

## ReachabilityManager
Library for manage the Internet reachability. Based on **NWPathMonitor**, has a delegate and a simple protocol for learn in real time the network state.


## Helpers
Library where put all helpers that I use in the project, simple.

## MarvelUIKitManager
This lib contains all about UIKit objects make custom for the project. UI Components, fonts, resources and utils.

</br>

# My own SPM packages as third party
I have included several packages developed by myself that have been very useful. This packages are published at main websites for  manage a public catalog of SPM products (similar to Cocoapods) for some time now. 

Next, I list them with the link to the repositories where you can find both source code and proper documentation at the readme.md’s.
## [SimplyLogger](https://github.com/CodeNationDev/SimplyLogger.git)
## [SwiftMagicHelpers](https://github.com/CodeNationDev/SwiftMagicHelpers.git)
## [IntegritySwift](https://github.com/CodeNationDev/IntegritySwift.git)

I will also put here the links to the sites where they are published (and some others more).

[**Switft Package Index - CodeNationDev**](https://swiftpackageindex.com/search?query=CodeNationDev)
<br>
[**Switft Package Registry - CodeNationDev**](https://swiftpackageregistry.com/search?term=CodeNationDev)

# Real 3rd Party SPM
- Alamofire
- CryptoSwift


## Meta

David Martin Saiz - [LinkedIN](https://www.linkedin.com/in/david-martin-saiz/) - [eMail](davms81@gmail.com)

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/CodeNationDev/](https://github.com/CodeNationDev)

## Version History
* 0.0.1
  * [Add changes]

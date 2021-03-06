//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 10 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `Acessorios`.
    static let acessorios = Rswift.ColorResource(bundle: R.hostingBundle, name: "Acessorios")
    /// Color `Cafes`.
    static let cafes = Rswift.ColorResource(bundle: R.hostingBundle, name: "Cafes")
    /// Color `FundoCinza`.
    static let fundoCinza = Rswift.ColorResource(bundle: R.hostingBundle, name: "FundoCinza")
    /// Color `Maquinas`.
    static let maquinas = Rswift.ColorResource(bundle: R.hostingBundle, name: "Maquinas")
    /// Color `TextoCinzaEscuro`.
    static let textoCinzaEscuro = Rswift.ColorResource(bundle: R.hostingBundle, name: "TextoCinzaEscuro")
    /// Color `TextoDiscreto`.
    static let textoDiscreto = Rswift.ColorResource(bundle: R.hostingBundle, name: "TextoDiscreto")
    /// Color `TextoEscuro`.
    static let textoEscuro = Rswift.ColorResource(bundle: R.hostingBundle, name: "TextoEscuro")
    /// Color `VerdeDinheiro`.
    static let verdeDinheiro = Rswift.ColorResource(bundle: R.hostingBundle, name: "VerdeDinheiro")
    /// Color `VermelhoAmor`.
    static let vermelhoAmor = Rswift.ColorResource(bundle: R.hostingBundle, name: "VermelhoAmor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Acessorios", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func acessorios(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.acessorios, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Cafes", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cafes(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cafes, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "FundoCinza", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func fundoCinza(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.fundoCinza, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Maquinas", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func maquinas(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.maquinas, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "TextoCinzaEscuro", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func textoCinzaEscuro(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.textoCinzaEscuro, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "TextoDiscreto", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func textoDiscreto(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.textoDiscreto, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "TextoEscuro", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func textoEscuro(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.textoEscuro, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "VerdeDinheiro", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func verdeDinheiro(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.verdeDinheiro, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "VermelhoAmor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vermelhoAmor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vermelhoAmor, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 10 files.
  struct file {
    /// Resource file `OpenSans-Bold.ttf`.
    static let openSansBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Bold", pathExtension: "ttf")
    /// Resource file `OpenSans-BoldItalic.ttf`.
    static let openSansBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-BoldItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-ExtraBold.ttf`.
    static let openSansExtraBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-ExtraBold", pathExtension: "ttf")
    /// Resource file `OpenSans-ExtraBoldItalic.ttf`.
    static let openSansExtraBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-ExtraBoldItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-Italic.ttf`.
    static let openSansItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Italic", pathExtension: "ttf")
    /// Resource file `OpenSans-Light.ttf`.
    static let openSansLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Light", pathExtension: "ttf")
    /// Resource file `OpenSans-LightItalic.ttf`.
    static let openSansLightItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-LightItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-Regular.ttf`.
    static let openSansRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Regular", pathExtension: "ttf")
    /// Resource file `OpenSans-SemiBold.ttf`.
    static let openSansSemiBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-SemiBold", pathExtension: "ttf")
    /// Resource file `OpenSans-SemiBoldItalic.ttf`.
    static let openSansSemiBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-SemiBoldItalic", pathExtension: "ttf")

    /// `bundle.url(forResource: "OpenSans-Bold", withExtension: "ttf")`
    static func openSansBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-BoldItalic", withExtension: "ttf")`
    static func openSansBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-ExtraBold", withExtension: "ttf")`
    static func openSansExtraBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansExtraBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-ExtraBoldItalic", withExtension: "ttf")`
    static func openSansExtraBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansExtraBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Italic", withExtension: "ttf")`
    static func openSansItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Light", withExtension: "ttf")`
    static func openSansLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-LightItalic", withExtension: "ttf")`
    static func openSansLightItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansLightItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Regular", withExtension: "ttf")`
    static func openSansRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-SemiBold", withExtension: "ttf")`
    static func openSansSemiBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansSemiBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-SemiBoldItalic", withExtension: "ttf")`
    static func openSansSemiBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansSemiBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 10 fonts.
  struct font: Rswift.Validatable {
    /// Font `OpenSans-BoldItalic`.
    static let openSansBoldItalic = Rswift.FontResource(fontName: "OpenSans-BoldItalic")
    /// Font `OpenSans-Bold`.
    static let openSansBold = Rswift.FontResource(fontName: "OpenSans-Bold")
    /// Font `OpenSans-ExtraBoldItalic`.
    static let openSansExtraBoldItalic = Rswift.FontResource(fontName: "OpenSans-ExtraBoldItalic")
    /// Font `OpenSans-ExtraBold`.
    static let openSansExtraBold = Rswift.FontResource(fontName: "OpenSans-ExtraBold")
    /// Font `OpenSans-Italic`.
    static let openSansItalic = Rswift.FontResource(fontName: "OpenSans-Italic")
    /// Font `OpenSans-LightItalic`.
    static let openSansLightItalic = Rswift.FontResource(fontName: "OpenSans-LightItalic")
    /// Font `OpenSans-Light`.
    static let openSansLight = Rswift.FontResource(fontName: "OpenSans-Light")
    /// Font `OpenSans-Regular`.
    static let openSansRegular = Rswift.FontResource(fontName: "OpenSans-Regular")
    /// Font `OpenSans-SemiBoldItalic`.
    static let openSansSemiBoldItalic = Rswift.FontResource(fontName: "OpenSans-SemiBoldItalic")
    /// Font `OpenSans-SemiBold`.
    static let openSansSemiBold = Rswift.FontResource(fontName: "OpenSans-SemiBold")

    /// `UIFont(name: "OpenSans-Bold", size: ...)`
    static func openSansBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansBold, size: size)
    }

    /// `UIFont(name: "OpenSans-BoldItalic", size: ...)`
    static func openSansBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansBoldItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-ExtraBold", size: ...)`
    static func openSansExtraBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansExtraBold, size: size)
    }

    /// `UIFont(name: "OpenSans-ExtraBoldItalic", size: ...)`
    static func openSansExtraBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansExtraBoldItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-Italic", size: ...)`
    static func openSansItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-Light", size: ...)`
    static func openSansLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansLight, size: size)
    }

    /// `UIFont(name: "OpenSans-LightItalic", size: ...)`
    static func openSansLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansLightItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-Regular", size: ...)`
    static func openSansRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansRegular, size: size)
    }

    /// `UIFont(name: "OpenSans-SemiBold", size: ...)`
    static func openSansSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansSemiBold, size: size)
    }

    /// `UIFont(name: "OpenSans-SemiBoldItalic", size: ...)`
    static func openSansSemiBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansSemiBoldItalic, size: size)
    }

    static func validate() throws {
      if R.font.openSansBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Bold' could not be loaded, is 'OpenSans-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-BoldItalic' could not be loaded, is 'OpenSans-BoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansExtraBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-ExtraBold' could not be loaded, is 'OpenSans-ExtraBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansExtraBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-ExtraBoldItalic' could not be loaded, is 'OpenSans-ExtraBoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Italic' could not be loaded, is 'OpenSans-Italic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Light' could not be loaded, is 'OpenSans-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-LightItalic' could not be loaded, is 'OpenSans-LightItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Regular' could not be loaded, is 'OpenSans-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-SemiBold' could not be loaded, is 'OpenSans-SemiBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansSemiBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-SemiBoldItalic' could not be loaded, is 'OpenSans-SemiBoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `capsulas-inicio`.
    static let capsulasInicio = Rswift.ImageResource(bundle: R.hostingBundle, name: "capsulas-inicio")
    /// Image `maquina-inicio`.
    static let maquinaInicio = Rswift.ImageResource(bundle: R.hostingBundle, name: "maquina-inicio")
    /// Image `xicaras-inicio`.
    static let xicarasInicio = Rswift.ImageResource(bundle: R.hostingBundle, name: "xicaras-inicio")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "capsulas-inicio", bundle: ..., traitCollection: ...)`
    static func capsulasInicio(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.capsulasInicio, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "maquina-inicio", bundle: ..., traitCollection: ...)`
    static func maquinaInicio(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.maquinaInicio, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "xicaras-inicio", bundle: ..., traitCollection: ...)`
    static func xicarasInicio(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.xicarasInicio, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `CategoriaDeCafeHeaderView`.
    static let categoriaDeCafeHeaderView = _R.nib._CategoriaDeCafeHeaderView()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CategoriaDeCafeHeaderView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.categoriaDeCafeHeaderView) instead")
    static func categoriaDeCafeHeaderView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.categoriaDeCafeHeaderView)
    }
    #endif

    static func categoriaDeCafeHeaderView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CategoriaDeCafeHeaderView? {
      return R.nib.categoriaDeCafeHeaderView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CategoriaDeCafeHeaderView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `cafe-cell`.
    static let cafeCell: Rswift.ReuseIdentifier<CafeTableViewCell> = Rswift.ReuseIdentifier(identifier: "cafe-cell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _CategoriaDeCafeHeaderView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CategoriaDeCafeHeaderView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CategoriaDeCafeHeaderView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CategoriaDeCafeHeaderView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController

      let bundle = R.hostingBundle
      let detalheCafeViewController = StoryboardViewControllerResource<DetalheCafeViewController>(identifier: "DetalheCafeViewController")
      let name = "Main"

      func detalheCafeViewController(_: Void = ()) -> DetalheCafeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: detalheCafeViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "bag.badge.plus", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'bag.badge.plus' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "capsulas-inicio", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'capsulas-inicio' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "cart", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'cart' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "heart", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'heart' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "maquina-inicio", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'maquina-inicio' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "xicaras-inicio", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'xicaras-inicio' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "Acessorios", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Acessorios' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Cafes", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Cafes' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Maquinas", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Maquinas' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "TextoCinzaEscuro", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'TextoCinzaEscuro' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "TextoDiscreto", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'TextoDiscreto' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "TextoEscuro", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'TextoEscuro' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "VerdeDinheiro", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'VerdeDinheiro' is used in storyboard 'Main', but couldn't be loaded.") }
        }
        if _R.storyboard.main().detalheCafeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'detalheCafeViewController' could not be loaded from storyboard 'Main' as 'DetalheCafeViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}

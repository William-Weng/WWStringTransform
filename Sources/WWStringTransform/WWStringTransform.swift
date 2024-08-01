// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// MARK: - 文字轉換 (簡體 <=> 拉丁文 <=> 正體 <=> 拼音 <=> 注音)
open class WWStringTransform: NSObject {
    
    /// 文字轉換類型
    public enum StringTransformType {
        
        case latin                      // 拉丁文 (金城武 => jīn chéng wǔ)
        case english                    // 英文 (金城武 => jin cheng wu)
        case pinyin                     // 拼音 (金城武 => jīn chéng wǔ)
        case bopomofo                   // 注音 (金城武 => ㄐㄧㄣ ㄔㄥˊ ㄨˇ)
        case hansHant                   // 正體中文 (與你相遇好幸運 => 与你相遇好幸运)
        case hantHans                   // 簡體中文 (与你相遇好幸运 => 與你相遇好幸運)
        case custom(_ keyWord: String)  // 自訂關鍵字
        
        /// [文字轉換](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-stringtransform-icu-string-transform-做文字轉換-拼音-注音-繁簡轉換-bfbb78e4678e)
        /// - Parameters:
        ///   - text: 要轉換的文字
        ///   - type: 要轉成什麼類型
        ///   - reverse: 文字反轉
        /// - Returns: String?
        func transformText(_ text: String, type: StringTransformType, reverse: Bool = false) -> String? {
            
            switch type {
            case .latin: return _latin(text: text, reverse: reverse)
            case .english: return _english(text: text, reverse: reverse)
            default:
                let transform = StringTransform(type.keyWord())
                return text.applyingTransform(transform, reverse: reverse)
            }
        }
        
        /// 類型關鍵字
        /// - Returns: String
        private func keyWord() -> String {
            
            switch self {
            case .latin: return ""
            case .english: return ""
            case .pinyin: return "Han-Latin"
            case .bopomofo: return "Latin;Bopomofo"
            case .hantHans: return "Hant-Hans"
            case .hansHant: return "Hans-Hant"
            case .custom(let keyWord): return keyWord
            }
        }
        
        /// [轉成拉丁文 / 金城武 => jīn chéng wǔ](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-stringtransform-icu-string-transform-做文字轉換-拼音-注音-繁簡轉換-bfbb78e4678e)
        /// - Parameters:
        ///   - text: 要轉換的文字
        ///   - reverse: 文字反轉
        /// - Returns: String?
        private func _latin(text: String, reverse: Bool = false) -> String? {
            return text.applyingTransform(.toLatin, reverse: reverse)
        }
        
        /// 轉成英文拚音 / 金城武 => jin cheng wu
        /// - Parameters:
        ///   - text: 要轉換的文字
        ///   - reverse: 文字反轉
        /// - Returns: String?
        private func _english(text: String, reverse: Bool = false) -> String? {
            return self._latin(text: text)?.applyingTransform(.stripCombiningMarks, reverse: reverse)
        }
    }
    
    public static let shared = WWStringTransform()
    
    private override init() { super.init() }
}

// MARK: - 公開函式
public extension WWStringTransform {
    
    /// [文字轉換](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-stringtransform-icu-string-transform-做文字轉換-拼音-注音-繁簡轉換-bfbb78e4678e)
    /// - Parameters:
    ///   - text: 要轉換的文字
    ///   - type: 要轉成什麼類型
    ///   - reverse: 文字反轉
    /// - Returns: String?
    func convertText(_ text: String?, type: StringTransformType, reverse: Bool = false) -> String? {
        guard let text = text else { return nil }
        return type.transformText(text, type: type, reverse: reverse)
    }
}

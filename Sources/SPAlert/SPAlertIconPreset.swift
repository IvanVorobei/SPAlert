// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (varabeis@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum SPAlertIconPreset: CaseIterable {
    
    case done
    case heart
    
    case custom(_ image: UIImage)
    
    // MARK: - CaseIterable
    
    public static var allCases: [SPAlertIconPreset] {
        return [.done, .heart]
    }
}

public extension SPAlertIconPreset {
    
    func createView() -> UIView {
        switch self {
        case .done: return SPAlertIconDoneView()
        case .heart: return SPAlertIconDoneView()
        case .custom(let image):
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
    }
}

public extension SPAlertLayout {
    
    convenience init() {
        self.init(iconSize: .init(width: 100, height: 100), margins: .init(top: 43, left: 16, bottom: 25, right: 16), spaceBetweenIconAndTitle: 41)
    }
    
    convenience init(for preset: SPAlertIconPreset) {
        switch preset {
        case .done:
            self.init(
                iconSize: .init(width: 112, height: 112),
                margins: .init(top: 63, left: Self.defaultHorizontalInset, bottom: 29, right: Self.defaultHorizontalInset),
                spaceBetweenIconAndTitle: 35
            )
        case .heart:
            self.init(
                iconSize: .init(width: 112, height: 77),
                margins: .init(top: 49, left: Self.defaultHorizontalInset, bottom: 25, right: Self.defaultHorizontalInset),
                spaceBetweenIconAndTitle: 35
            )
        default:
            self.init()
        }
    }
    
    private static var defaultHorizontalInset: CGFloat { return 16 }
}
//
// Copyright (c) 2024 MyLittleSuite
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//

class ArgumentsServiceImpl: NSObject, ArgumentsService {
    func getString(key: String) throws -> String? {
        let dict = UserDefaults.standard.dictionaryRepresentation()

        if (dict[key] != nil) {
            return UserDefaults.standard.string(forKey: key)
        }

        return nil
    }

    func getBool(key: String) throws -> Bool? {
        let dict = UserDefaults.standard.dictionaryRepresentation()
        guard let value = dict[key] else { return nil }

        switch value {
        case let boolValue as Bool:
            return boolValue
        case let stringValue as String:
            switch stringValue.lowercased() {
            case "true": return true
            case "false": return false
            default: return nil
            }
        default:
            return nil
        }
    }

    func getInt(key: String) throws -> Int64? {
        let dict = UserDefaults.standard.dictionaryRepresentation()
        guard let value = dict[key] else { return nil }

        switch value {
        case let numberValue as NSNumber:
            if CFGetTypeID(numberValue) == CFBooleanGetTypeID() { return nil }
            return numberValue.int64Value
        case let stringValue as String:
            return Int64(stringValue)
        default:
            return nil
        }
    }

    func getDouble(key: String) throws -> Double? {
        let dict = UserDefaults.standard.dictionaryRepresentation()
        guard let value = dict[key] else { return nil }

        switch value {
        case let numberValue as NSNumber:
            if CFGetTypeID(numberValue) == CFBooleanGetTypeID() { return nil }
            return numberValue.doubleValue
        case let stringValue as String:
            return Double(stringValue)
        default:
            return nil
        }
    }
}

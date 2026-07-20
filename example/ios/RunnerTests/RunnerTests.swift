import Flutter
import UIKit
import XCTest

@testable import flutter_launch_arguments

// Unit tests for ArgumentsServiceImpl, run via the example app's Xcode project.
// See https://docs.flutter.dev/testing/testing-plugins for why plugin XCTests
// live under example/ios/RunnerTests instead of the plugin package itself.

class RunnerTests: XCTestCase {

    private let service = ArgumentsServiceImpl()

    private func setDefault(_ value: Any?, forKey key: String) {
        if let value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }

    override func tearDown() {
        for key in ["flag", "count", "ratio", "name"] {
            UserDefaults.standard.removeObject(forKey: key)
        }
        super.tearDown()
    }

    // MARK: - getBool

    func testGetBool_realBooleanExtra_returnsValue() throws {
        setDefault(true, forKey: "flag")
        XCTAssertEqual(try service.getBool(key: "flag"), true)
    }

    func testGetBool_stringLowercaseTrue_returnsTrue() throws {
        setDefault("true", forKey: "flag")
        XCTAssertEqual(try service.getBool(key: "flag"), true)
    }

    func testGetBool_stringTitleCaseTrue_returnsTrue() throws {
        setDefault("True", forKey: "flag")
        XCTAssertEqual(try service.getBool(key: "flag"), true)
    }

    func testGetBool_stringUppercaseTrue_returnsTrue() throws {
        setDefault("TRUE", forKey: "flag")
        XCTAssertEqual(try service.getBool(key: "flag"), true)
    }

    func testGetBool_stringFalse_returnsFalse() throws {
        setDefault("false", forKey: "flag")
        XCTAssertEqual(try service.getBool(key: "flag"), false)
    }

    func testGetBool_unparseableString_returnsNil() throws {
        setDefault("yes", forKey: "flag")
        XCTAssertNil(try service.getBool(key: "flag"))
    }

    func testGetBool_missingKey_returnsNil() throws {
        setDefault(nil, forKey: "flag")
        XCTAssertNil(try service.getBool(key: "flag"))
    }

    // MARK: - getInt

    func testGetInt_realIntExtra_returnsValue() throws {
        setDefault(42, forKey: "count")
        XCTAssertEqual(try service.getInt(key: "count"), 42)
    }

    func testGetInt_stringExtra_returnsParsedValue() throws {
        setDefault("42", forKey: "count")
        XCTAssertEqual(try service.getInt(key: "count"), 42)
    }

    func testGetInt_unparseableString_returnsNil() throws {
        setDefault("not-a-number", forKey: "count")
        XCTAssertNil(try service.getInt(key: "count"))
    }

    func testGetInt_missingKey_returnsNil() throws {
        setDefault(nil, forKey: "count")
        XCTAssertNil(try service.getInt(key: "count"))
    }

    // MARK: - getDouble

    func testGetDouble_realDoubleExtra_returnsValue() throws {
        setDefault(3.14, forKey: "ratio")
        XCTAssertEqual(try service.getDouble(key: "ratio"), 3.14)
    }

    func testGetDouble_stringExtra_returnsParsedValue() throws {
        setDefault("3.14", forKey: "ratio")
        XCTAssertEqual(try service.getDouble(key: "ratio"), 3.14)
    }

    func testGetDouble_unparseableString_returnsNil() throws {
        setDefault("not-a-number", forKey: "ratio")
        XCTAssertNil(try service.getDouble(key: "ratio"))
    }

    func testGetDouble_missingKey_returnsNil() throws {
        setDefault(nil, forKey: "ratio")
        XCTAssertNil(try service.getDouble(key: "ratio"))
    }

    // MARK: - getString (regression guard)

    func testGetString_realStringExtra_returnsValue() throws {
        setDefault("value", forKey: "name")
        XCTAssertEqual(try service.getString(key: "name"), "value")
    }

    func testGetString_missingKey_returnsNil() throws {
        setDefault(nil, forKey: "name")
        XCTAssertNil(try service.getString(key: "name"))
    }
}

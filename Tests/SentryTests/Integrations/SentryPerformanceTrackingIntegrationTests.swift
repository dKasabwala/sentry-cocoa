import XCTest

class SentryPerformanceTrackingIntegrationTests: XCTestCase {
    
#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
    func testSwizzlingInitialized_WhenAPMandTracingEnabled() {
        let sut = SentryPerformanceTrackingIntegration()
        
        let options = Options()
        options.tracesSampleRate = 0.1
        sut.install(with: options)

        XCTAssertNotNil(Dynamic(sut).swizzling.asObject)
    }
    
    func testSwizzlingNotInitialized_WhenTracingDisabled() {
        let sut = SentryPerformanceTrackingIntegration()
        
        sut.install(with: Options())
        
        XCTAssertNil(Dynamic(sut).swizzling.asObject)
    }
#endif
}
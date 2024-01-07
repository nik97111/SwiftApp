//
//  AppGBTests.swift
//  AppGBTests
//
//  Created by Николай Чупреев on 04.01.2024.
//

import XCTest

@testable import AppGB
class FriendTests: XCTestCase {
    
    private var token: String? = "vk1.a.j35GvVRv1mXQ4A6Cspcd0pEkxyWkknEcsuKdaEuv4gDXBuIOC791N85FSZd3_IGDP_2W6sU6VMv2ss1FXcCthlhlWzwm2NjqRc7ZssFWmZqJJfli_hzLb5bog6JQAKJuNSieEvGAlBQdmzoo_0Z3sUu353dXpb8rC8x5HxmohxfAg_q3iy2AHdMBng7xqvls01Ews36Mkh9kHmWLsrZd-g"
    private var userId: String? = "121495562"
    
    func testLoadPhotoWithValidURL() {
        let friend = Friend(id: 1, firstName: "first_name", lastName: "last_name", isOnline: 1, photoProfile: "https://api.vk.com/method/friends.get?fields=first_name,last_name,online,photo_100&access_token=\(String(describing: token))&v=5.131")
        _ = XCTestExpectation(description: "Фото загружено")
        friend.loadPhoto { image in
            let expectation = XCTestExpectation(description: "Фото загружено")
            friend.loadPhoto { image in
                XCTAssertNotNil(image, "Изображение не должно быть нулевым")
                expectation.fulfill()
            }
            
            self.wait(for: [expectation], timeout: 5)
        }
    }
        
        func testLoadPhotoWithInvalidURL() {
            let friend = Friend(id: 1, firstName: "first_name", lastName: "last_name", isOnline: 1, photoProfile: "invalid-url")
            let expectation = XCTestExpectation(description: "Фото загружено")
            friend.loadPhoto { image in
                XCTAssertNil(image, "Изображение должно быть нулевым из-за недопустимого URL-адреса.")
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5)
        }
    }


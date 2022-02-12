//
//  RepositoryServiceTests.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import XCTest
@testable import GithubRepos
import Combine

final class RepositoryServiceTests: XCTestCase {
    
    private var subject: RepositoryService!
    private var mockAPIService: MockAPIService!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        subject = RepositoryService(apiSession: mockAPIService)
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        mockAPIService = nil
        subject = nil
        cancellables = []
    }
    
    func test_getRepositories_withTestRepo_succeedsWithCorrectResponse() throws {
        let testRepo = Repository.testData(id: 2)
        let testResponse = RepositoryAPIModel.testData(items: [testRepo])
        mockAPIService.requestResultStub = .success(testResponse)
        
        let promise = expectation(description: "Publisher")
        
        subject.getRepositoryList()
            .sink { completion in
                switch completion {
                case .failure(_):
                    XCTFail("Unexpected result")
                case .finished:
                    break
                }
            } receiveValue: { model in
                XCTAssertEqual(model.items, testResponse.items)
                promise.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertEqual(RepositoryEndpoint.repoSwift.urlRequest, mockAPIService.requestBuilderSpy?.urlRequest)
        XCTAssertEqual(1, mockAPIService.requestCallCount)
    }
    
    func test_getRepositories_withUnkownError_returnsFailure() throws {
        let testError = APIError.unknown
        mockAPIService.requestResultStub = .failure(testError)
        
        let promise = expectation(description: "Publisher")
        
        subject.getRepositoryList()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertEqual(error.localizedDescription, testError.localizedDescription)
                    promise.fulfill()
                case .finished:
                    break
                }
            } receiveValue: { _ in
                XCTFail("Unexpected result")
            }
            .store(in: &cancellables)
        
        wait(for: [promise], timeout: 1)
        
        XCTAssertEqual(RepositoryEndpoint.repoSwift.urlRequest, mockAPIService.requestBuilderSpy?.urlRequest)
        XCTAssertEqual(1, mockAPIService.requestCallCount)
    }
}

extension RepositoryAPIModel: Equatable {
    public static func == (lhs: RepositoryAPIModel, rhs: RepositoryAPIModel) -> Bool {
        lhs.items == rhs.items
    }
}

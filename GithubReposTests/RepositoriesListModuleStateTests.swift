//
//  RepositoriesListModuleStateTests.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation
import XCTest
@testable import GithubRepos
import Combine

final class RepositoriesListModuleStateTests: XCTestCase {
    
    private var subject: RepositoriesListModuleState!
    private var mockRepositoryService: MockRepositoryService!
    private var mockViewModelFactory: MockRepositoryViewModelFactory!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockRepositoryService = MockRepositoryService()
        mockViewModelFactory = MockRepositoryViewModelFactory()
        subject = RepositoriesListModuleState(
            repositoryService: mockRepositoryService,
            viewModelFactory: mockViewModelFactory
        )
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        mockRepositoryService = nil
        mockViewModelFactory = nil
        subject = nil
        cancellables = []
    }
    
    func test_initialStateIsLoading() {
        let promise = expectation(description: "Publisher")
        
        XCTAssertEqual(1, mockViewModelFactory.makePlaceholdersUpToCallCount)
        XCTAssertEqual(10, mockViewModelFactory.makePlaceholdersUpToCountSpy)
        XCTAssertEqual(1, mockViewModelFactory.makePlaceholderCallCount)
        
        subject.$state
            .sink { _ in
                XCTFail("Unexpected result")
            } receiveValue: { state in
                if case .loading(let viewModels) = state {
                    XCTAssertEqual(11, viewModels.count)
                    promise.fulfill()
                } else {
                    XCTFail("Unexpected result")
                }
            }
            .store(in: &cancellables)
        
        wait(for: [promise], timeout: 1)
    }
    
    func test_getRepositories_withOneTestViewModel_updatesStateToSuccess() {
        
        let testRepository = Repository.testData(id: 3)
        let testRepositoryAPIModel = RepositoryAPIModel.testData(items: [testRepository])
        mockRepositoryService.resultStub = .success(testRepositoryAPIModel)
        
        subject.getRepositories()
        
        let promise = expectation(description: "Publisher")
        
        subject.$state
            .sink { _ in
                XCTFail("Unexpected result")
            } receiveValue: { [unowned self] state in
                if case .success(let viewModels) = state {
                    XCTAssertEqual(1, viewModels.count)
                    XCTAssertEqual(testRepository.id, viewModels.first?.id)
                    XCTAssertEqual(1, self.mockViewModelFactory.makeFromCallCount)
                    promise.fulfill()
                } else {
                    XCTFail("Unexpected result")
                }
            }
            .store(in: &cancellables)

        wait(for: [promise], timeout: 1)
    }
    
    func test_getRepositories_withTwoTestViewModel_updatesStateToSuccess() {
        
        let testRepositoryOne = Repository.testData(id: 3)
        let testRepositoryTwo = Repository.testData(id: 33)
        let testRepositoryAPIModel = RepositoryAPIModel.testData(
            items: [testRepositoryOne, testRepositoryTwo]
        )
        
        mockRepositoryService.resultStub = .success(testRepositoryAPIModel)
        
        subject.getRepositories()
        
        let promise = expectation(description: "Publisher")
        
        subject.$state
            .sink { _ in
                XCTFail("Unexpected result")
            } receiveValue: { [unowned self] state in
                if case .success(let viewModels) = state {
                    XCTAssertEqual(2, viewModels.count)
                    XCTAssertEqual(2, self.mockViewModelFactory.makeFromCallCount)
                    promise.fulfill()
                } else {
                    XCTFail("Unexpected result")
                }
            }
            .store(in: &cancellables)

        wait(for: [promise], timeout: 1)
    }
    
    func test_getRepositories_withError_updatesStateToEmpty() {
        mockRepositoryService.resultStub = .failure(.unknown)
        
        subject.getRepositories()
        
        let promise = expectation(description: "Publisher")
        
        subject.$state
            .sink { _ in
                XCTFail("Unexpected result")
            } receiveValue: { [unowned self] state in
                if case .empty = state {
                    XCTAssertEqual(0, self.mockViewModelFactory.makeFromCallCount)
                    promise.fulfill()
                } else {
                    XCTFail("Unexpected result")
                }
            }
            .store(in: &cancellables)
        
        wait(for: [promise], timeout: 1)
    }
}

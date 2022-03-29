//
//  ApiCaller.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

extension URLSession {

    private func buildRequest(url: URL,
                              httpMethod: HttpMethod?,
                              bodyParamaters: [String: Any]?,
                              serializedBody: Data?) throws -> URLRequest {

            var request = URLRequest(url: url)
            request.httpMethod = HttpMethod.get.rawValue
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

            if let serviceMethod = httpMethod {
                request.httpMethod = serviceMethod.rawValue
            }

            if let safeParamaters = bodyParamaters {
                if let body = try? JSONSerialization.data(
                    withJSONObject: safeParamaters, options: []) {
                    request.httpBody = body
                } else {
                    throw ApiError.invalidBody
                }

            } else
            if let body = serializedBody {
                request.httpBody = body
            }

        return request
    }

    func makeRequest<Generic: Codable>(url: URL?,
                                       method: HttpMethod? = nil,
                                       returnModel: Generic.Type,
                                       paramters: [String: Any]? = nil,
                                       knownBody: Data? = nil,
                                       completion: @escaping (Result<Generic, Error>) -> Void) {

            guard let endpointUrl = url else {
                completion(.failure(ApiError.invalidUrl))
                return
            }

            do {
                let urlRequest = try buildRequest(url: endpointUrl,
                                                  httpMethod: method,
                                                  bodyParamaters: paramters,
                                                  serializedBody: knownBody)

                let apiTask = self.dataTask(with: urlRequest) { data, _, error in
                    guard let safeData = data else {
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            completion(.failure(ApiError.invalidData))
                        }
                        return
                    }

                    do {
                        let result = try JSONDecoder().decode(returnModel, from: safeData)
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                }
                apiTask.resume()
            } catch ApiError.invalidBody {
                completion(.failure(ApiError.invalidRequest))
            } catch {
                completion(.failure(error))
            }
        }
}

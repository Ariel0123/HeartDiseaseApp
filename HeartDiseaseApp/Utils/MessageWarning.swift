//
//  MessageWarning.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import Foundation


enum MessageWarning: Error {
    case age
    case sex
    case cp
    case trestbps
    case chol
    case fbs
    case restecg
    case thalach
    case exang
    case oldpeak
    case slope
    case ca
    case thal
    case errorModel
    
    var message: String {
        switch self {
        case .age:
            return "The age field is empty or is an invalid input"
        case .sex:
            return "The sex field is empty"
        case .cp:
            return "The cp field is empty or is an invalid input"
        case .trestbps:
            return "The trestbps field is empty or is an invalid input"
        case .chol:
            return "The chol field is empty or is an invalid input"
        case .fbs:
            return "The fbs field is empty or is an invalid input"
        case .restecg:
            return "The restecg field is empty or is an invalid input"
        case .thalach:
            return "The thalach field is empty or is an invalid input"
        case .exang:
            return "The exang field is empty or is an invalid input"
        case .oldpeak:
            return "The oldpeak field is empty or is an invalid input"
        case .slope:
            return "The slope field is empty or is an invalid input"
        case .ca:
            return "The ca field is empty or is an invalid input"
        case .thal:
            return "The thal field is empty or is an invalid input"
        case .errorModel:
            return "Prediction error"

        
        
    }
    }
}


struct MessageModel: Identifiable {
    let id = UUID()
    let msg: String
    
}


class MessageService: ObservableObject{
    @Published var msg: MessageModel? = nil
}

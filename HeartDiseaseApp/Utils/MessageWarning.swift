//
//  MessageWarning.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import Foundation


enum MessageWarning: Error, LocalizedError {
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
    
    var message: String {
        switch self {
        case .age:
            return NSLocalizedString("The age field is empty or is an invalid input", comment: "")
        case .sex:
            return NSLocalizedString("The sex field is empty", comment: "")
        case .cp:
            return NSLocalizedString("The cp field is empty or is an invalid input", comment: "")
        case .trestbps:
            return NSLocalizedString("The trestbps field is empty or is an invalid input", comment: "")
        case .chol:
            return NSLocalizedString("The chol field is empty or is an invalid input", comment: "")
        case .fbs:
            return NSLocalizedString("The fbs field is empty or is an invalid input", comment: "")
        case .restecg:
            return NSLocalizedString("The restecg field is empty or is an invalid input", comment: "")
        case .thalach:
            return NSLocalizedString("The thalach field is empty or is an invalid input", comment: "")
        case .exang:
            return NSLocalizedString("The exang field is empty or is an invalid input", comment: "")
        case .oldpeak:
            return NSLocalizedString("The oldpeak field is empty or is an invalid input", comment: "")
        case .slope:
            return NSLocalizedString("The slope field is empty or is an invalid input", comment: "")
        case .ca:
            return NSLocalizedString("The ca field is empty or is an invalid input", comment: "")
        case .thal:
            return NSLocalizedString("The thal field is empty or is an invalid input", comment: "")
        
        
    }
    }
}


struct MessageModel: Identifiable {
    let id = UUID()
    let msg: String
    
}


class MessageObs: ObservableObject{
    @Published var msg: MessageModel? = nil
}

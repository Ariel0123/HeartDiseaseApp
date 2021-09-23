import Combine
import CoreML

class HeartService: ObservableObject{
    
    @Published var result = ""
    @Published var percentage = ""
    
    
    func predictHeartDisease(age: String, sex: String, cp: String, trestbps: String, chol: String, fbs: String, restecg: String, thalach: String, exang: String, oldpeak: String, slope: String, ca: String, thal: String) throws {
        
        do{
            
            let config = MLModelConfiguration()
            let model = try heart(configuration: config)
        
         let marsHabitatPricerOutput = try model.prediction(age: Double(age)!, sex: Double(sex)!, cp: Double(cp)!, trestbps: Double(trestbps)!, chol: Double(chol)!, fbs: Double(fbs)!, restecg: Double(restecg)!, thalach: Double(thalach)!, exang: Double(exang)!, oldpeak: Double(oldpeak)!, slope: Double(slope)!, ca: Double(ca)!, thal: Double(thal)!)
        
        if marsHabitatPricerOutput.target == 1{
            self.result = "Heart disease"
            self.percentage = String(format: "%.2f", marsHabitatPricerOutput.targetProbability[1]!) + " %"
        }else{
            self.result = "No heart disease"
            self.percentage = String(format: "%.2f", marsHabitatPricerOutput.targetProbability[0]!) + " %"
        }
            
        }catch{
            throw MessageWarning.errorModel
        }
        
    }
}

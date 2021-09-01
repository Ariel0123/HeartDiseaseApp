//
//  MainView.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import SwiftUI
import CoreML

struct MainView: View {
    @EnvironmentObject var messageObject: MessageObs
    
    let model = heart()
    
    @State var age = ""
    @State var sex = ""
    @State var cp = ""
    @State var trestbps = ""
    @State var chol = ""
    @State var fbs = ""
    @State var restecg = ""
    @State var thalach = ""
    @State var exang = ""
    @State var oldpeak = ""
    @State var slope = ""
    @State var ca = ""
    @State var thal = ""
    
    @State var result = ""
    @State var percentage = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
        
                Text("Heart Disease")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
            
            
            VStack(spacing: 20){
                HStack {
                    TextFieldView(nameField: .constant("Age"), value: $age)
                    //TextFieldView(nameField: .constant("Sex"), value: $sex)
                    SelectorView(nameField: .constant("Sex"), value: $sex)
                        

                }
                
                HStack {
                    TextFieldView(nameField: .constant("Cp"), value: $cp)
                    TextFieldView(nameField: .constant("Trestbps"), value: $trestbps)
                }
                
                HStack {
                    TextFieldView(nameField: .constant("Chol"), value: $chol)
                    TextFieldView(nameField: .constant("Fbs"), value: $fbs)
                }
                
                HStack {
                    TextFieldView(nameField: .constant("Restecg"), value: $restecg)
                    TextFieldView(nameField: .constant("Thalach"), value: $thalach)
                }
                
                HStack {
                    TextFieldView(nameField: .constant("Exang"), value: $exang)
                    TextFieldView(nameField: .constant("Oldpeak"), value: $oldpeak)
                }
                
                HStack {
                    TextFieldView(nameField: .constant("Slope"), value: $slope)
                    TextFieldView(nameField: .constant("Ca"), value: $ca)
                }
                
                HStack{
                    TextFieldView(nameField: .constant("Thal"), value: $thal)
                        .frame(width: UIScreen.main.bounds.width/2-20, alignment: .leading)
                    
                   Spacer()
                }
 
                }
            .padding()
            
            
            
            HStack{
                
          
                
                Button(action: {
                    do{
                       try getResult()
                    }catch{
                        print("error")
                    }
                }, label: {
                        Text("Predict")
                            .frame(width: 150, height: 40, alignment: .center)

                }).background(Color.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(25)
                
                
                Spacer()
                

                
                
                Button(action: {
                    self.clearFields()
                }, label: {
                        Text("Clear fields")
                            .frame(width: 150, height: 40, alignment: .center)

                }).background(Color.orange)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(25)
                
            }
            .padding()
            
            if !self.result.isEmpty && !self.percentage.isEmpty{

             ResultView(result: $result, percentage: $percentage)
                .padding(.horizontal)
                
            }
            
            Spacer()
            
        }.alert(item: $messageObject.msg){ message in
            Alert(title: Text("Warning"), message: Text(message.msg))
        }
        
        
    }
    
    
    func getResult() throws {
        do{
            try validateFields()
           
            
        }catch MessageWarning.sex{
            self.messageObject.msg = MessageModel(msg: MessageWarning.sex.message)
            
        }catch MessageWarning.age{
            self.messageObject.msg = MessageModel(msg: MessageWarning.age.message)
            
        }catch MessageWarning.cp{
            self.messageObject.msg = MessageModel(msg: MessageWarning.cp.message)
            
        }catch MessageWarning.trestbps{
            self.messageObject.msg = MessageModel(msg: MessageWarning.trestbps.message)
            
        }catch MessageWarning.chol{
            self.messageObject.msg = MessageModel(msg: MessageWarning.chol.message)
            
        }catch MessageWarning.fbs{
            self.messageObject.msg = MessageModel(msg: MessageWarning.fbs.message)
            
        }catch MessageWarning.restecg{
            self.messageObject.msg = MessageModel(msg: MessageWarning.restecg.message)
            
        }catch MessageWarning.thalach{
            self.messageObject.msg = MessageModel(msg: MessageWarning.thalach.message)
            
        }catch MessageWarning.exang{
            self.messageObject.msg = MessageModel(msg: MessageWarning.exang.message)
            
        }catch MessageWarning.oldpeak{
            self.messageObject.msg = MessageModel(msg: MessageWarning.oldpeak.message)
            
        }catch MessageWarning.slope{
            self.messageObject.msg = MessageModel(msg: MessageWarning.slope.message)
            
        }catch MessageWarning.ca{
            self.messageObject.msg = MessageModel(msg: MessageWarning.ca.message)
            
        }catch MessageWarning.thal{
            self.messageObject.msg = MessageModel(msg: MessageWarning.thal.message)
        }
        
        
    }
    
    
    func runModel() {
        
        guard let marsHabitatPricerOutput = try? model.prediction(age: Double(self.age)!, sex: Double(self.sex)!, cp: Double(self.cp)!, trestbps: Double(self.trestbps)!, chol: Double(self.chol)!, fbs: Double(self.fbs)!, restecg: Double(self.restecg)!, thalach: Double(self.thalach)!, exang: Double(self.exang)!, oldpeak: Double(self.oldpeak)!, slope: Double(self.slope)!, ca: Double(self.ca)!, thal: Double(self.thal)!) else {
            fatalError("Unexpected runtime error.")
        
        }
        
        if marsHabitatPricerOutput.target == 1{
            self.result = "Heart disease"
            self.percentage = String(format: "%.2f", marsHabitatPricerOutput.targetProbability[1]!) + " %"
        }else{
            self.result = "No heart disease"
            self.percentage = String(format: "%.2f", marsHabitatPricerOutput.targetProbability[0]!) + " %"
        }
        
    }
    
    func validateFields() throws {
        
        if self.age.isEmpty || !self.age.isNumeric{
            throw MessageWarning.age
            
        }else if self.sex.isEmpty{
            throw MessageWarning.sex
            
        }else if self.cp.isEmpty || !self.cp.isNumeric{
            throw MessageWarning.cp
            
        }else if self.trestbps.isEmpty || !self.trestbps.isNumeric{
            throw MessageWarning.trestbps
            
        }else if self.chol.isEmpty || !self.chol.isNumeric{
            throw MessageWarning.chol
            
        }else if self.fbs.isEmpty || !self.fbs.isNumeric{
            throw MessageWarning.fbs
            
        }else if self.restecg.isEmpty || !self.restecg.isNumeric{
            throw MessageWarning.restecg
            
        }else if self.thalach.isEmpty || !self.thalach.isNumeric{
            throw MessageWarning.thalach
            
        }
        else if self.exang.isEmpty || !self.exang.isNumeric{
            throw MessageWarning.exang
            
        }
        else if self.oldpeak.isEmpty || !self.oldpeak.isNumeric{
            throw MessageWarning.oldpeak
            
        }
        else if self.slope.isEmpty || !self.slope.isNumeric{
            throw MessageWarning.slope
            
        }else if self.ca.isEmpty || !self.ca.isNumeric{
            throw MessageWarning.ca
            
        }else if self.thal.isEmpty || !self.thal.isNumeric{
            throw MessageWarning.thal
            
        }
        else{
            runModel()
        }
        
        
        
    }
    
    
    func clearFields(){
        self.age = ""
        self.sex = ""
        self.cp = ""
        self.trestbps = ""
        self.chol = ""
        self.fbs = ""
        self.restecg = ""
        self.thalach = ""
        self.exang = ""
        self.oldpeak = ""
        self.slope = ""
        self.ca = ""
        self.thal = ""
        
        self.result = ""
        self.percentage = ""
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



extension String {

    var isNumeric : Bool {
        
        if self.last == "."{
            return false

        }else{
            var onePoint = false
            
            for i in self {
                if i == "." && !onePoint{
                    onePoint = true
                    
                }else if i == "." && onePoint{
                    return false
                }
            }
        }
        return true
    }

}

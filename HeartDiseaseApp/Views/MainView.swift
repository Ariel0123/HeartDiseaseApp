//
//  MainView.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import SwiftUI
import CoreML

struct MainView: View {
    
    @StateObject var heartService = HeartService()
    @StateObject var messageService = MessageService()
    
    
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
            
            if !heartService.result.isEmpty && !heartService.percentage.isEmpty{

                ResultView(result: $heartService.result, percentage: $heartService.percentage)
                .padding(.horizontal)
                
            }
            
            Spacer()
            
        }.alert(item: $messageService.msg){ message in
            Alert(title: Text("Warning"), message: Text(message.msg))
        }
        
        
    }
    
    
    func getResult() throws {
        do{
            try validateFields()
           
            
        }catch MessageWarning.sex{
            self.messageService.msg = MessageModel(msg: MessageWarning.sex.message)
            
        }catch MessageWarning.age{
            self.messageService.msg = MessageModel(msg: MessageWarning.age.message)
            
        }catch MessageWarning.cp{
            self.messageService.msg = MessageModel(msg: MessageWarning.cp.message)
            
        }catch MessageWarning.trestbps{
            self.messageService.msg = MessageModel(msg: MessageWarning.trestbps.message)
            
        }catch MessageWarning.chol{
            self.messageService.msg = MessageModel(msg: MessageWarning.chol.message)
            
        }catch MessageWarning.fbs{
            self.messageService.msg = MessageModel(msg: MessageWarning.fbs.message)
            
        }catch MessageWarning.restecg{
            self.messageService.msg = MessageModel(msg: MessageWarning.restecg.message)
            
        }catch MessageWarning.thalach{
            self.messageService.msg = MessageModel(msg: MessageWarning.thalach.message)
            
        }catch MessageWarning.exang{
            self.messageService.msg = MessageModel(msg: MessageWarning.exang.message)
            
        }catch MessageWarning.oldpeak{
            self.messageService.msg = MessageModel(msg: MessageWarning.oldpeak.message)
            
        }catch MessageWarning.slope{
            self.messageService.msg = MessageModel(msg: MessageWarning.slope.message)
            
        }catch MessageWarning.ca{
            self.messageService.msg = MessageModel(msg: MessageWarning.ca.message)
            
        }catch MessageWarning.thal{
            self.messageService.msg = MessageModel(msg: MessageWarning.thal.message)
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
            
            do{
                try heartService.predictHeartDisease(age: self.age, sex: self.sex, cp: self.cp, trestbps: self.trestbps, chol: self.chol, fbs: self.fbs, restecg: self.restecg, thalach: self.thalach, exang: self.exang, oldpeak: self.oldpeak, slope: self.slope, ca: self.ca, thal: self.thal)
            }catch MessageWarning.errorModel{
                self.messageService.msg = MessageModel(msg: MessageWarning.errorModel.message)

            }
            
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
        
        heartService.result = ""
        heartService.percentage = ""
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

//
//  SelectorView.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import SwiftUI

struct SelectorView: View {
    @Binding var nameField: String
    @Binding var value: String
    
    @State var selectedSex = "Select"
    
    var body: some View {
        HStack{
            Text(nameField)
                .font(.headline)
            
            
            Divider()
        
            
            
            Menu(self.selectedSex) {
                
                Button("Female", action: setFemale)
                Button("Male", action: setMale)


                    
                }
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        

        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .frame(height: 30, alignment: .leading)
        .onChange(of: value, perform: { value in
            if value == "0"{
                self.selectedSex = "Female"
            }else if value == "1"{
                self.selectedSex = "Male"
            }else{
                self.selectedSex = "Select"
            }
        })
       
    }
    
    
    func setMale(){
        self.value = "1"
    }
    
    func setFemale(){
        self.value = "0"
    }
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(nameField: .constant(""), value: .constant(""))
    }
}

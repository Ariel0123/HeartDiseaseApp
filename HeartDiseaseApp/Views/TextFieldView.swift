//
//  TextFieldView.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import SwiftUI
import Combine

struct TextFieldView: View {
    
    @Binding var nameField: String
    @Binding var value: String
    
    var body: some View {
        HStack{
            Text(nameField)
                .font(.headline)
            
            
            Divider()
            TextField("Enter value", text: $value)
                .keyboardType(.numberPad)
                          .onReceive(Just(value)) { newValue in
                              let filtered = newValue.filter { "0123456789.".contains($0) }
                              if filtered != newValue{
                               
                                  self.value = filtered
                              }
                          }
                      
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .frame(height: 30, alignment: .leading)
       
    }
    
    

    
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(nameField: .constant(""), value: .constant(""))
    }
}

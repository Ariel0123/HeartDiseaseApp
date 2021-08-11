//
//  ResultView.swift
//  HeartDiseaseApp
//
//  Created by Ariel Ortiz on 8/10/21.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var result: String
    @Binding var percentage: String
    
    var body: some View {
        VStack(alignment: .leading){
           
            HStack{
        Text("Result:")
            .font(.headline)
            
        Text(String(self.result))
            }
            .padding(.bottom, 10)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        
        HStack{
        Text("Percentage:")
            .font(.headline)
        Text(self.percentage)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
    }
    .padding()
    .background(Color.gray.opacity(0.1))
    .cornerRadius(20)
    
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: .constant(""), percentage: .constant(""))
    }
}

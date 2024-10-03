//
//  ContentView.swift
//  FindByIP
//
//  Created by PEPPA CHAN on 06.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ipData = GetModel()
    @State private var inputIP: String = ""
    
    var body: some View {
        VStack {
            if ipData.returnData?.ip != nil {
                Text("\(ipData.returnData?.ip ?? "")")
                    .font(.largeTitle)
                    .frame(alignment: .center)
                AsyncImage(url: URL(string: (ipData.returnData?.countryFlag)!)){phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .foregroundColor(.secondary)
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit)
                    case .failure(_):
                        Rectangle()
                            .foregroundColor(.secondary)
                    @unknown default:
                        Rectangle()
                            .foregroundColor(.secondary)
                    }
                }
                .frame(width: 100, height: 100)
                List{
                    Text("Континент: \(ipData.returnData?.continentName ?? "") - \(ipData.returnData?.continentCode ?? "")")
                    Text("Страна: \(ipData.returnData?.countryNameOfficial ?? "") - \(ipData.returnData?.countryName ?? "")")
                    Text("Столица страны: \(ipData.returnData?.countryCapital ?? "")")
                    Text("Город: \(ipData.returnData?.stateProv ?? "") - \(ipData.returnData?.city ?? "")")
                    Text("Почтовый индекс: \(ipData.returnData?.zipcode ?? "")")
                    Text("Широта: \(ipData.returnData?.latitude ?? "")")
                    Text("Долгота: \(ipData.returnData?.longitude ?? "")")
                }
            }
        }
        Spacer()
        HStack {
            TextField(text: $inputIP) {
                Text("Input IP")
            }
            .padding(6)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .frame(height: 1.2)
                    .foregroundColor(Color.secondary)
            }
            Button {
                DispatchQueue.global(qos: .background).async {
                    ipData.getData(ip: inputIP)
                }
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            } label: {
                Circle()
                    .frame(width: 40)
                    .overlay(alignment: .center) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                    }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

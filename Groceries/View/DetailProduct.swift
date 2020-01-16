//
//  Account.swift
//  Groceries
//
//  Created by Guilherme Deconto on 14/01/20.
//  Copyright © 2020 Bullseye Groceries. All rights reserved.
//

import SwiftUI

struct DetailProduct: View {
    var product: Product
    @State var isModal: Bool = false
    @State var price = ""
    @State private var date = Date.init()
    @State var local = ""
    @State var quant = ""
    
    
    let dateFormat = DateFormatter.dateFormat(fromTemplate: "dd/MM/yyyy", options: 1, locale: .current)
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .circular).fill(Color.white).shadow(radius: 2)
                VStack {
                    Image(product.image).resizable().frame(width: 100, height: 100, alignment: .center).cornerRadius(25)
                    Text(product.description).bold().font(.system(size: 20))
                    Text(product.ean).font(.system(size: 20))
                }
            }.frame(height: 200, alignment: .leading)
            Spacer()
            Spacer()
            Text("Compras").font(.headline).frame(alignment: .leading)
            List {
                ForEach(product.payments) { payment in
                    DetailCell(payment: payment)
                }
            }
        }.padding(20).navigationBarItems(leading: NavigationLink(destination: PaymentInfo(price: $price, date: $date, local: $local, quant: $quant)){
            Image(systemName: "square.and.pencil")
        })
        
        }
    }

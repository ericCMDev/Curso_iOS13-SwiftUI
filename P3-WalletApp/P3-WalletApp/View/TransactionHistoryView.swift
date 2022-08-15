//
//  TransactionHistoryView.swift
//  P3-WalletApp
//
//  Created by Eric Cabestany Mena on 11/8/22.
//

import SwiftUI

struct TransactionHistoryView: View {
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack {
                Spacer()
                Text("Historial de compres")
                    .font(.system(size: 20, weight: .black, design: .rounded))
                Spacer()
            }
            ScrollView(.horizontal){
                
                HStack(spacing: 25) {
                    ForEach(transactions){ t in
                        TransactionView(transaction: t)
                    }
                }.padding()
            }
        }
    }
}

struct TransactionView: View {
    
    var transaction: Transaction
    var body: some View{
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(Color(.systemGray4))
            .overlay(
                VStack {
                    Spacer()
                    Text(transaction.date)
                        .font(.system(.body, design: .rounded))
                        .padding(.top)
                    Image(systemName: transaction.icon)
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .padding()
                    Text(transaction.seller)
                        .font(.system(.title, design: .rounded))
                        .bold()
                    Text("\(String(format: "%.2f", transaction.amount))€")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(.bottom)
                    Spacer()

                }
            ).frame(width: 220, height: 220)
        
    }
}
struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        TransactionHistoryView()
        TransactionView(transaction: transactions[0]).previewLayout(.sizeThatFits)
        }
    }
}

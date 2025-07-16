//
//  ExpenseRow.swift
//  IExpense
//
//  Created by Николай Игнатов on 17.07.2025.
//

import SwiftUI

struct ExpenseRow: View {
    let item: ExpenseItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)

                Text(item.type)
            }

            Spacer()

            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(item.amount < 10 ? .green : item.amount < 100 ? .blue : .red)
                .font(item.amount < 10 ? .body : item.amount < 100 ? .headline : .title3.bold())
        }
    }
}

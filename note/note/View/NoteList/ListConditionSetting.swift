//
//  ListConditionSetting.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI

struct ListConditionSetting: View {
    @ObservedObject var viewModel: ListConditionSettingViewModel
    @Environment(\.presentationMode) var presentationMode
    

    init(listCondition: Binding<ListCondition>) {
        self.viewModel = ListConditionSettingViewModel(listCondition: listCondition)
    }

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "timer")
                Text("时间")
                Spacer()
            }
            .padding(.horizontal)
            Picker("", selection: $viewModel.editableListCondition.sortBy) {
                ForEach(ListCondition.SortBy.allCases) { sortBy in
                    Text(sortBy.rawValue)
                        .tag(sortBy)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            HStack {
                Image(systemName: "arrow.up.arrow.down.circle")
                Text("排序方式")
                Spacer()
            }
            .padding(.horizontal)
            Picker("", selection: $viewModel.editableListCondition.sortOrder) {
                ForEach(ListCondition.SortOrder.allCases) { sortOrder in
                    Text(sortOrder.rawValue)
                        .tag(sortOrder)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            HStack {
                Image(systemName: "tag")
                Text("标签")
                Spacer()
            }
            .padding(.horizontal)
            TagHStack(tags: viewModel.filteringTag, action: viewModel.remove, deletable: true)
                .padding(.horizontal)
            HStack {
                Image(systemName: "plus")
                Text("选择标签")
                Spacer()
            }
            .padding(.horizontal)
            TagHStack(tags: viewModel.nonFilteringTag, action: viewModel.add)
                .padding(.horizontal)

            Spacer()

        }
        .background(Color(UIColor.secondarySystemBackground))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(action: cancel) {
                    Text("取消")
                    .foregroundColor(.red)
                }.hidden()
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: apply) {
                    Text("好")
                }
            }
        }
        .navigationTitle("过滤器")
        .navigationBarTitleDisplayMode(.inline)
    }

    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }

    func apply() {
        viewModel.bind()
        presentationMode.wrappedValue.dismiss()
    }
}

struct ListConditionSetting_Previews: PreviewProvider {
    @State static var listCondition = ListCondition()
    static var previews: some View {
        ListConditionSetting(listCondition: $listCondition)
    }
}

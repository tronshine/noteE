//
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct TagList: View {
    @ObservedObject var viewModel = TagListViewModel()

    var body: some View {
        
        List {
            if viewModel.tags.isEmpty{
                AddTagFooter(tags: $viewModel.tags)
            }else{
                Section() {
                    ForEach(viewModel.tags, id: \.id) { tag in
                        Tag(entity: tag)
                    }
                    .onDelete { indexSet in
                        viewModel.remove(indexSet: indexSet)
                    }
                }
                AddTagFooter(tags: $viewModel.tags)
            }
            
        }
    }
}

struct TagList_Previews: PreviewProvider {
    static var previews: some View {
        TagList()
    }
}

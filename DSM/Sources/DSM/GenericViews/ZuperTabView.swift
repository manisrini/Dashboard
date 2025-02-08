//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI

public typealias selectedTabIndex = Int
public typealias prevSelectedTabIndex = Int

public struct ZTab: Hashable{
    let id : UUID?
    let title : String
    
    public init(id: UUID?, title: String) {
        self.id = id
        self.title = title
    }
}

public struct ZuperTabView: View {
    
    var tabs : [ZTab] = []
    @Binding var selectedIndex : Int
    var didSelectTab : ((prevSelectedTabIndex,selectedTabIndex)->())?

    public init(tabs: [ZTab], selectedIndex: Binding<Int>, didSelectTab: ((prevSelectedTabIndex, selectedTabIndex) -> Void)?) {
        self.tabs = tabs
        self._selectedIndex  = selectedIndex
        self.didSelectTab = didSelectTab
    }

    public var body: some View {
        
        Rectangle()
            .frame(height: 60)
            .foregroundStyle(.gray)
            .overlay {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(Array(tabs.enumerated()),id: \.element) { index,tab in
                            Button {
                                self.didSelectTab?(selectedIndex,index)
                                withAnimation {
                                    selectedIndex = index
                                }
                            } label: {
                                TabItem(tab: tab, isSelected: selectedIndex == index)
                            }
                        }
                    }
                    .padding(.leading,5)
                }
            }
    }
}

struct TabItem : View {
    let tab : ZTab
    let isSelected : Bool
    
    init(tab: ZTab, isSelected: Bool) {
        self.tab = tab
        self.isSelected = isSelected
    }
    
    var body: some View{
        VStack(spacing: 10){
            ZuperText(name: tab.title,font: .Roboto(.Bold, 12))
                .foregroundStyle(Color.white)
                .padding(.horizontal,16)
            
            if isSelected{
                Rectangle()
                    .frame(width: 50,height: 3)
                    .foregroundStyle(Color.black)
            }else{
                Rectangle()
                    .frame(width: 50,height: 3)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
}

#Preview {
    ZuperTabView(
        tabs: [.init(id: UUID(uuidString: "1"), title: "Test"),
               .init(id: UUID(uuidString: "2"), title: "Hello"),
               .init(id: UUID(uuidString: "3"), title: "Done")
        ],
        selectedIndex: .constant(
            0
        ),
        didSelectTab: nil
    )
}

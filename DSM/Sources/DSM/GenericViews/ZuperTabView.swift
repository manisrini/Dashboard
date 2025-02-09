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
    public let id : UUID?
    public let title : String
    public let displayValue : String
    
    public init(id: UUID?, title: String,displayValue : String = "") {
        self.id = id
        self.title = title
        self.displayValue = displayValue
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
        
        VStack(spacing : 2){
            Divider()
            
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(.white)
                .overlay {
                    ScrollViewReader { reader in
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing : 0){
                                ForEach(Array(tabs.enumerated()),id: \.element) { index,tab in
                                    Button {
                                        self.didSelectTab?(selectedIndex,index)
                                        withAnimation {
                                            selectedIndex = index
                                            reader.scrollTo(index, anchor: .leading)
                                        }
                                    } label: {
                                        TabItem(tab: tab, isSelected: selectedIndex == index)
                                            .id(index)
                                    }
                                }
                            }
                            .padding(.leading,5)
                        }
                        .onChange(of: selectedIndex) { newIndex in
                            withAnimation {
                                reader.scrollTo(newIndex, anchor: .leading)
                            }
                        }
                    }
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
            ZuperText(name: tab.displayValue,font: .Roboto(.Bold, 16))
                .foregroundStyle(Color(isSelected ? DSMColors.black : DSMColors.gray))
                .padding(.horizontal,16)

            
            if isSelected{
                Rectangle()
                    .frame(height: 3)
                    .foregroundStyle(Color(DSMColors.purple))
            }else{
                Rectangle()
                    .frame(height: 3)
                    .foregroundStyle(Color.white)
                    .overlay {
                        Divider()
                    }
            }
        }
    }
    
}

#Preview {
    ZuperTabView(
        tabs: [.init(id: UUID(uuidString: "1"), title: "Test",displayValue: "Test "),
               .init(id: UUID(uuidString: "2"), title: "Hello",displayValue: "Test 2"),
               .init(id: UUID(uuidString: "3"), title: "Done", displayValue: "Test 3")
        ],
        selectedIndex: .constant(
            0
        ),
        didSelectTab: nil
    )
}

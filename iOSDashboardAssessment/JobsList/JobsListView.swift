//
//  JobsListView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import DSM
import SampleData

struct JobsListView: View {
    
    @ObservedObject var viewModel : JobsListViewModel
    @State var selectedTabIndex = 0
    let columnWidth: CGFloat = UIScreen.main.bounds.width * 0.9

    init(_ viewModel: JobsListViewModel) {
        self.viewModel = viewModel
    }
    
    // Handled gesture for tab change during swipe
    var drag : some Gesture{
        DragGesture()
            .onEnded(handleDragEnded)
    }

    
    var body: some View {
        
        NavigationStack{
            VStack{
                JobStatsView(
                    JobStatsViewModel(
                        jobs: viewModel.jobs,
                        showStatsInfo: false,
                        showHeader: false,
                        selectedIndex: selectedTabIndex
                    )
                )
                .padding(.horizontal)
                
                ZuperTabView(tabs: viewModel.getTabs(), selectedIndex: $selectedTabIndex) { prevSelectedIndex, currentSelectedIndex in
                    if prevSelectedIndex != currentSelectedIndex{
                        viewModel.updateSelectedStatus(for: currentSelectedIndex)
                    }
                }
                
                Group{
                    
                    if viewModel.isJobsEmptyForSelectedStatus(){
                        VStack{
                            EmptyStateView()
                                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
                                .background(.white)
                        }
                    } else{
                        ScrollViewReader { scrollViewProxy in
                            ScrollView(.vertical) {
                                LazyVStack(alignment: .leading) {
                                    Group{}.id("scroll-to-top-view")

                                    ForEach(viewModel.getSelectedStatusJobs(),id: \.id) { job in
                                        Card(for: viewModel.getCardModel(for: job))
                                            .roundedBorder(color: Color(DSMColors.light_gray))
                                            .padding(.horizontal,10)
                                            .padding(.vertical,5)
                                    }
                                }
                            }
                            .onChange(of: selectedTabIndex) { newValue in
                                withAnimation {
                                    scrollViewProxy.scrollTo("scroll-to-top-view",anchor: .top)
                                }
                            }
                            .refreshable {
                                viewModel.refreshList()
                            }
                        }
                    }
                }
                .gesture(drag)

            }
            .zNavBar(viewModel.getNavBarTitle())
        }
    }
    
    private func handleDragEnded(_ gestureValue : DragGesture.Value){
        let threshold: CGFloat = 50
        if gestureValue.translation.width < -threshold{
            moveToNextColumn()
        }else if gestureValue.translation.width > threshold{
            moveToPrevColumn()
        }
    }
    
    private func moveToNextColumn(_ steps : Int = 1){
        if selectedTabIndex < viewModel.tabs.count - 1 {
            withAnimation {
                selectedTabIndex += steps
                viewModel.updateSelectedStatus(for: selectedTabIndex)
            }
        }
    }
    
    private func moveToPrevColumn(_ steps : Int = 1){
        if selectedTabIndex > 0 {
            withAnimation {
                selectedTabIndex -= steps
                viewModel.updateSelectedStatus(for: selectedTabIndex)
            }
        }
    }


}

#Preview {
    JobsListView(JobsListViewModel(jobs: [
        JobApiModel(jobNumber: 1, title: "Test", startTime: "123", endTime: "456", status: .yetToStart),
        JobApiModel(jobNumber: 2, title: "Clean Home", startTime: "123", endTime: "456", status: .yetToStart),
        JobApiModel(jobNumber: 2, title: "Clean Home", startTime: "123", endTime: "456", status: .cancelled),
    ]))
}

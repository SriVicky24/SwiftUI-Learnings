//
//  HomeView.swift
//  Spacetalk
//
//  Created by Sri Badrinath on 28/10/21.
//

import SwiftUI

struct HomeView: View {
  
  @State var showDeviceList: Bool = true
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView (.vertical,
                  showsIndicators: false) {
        VStack {
          
          userView
            .padding(.top, 16)
          
          myDevicesView
            .frame(maxHeight: .infinity,
                   alignment: .top)
          
          supportAndSettingsView
        }
        .frame(minHeight: geometry.size.height)
      }.frame(width: geometry.size.width)
    }
  }
  
  
  //  MARK: - User Info View
  
  var userView: some View {
    VStack {
      // User Image
      Circle()
        .frame(width: 100,
               height: 100)
      // Account Name
      Text("Account Holder")
        .configureFont(withStyle: .h1)
        .foregroundColor(Theme.Color.BlackDark)
      
      Divider()
    }
    .padding(.horizontal, 16)
    
  }
  
  //  MARK: - My Device View
  
  @ViewBuilder
  var myDevicesView: some View {
    
    if showDeviceList {
      VStack {
        HStack(spacing: 16) {
          Text("My Devices")
            .foregroundColor(Theme.Color.BlackDark)
            .font(.headline)
          Spacer()
          Button {
            
          } label: {
            HStack {
              Image("ic_plus")
                .resizable()
                .frame(width: 20, height: 20)
              Text("Add Device")
                .font(.headline)
            }
          }
          .foregroundColor(Theme.Color.PrimaryBrand)
        }
        .padding()
      
        ScrollView(.horizontal, showsIndicators: false) {
          HStack (alignment: .center, spacing: 8) {
            ForEach ((1...5), id: \.self) {_ in
              DeviceItemView()
            }
          }
        }
        .padding()
      }
    }
    
    else {
      VStack {
        EmptyStateView(title: "No devices yet",
                       description: "Add your first device to unlock the full Spacetalk experience.",
                       imageName: "ic_no_device")
          .padding()
        
        Button {
          
        } label: {
          Text("Add Device")
            .frame(maxWidth: .infinity, minHeight: 55.0)
            .configureFont(withStyle: .label)
            .background(Theme.Color.PrimaryBrand)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
      }
      .padding()
    }
  }
  
  //  MARK: - Support and Settings Buttons
  
  var supportAndSettingsView: some View {
   
    HStack(spacing: 16) {
      ImageTitleView(title: "Support",
                     imageName: "ic_info")
        .frame(maxWidth: .infinity,
               minHeight: 100)
        .background(Theme.Color.PrimaryBrand25)
        .cornerRadius(8)
      
      ImageTitleView(title: "Settings",
                     imageName: "ic_settings")
        .frame(maxWidth: .infinity,
               minHeight: 100)
        .background(Theme.Color.PrimaryBrand25)
        .cornerRadius(8)
    }
    .padding()
  }
  
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  SwiftyAlerts2
//
//  Created by Robert Harrison on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var presentAlert = false
    @State private var presentDestructiveAlert = false
    @State private var presentSettingsAlert = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    Button {
                        presentAlert = true
                    } label: {
                        Text("Show Alert")
                            .font(.system(size: 24))
                            .fontWeight(.medium)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    .alert(Text("Error"), isPresented: $presentAlert) {
                        
                    } message: {
                        Text("Uh oh! An error has occurred!");
                        
                    } // Button - Show Alert
                    
                    Button {
                        presentDestructiveAlert = true
                    } label: {
                        Text("Show Destructive")
                            .font(.system(size: 24))
                            .fontWeight(.medium)
                            .padding()
                            .foregroundColor(.red)
                    }
                    .alert(Text("Delete Item"), isPresented: $presentDestructiveAlert) {
                        
                        Button(role: .destructive) {
                            print("Delete Item")
                        } label: {
                            Text("Yes, Delete Item")
                        }
                        
                    } message: {
                        Text("Are you sure you want to delete the item?");
                        
                    } // Button - Show Destructive
                    
                    Button {
                        presentSettingsAlert = true
                    } label: {
                        Text("Show Settings")
                            .font(.system(size: 24))
                            .fontWeight(.medium)
                            .padding()
                            .foregroundColor(.green)
                    }
                    .alert(Text("Location Settings"), isPresented: $presentSettingsAlert) {
                        
                        Button {
                            
                            guard let settings = URL(string: UIApplication.openSettingsURLString),
                                  UIApplication.shared.canOpenURL(settings) else {
                                return
                            }
                            UIApplication.shared.open(settings)
                            
                        } label: {
                            Text("Settings")
                        }
                        
                        Button(role: .cancel) {
                            
                        } label: {
                            Text("Cancel")
                        }
                        
                    } message: {
                        Text("Location permissions are required to use this feature. Please allow access to Location in the Settings app.");
                        
                    } // Button - Show Settings

                    
                } // VStack
                
            } // ZStack
                        
            .navigationBarTitle("SwiftyAlerts2")
            .navigationBarTitleDisplayMode(.inline)
            
        } // NavigationView
        
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

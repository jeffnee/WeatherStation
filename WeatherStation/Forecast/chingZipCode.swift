//
//  chingZipCode.swift
//  WeatherStation
//
//  Created by Jeff Neely on 6/17/25.
//

import SwiftUI

struct ForecastViewZip: View {
    @State private var daypart: Daypart?
    @State private var location: LocationResponse?
    @State private var scrollToTopID = UUID()
    @State private var zipCode: String = "93110"
    @State private var showingZipCodeSheet = false
    
    var body: some View {
        ZStack {
            SetBackground()
            VStack {
                HStack {
                    Text("Local Forecast")
                        .font(.largeTitle)
                    Spacer()
                    Button(action: {
                        showingZipCodeSheet = true
                    }) {
                        Image(systemName: "location.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                
                if let city = location?.location.city {
                    Text(city)
                        .font(.title2)
                }
                    
                if let daypart = daypart {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(alignment: .leading) {
                               
                                Color.clear
                                    .frame(height: 0)
                                    .id(scrollToTopID)
 
                                ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
                                    if daypart.dayOrNight?[index] != nil {
                                        VStack(alignment: .leading) {
                                            Text("\(daypart.daypartName?[index] ?? "N/A")")
                                                .font(.title)
                                                .bold()
                                            ForecastDetailView(daypart: daypart, index: index)
                                            Text("\(daypart.narrative?[index] ?? "N/A")")
                                            divider()
                                        }
                                    }
                                }
                                .padding(.bottom, 14.0)
                            }
                        }
                        .padding(20)
                        .onAppear {
                            withAnimation {
                                proxy.scrollTo(scrollToTopID, anchor: .top)
                            }
                        }
                    }
                } else {
                    Text("Invalid Zip Code \(zipCode)")
                }
            }
        }
        .onAppear {
            fetchForecastData()
            fetchLocationData()
        }
        .sheet(isPresented: $showingZipCodeSheet) {
            ZipCodeChangeSheet(
                currentZipCode: zipCode,
                onZipCodeChanged: { newZipCode in
                    zipCode = newZipCode
                    fetchForecastData()
                    fetchLocationData()
                }
            )
        }
    }
    
    private func fetchForecastData() {
        // Trigger API call to refresh data
        ForecastAPI(zipCode: "\(zipCode)").getForecastData { fetchedDaypart in
            DispatchQueue.main.async {
                self.daypart = fetchedDaypart
                self.scrollToTopID = UUID()
            }
        }
    }
    
    private func fetchLocationData() {
       LocationAPI(zipCode: "\(zipCode)").getLocationtData { fetchedLocation in
            DispatchQueue.main.async {
                self.location = fetchedLocation
                self.scrollToTopID = UUID()
            }
        }
    }
}

struct ZipCodeChangeSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var enteredZipCode: String = ""
    @State private var isValidating = false
    @State private var validationMessage = ""
    @State private var isValid = false
    
    let currentZipCode: String
    let onZipCodeChanged: (String) -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Change Location")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Current Zip Code: \(currentZipCode)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    TextField("Enter new zip code", text: $enteredZipCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .onSubmit {
                            validateZipCode()
                        }
                }
                .padding(.horizontal)
                
                if !validationMessage.isEmpty {
                    Text(validationMessage)
                        .font(.caption)
                        .foregroundColor(isValid ? .green : .red)
                        .padding(.horizontal)
                }
                
                if isValidating {
                    ProgressView("Validating...")
                        .padding()
                }
                
                Button(action: validateZipCode) {
                    Text("Validate Zip Code")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(enteredZipCode.isEmpty || isValidating)
                
                Button(action: {
                    if isValid {
                        onZipCodeChanged(enteredZipCode)
                        dismiss()
                    }
                }) {
                    Text("Use This Zip Code")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isValid ? Color.green : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(!isValid)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            enteredZipCode = currentZipCode
        }
    }
    
    private func validateZipCode() {
        guard !enteredZipCode.isEmpty else {
            validationMessage = "Please enter a zip code"
            isValid = false
            return
        }
        
        // Basic format validation
        guard enteredZipCode.count == 5, enteredZipCode.allSatisfy({ $0.isNumber }) else {
            validationMessage = "Zip code must be 5 digits"
            isValid = false
            return
        }
        
        isValidating = true
        validationMessage = ""
        
        // Use your existing LocationAPI to validate the zip code
        LocationAPI(zipCode: enteredZipCode).getLocationtData { fetchedLocation in
            DispatchQueue.main.async {
                isValidating = false
                if let location = fetchedLocation, !location.location.city.isEmpty {
                    validationMessage = "Valid - \(location.location.city)"
                    isValid = true
                } else {
                    validationMessage = "Invalid zip code or location not found"
                    isValid = false
                }
            }
        }
    }
}

#Preview {
    ForecastView()
}

struct SetBackgroundz: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(0.8),
                Color.blue.opacity(0.3)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct dividerz: View {
    var body: some View {
        Divider()
            .frame(height: 0.7)
            .background(Color.primary)
            .padding(.horizontal)
            .padding(.top)
    }
}

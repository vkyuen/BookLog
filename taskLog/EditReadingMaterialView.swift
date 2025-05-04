//
//  EditReadingMaterialView.swift
//  taskLog
//
//  Created by Veronica Yuen on 5/2/25.
//

import SwiftUI
import SwiftData

struct EditReadingMaterialView: View {
    @Bindable var readingMaterial: ReadingMaterial
    
    var body: some View {
        Form {
            // general information
            TextField("Title", text: $readingMaterial.title)
            TextField("Author", text: $readingMaterial.author)
            // Number of chapters
            Picker("Number of chapters", selection: $readingMaterial.chapter){
                ForEach(0 ..< 100){
                    Text("\($0) chapter")
                }
            }
            // number of words
            // source
            // format
            
            // My own tracker
            // type of reading
            // date added
            // date started
            // date ended
            // Elapsed time
            // status
        }
    }
}

#Preview {
     
}

import Cocoa
import TabularData
import CreateML


let csvURL = Bundle.main.url(forResource: "all-data", withExtension: "csv")!
let dataFrame = try DataFrame(contentsOfCSVFile: csvURL)

let classifier = try MLTextClassifier(trainingData: dataFrame, textColumn: "text", labelColumn: "sentiment")
let metaData = MLModelMetadata(author: "Utkarsh", version: "1.0")
try classifier.write(toFile: "./Users/uraj/Desktop/sentiment.mlmodel",metadata: metaData)
print(dataFrame[1...10])


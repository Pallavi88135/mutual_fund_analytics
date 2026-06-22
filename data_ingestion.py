import pandas as pd
import os

data_folder = "data/raw"

if not os.path.exists(data_folder):
    print(f"Folder '{data_folder}' not found!")
else:
    csv_files = [f for f in os.listdir(data_folder) if f.endswith(".csv")]
    
    if len(csv_files) == 0:
        print("No CSV files found in data/raw folder yet.")
        print("Please add CSV files to C:\\mutual_fund_analytics\\data\\raw\\")
    else:
        for file in csv_files:
            filepath = os.path.join(data_folder, file)
            df = pd.read_csv(filepath)
            print(f"\n--- {file} ---")
            print("Shape:", df.shape)
            print("Head:\n", df.head())
            print("Nulls:\n", df.isnull().sum())

print("\nData ingestion script complete!")
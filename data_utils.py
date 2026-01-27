import pandas as pd
from IPython.display import display

def show_total_info(df, n):
    """Muestra vista general del Dataframe"""
    
    print("HEAD: ")
    display(df.head(n))
    
    print("\nINFO: ")
    df.info()
    
    print("\nDESCRIBE: ")
    display(df.describe())

    print("\nSHAPE: ")
    print(df.shape)

def mis_dupl(df):
    "Devuelve conteno de nulos por columnas y numero de filas duplicadas"
    
    missing = df.isna().sum()
    print("Missing values: ")
    print(missing)

    duplicates = df.duplicated().sum()
    print("Duplicates values: ")
    print(duplicates)



def uni_valuecount_columns(df, column, normalize=False):
    """Muestra valores unicos, frecuencias de una columna, y nombres de columnas"""
    
    print("Nombre de las columnas: ")
    print(df.columns)

    print("\nValores unicos")
    print(df[column].unique())

    print("\nValue counts: ")
    print(df[column].value_counts(normalize=normalize))

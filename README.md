# Proyecto SQL – ¿Está el rock en decadencia?

## 📌 Descripción del proyecto
Este proyecto analiza la evolución del **rock como género musical** y evalúa si puede considerarse un género en decadencia dentro del mainstream actual.  
Para ello, se combinan **datos históricos de popularidad** con **datos de consumo contemporáneo**, utilizando SQL como herramienta principal de análisis.

El estudio se centra en comparar la presencia y popularidad del rock frente a otros géneros a lo largo del tiempo.

---

## 🎯 Objetivo
Determinar si el rock ha perdido relevancia en las listas de música más populares, analizando:
- Su presencia en el mainstream por décadas
- Su popularidad actual en plataformas de streaming
- La vigencia de artistas rock históricos

---

## 🗂️ Fuentes de datos

### 1. Billboard Year-End Hot 100
- Contiene el Top 100 anual de canciones desde mediados del siglo XX
- Aporta el **contexto histórico** del mainstream musical

**Tabla:** `billboard`  
**Campos clave:** artista, año, ranking

---

### 2. Spotify
- Contiene información de popularidad y géneros musicales
- Representa el **consumo musical actual**

**Tabla:** `spotify`  
**Campos clave:** artista, popularidad, géneros, año

---

### 3. Dataset Rock
- Lista de artistas identificados como pertenecientes al género rock
- Se utiliza exclusivamente como **etiqueta de género**

**Tabla:** `rock`  
**Campo clave:** artista

---

## 🛠️ Preparación de los datos
- Los CSVs fueron limpiados y exportados desde Python
- Se gestionaron problemas de encoding utilizando `utf8mb4`
- Los datos se importaron en MySQL mediante `LOAD DATA LOCAL INFILE`
- No se eliminaron registros para evitar sesgos en el análisis

---

## 🔗 Integración de datos (JOINs)

### Billboard + Spotify
Se utiliza un `INNER JOIN` para relacionar artistas con impacto histórico y presencia actual:

```sql
INNER JOIN spotify s
ON LOWER(b.artist_name) = LOWER(s.artist_name)

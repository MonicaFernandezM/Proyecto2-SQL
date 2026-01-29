# 🎸 Proyecto SQL Rock  
**El papel del rock en tiempos de streaming**

## 📌 Descripción del proyecto
Este proyecto analiza la evolución del **rock** a lo largo del tiempo combinando datos históricos de **Billboard Hot 100** con métricas actuales de **Spotify**.  
El objetivo es entender **cómo ha cambiado la presencia del rock por décadas**, su **popularidad actual** y **qué artistas siguen dominando el consumo musical**.

El proyecto se ha desarrollado utilizando **Python (pandas)** para la limpieza y preparación de datos, y **MySQL** para el modelado relacional, consultas y análisis final.

---

## 🧱 Modelo de datos
Se trabajó con un **modelo relacional normalizado**, centrado en la entidad `artists`, que actúa como tabla principal.

### Tablas principales:
- **artists**
  - `artist_id` (PK)
  - `artist_name`

- **billboard_clean**
  - `rank`
  - `track_name`
  - `year`
  - `artist_id` (FK)

- **spotify_clean**
  - `popularity`
  - `genre_name`
  - `artist_id` (FK)

- **rock_clean**
  - Artistas clasificados como rock
  - `artist_id` (FK)

Todas las tablas están relacionadas mediante **claves foráneas (`artist_id`)**, lo que permite realizar joins consistentes y análisis cruzados.

---

## 🔗 Relaciones (Joins)
Se utilizan principalmente **INNER JOINs** para:
- Relacionar artistas con su presencia histórica en Billboard
- Cruzar popularidad actual (Spotify) con datos históricos
- Filtrar únicamente artistas clasificados como rock

## 📐 Visualización de resultados## 

Los resultados se presentan mediante slides visuales, incluyendo:

- Gráficos de barras por décadas (Billboard vs Spotify)

- Comparación de popularidad media

- Rankings de artistas más escuchados

Las visualizaciones se realizaron con Canva, manteniendo coherencia visual y narrativa.

##🛠️ Tecnologías utilizadas##

- **Python**:
  - pandas
    
- **MySQL**:
  - MySQL Workbench
 
- **SQL**:
  - Joins
  - Group By
  - Funciones de agregación

- **Canva**:
  - Visualización de datos
 
## ⚠️ Limitaciones ##

Billboard solo refleja rankings históricos y no consumo real actual.

La clasificación de géneros depende de etiquetas de Spotify.

No se incluyen datos de streaming históricos anteriores a Spotify.

## 🚀 Posibles mejoras futuras ##

Incorporar datos de otras plataformas (Apple Music, YouTube).

Analizar subgéneros del rock.

Estudiar tendencias por país o región.

Crear dashboards interactivos.

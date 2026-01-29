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


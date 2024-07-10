# Proyecto Full Stack con React + Vite y Java 11 Spring Boot con Gradle

[![Node v20](https://img.shields.io/badge/Node.js-v20-blue)](https://nodejs.org/en) 
[![Java JDK11](https://img.shields.io/badge/Java-jdk11-yellow)](https://www.oracle.com/mx/java/technologies/javase/jdk11-archive-downloads.html)
[![React](https://img.shields.io/badge/React-JS-blue)](https://es.react.dev/)


## Descripción

Este proyecto es una aplicación web full stack que utiliza React con Vite en el frontend y Java 11 con Spring Boot y Gradle en el backend, conectada a una base de datos SQL Server. 

Prueba técnica para P3 desarrollo de fullstack on Java, Spring Framework y React

## Requerimientos

### Backend

- Java 11
- Gradle
- SQL Server

### Frontend

- Node.js (versión 18 o superior)

## Instalación y Configuración

### Clonar el repositorio

```bash
git clone https://github.com/diegomtzcdo/fullstack-patito.git
cd fullstack-patito
```

### Base de Datos

1. Asegúrate de tener SQL Server instalado y en ejecución.
2. Ejecuta el script `scriptDB.sql` para crear y poblar la base de datos `patitoP3`.

```sql
sqlcmd -S <SERVER> -U <USERNAME> -P <PASSWORD> -d master -i scriptDB2.sql
```

Asegúrate de reemplazar `<SERVER>`, `<USERNAME>` y `<PASSWORD>` con los valores adecuados.

### Backend

[Repositorio Backend](https://github.com/diegomtzcdo/back-patito/tree/master)

1. Asegúrate de tener Java 11 y Gradle instalados en tu sistema.
2. Configura la conexión a la base de datos SQL Server en `src/main/resources/application.properties`:

```
spring.datasource.url=jdbc:sqlserver://<SERVER>:<PORT>;databaseName=patitoP3
spring.datasource.username=<USERNAME>
spring.datasource.password=<PASSWORD>
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.SQLServerDialect
```

3. Navega a la carpeta del Proyecto

```bash
cd back-java
```

4. Para ejecutar el backend:

```bash
./gradlew bootRun
```

### Frontend

[Repositorio Frontend](https://github.com/diegomtzcdo/front-patito)

1. Asegúrate de tener Node.js instalado en tu sistema.
2. Navega al directorio `frontend`:

```
cd front-react
```

3. Instala las dependencias:

```
npm install
```

4. Para ejecutar el frontend en el puerto 5173:

```
npm run dev -- --port 5173
```

## Datos de Prueba

```
Email:
cdodiegomtz+cliente@gmail.com
Pass:
P4ssw0rd#dev
```

# Contacto

[![Mail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:cdodiegomtz@gmail.com)

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/cdoDiegomtz)

# Recetas

Esta aplicación te permite descubrir recetas auténticas de Perú y Colombia, con información detallada sobre su lugar de origen para sumergirte en la cultura culinaria de estos dos países.

## Características Principales

- **Arquitectura DDD (Domain Driven Design):** La aplicación sigue una arquitectura DDD para organizar y estructurar el código de manera clara y modular.
  * recipes - capa de presentación
  * domain - capa de dominio donde encontramos nuestras reglas de negocio, objetos de dominio y casos de uso
  * infrastructure - capa mas externa donde encontramos los detalles como Cliente Http

Diagrama
![arquitectura_recetas_ios drawio](https://github.com/0MoNa15/recetasIOS/assets/21272764/ac27a420-cd10-454a-afea-12ee0538dbac)


- **Patrones de Diseño Utilizados:**
  - Repository: Para gestionar el acceso a datos.
  - ModelMapper: Para mapear modelos entre capas.
  - Translator: Para traducir modelos entre la capa de datos y la capa de dominio.
  - MVVM (Model-View-ViewModel): Para separar las capas de presentación y lógica de negocio.

- **Tecnologías y Bibliotecas Utilizadas:**
  - Swift UI: Para la creación de interfaces de usuario modernas.
  - Alamofire: Para realizar conexiones HTTP REST.
  - Combine: Para el manejo de hilos y ejecución asíncrona.
  - MapKit: Integración de mapas para mostrar la ubicación de las recetas.
  - Swinject: Para la inyección de dependencias.
  - CocoaPods: Para el manejo de dependencias

## Servidores
- **Servidor de Imágenes:** [ImgBB](https://mona15.imgbb.com/)
- **Servidor de Endpoints:** [Mockable](https://www.mockable.io/)

## Demo
Este es el comportamiento de la aplicación:

![ios_gif_app](https://github.com/0MoNa15/recetasIOS/assets/21272764/aa7e3ff6-824d-41bb-990f-8b8d4cbc3afe)

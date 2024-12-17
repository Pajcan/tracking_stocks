# Tracking Stocks APP
## Project Overview
This project demonstrates a feature-based architecture approach using Flutter. It is a simplified implementation suitable for this specific task but designed with scalability in mind. For a larger, real-world application, these modules can be further split into separate Dart packages.

## Architecture Overview
The project is structured into the following directories:

- core: 
Contains the foundational modules used across the app:

  - Networking: Retrofit for REST API communication
  - Config: Application configurations
  - Constants: Static constants
  - Error Handling: Centralized exception and failure handling
  - Localization: Support for localization strings
  - Utils: General utility functions
- features
Implements the Portfolio feature using Clean Architecture principles. It is divided into three layers:

  - Data: Repository implementations and data sources (API services, models)
  - Domain: Business logic and use cases
  - Presentation: UI and state management using BLoC (in some cases Cubit)
- shared_ui
Contains reusable components and styles:

  - Common UI widgets
  - Colors and themes
- app
The entry point of the application, containing:

  - Application setup (app.dart)
  - Dependency Injection (DI) module using GetIt and injector

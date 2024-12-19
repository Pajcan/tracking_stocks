# Tracking Stocks APP
## Project Overview
This project demonstrates a feature-based architecture approach using Flutter, following Clean Architecture principles. It is a simplified implementation suitable for this specific task but designed with scalability in mind. For a larger, real-world application, these modules can be further split into separate Dart packages.

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

# Testing
I have implemented a few tests to showcase my approach:

- Unit Tests: For core business logic.
- BLoC Tests: To validate the state management behavior.
- Widget Tests: To ensure UI components behave as expected.
* Note: Due to time constraints, I did not achieve full test coverage for all features but focused on key parts as a demonstration.

# Build Instructions
If link expired, create new response at https://run.mocky.io/
- Replace path in core/constants/app_constants.dart $portfolioPath
- Run: pub get
- Run: flutter pub run build_runner build --delete-conflicting-outputs


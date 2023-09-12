
# Project Overview: Weather Application

[![codecov](https://codecov.io/gh/MrBooi/flutter_technical_test/main/develop/graph/badge.svg?token=S7FSV6FZ58)](https://codecov.io/gh/MrBooi/flutter_technical_test)

This a weather application that will provide users with up-to-date weather information for their current location, along with a 5-day weather forecast. The application will feature a visually appealing user interface with one design options Forest and will change background image depending if its Raining, Sunny and Cloudy.

# Project Objectives:

 - Location-Based Weather: The application will utilize the user's current location to get weather for current users location.
 - API Integration: The app will use openWeather API to collect and display weather information. The API will provide the necessary data for current conditions and the 5-day forecast.
 - Design Selection: App uses one design called forest offering a visually pleasing and engaging interface.
  

# Project Architecture overview: Clean Architecture

Current app is built using a clean architecture which is a software design pattern that helps organize thr codebase into distinct layers with well-defined responsibilities. without a doubt it promotes separation of concerns, maintainability, and testability of the code while ensuring scalability and flexibility.

# Clean Architecture layer overview:

Clean architecture is made up of 4 layers namely: Domain Layer, Data layer, Core layer and Presentation layer

1. Core Layer:
   - This layer is responsible for keeping shared core data across all features.
   - it contains all the reusable widgets, cubit and so on.

2. Data Layer:
    - The Data Layer handles data access.
    - It includes data sources (e.g., API, local database), data models, and repositories.
    - Data models are responsible for mapping data between the domain and data layers.
    - Repositories implement the abstract repository interfaces defined in the domain layer and coordinate data retrieval.

3. Domain Layer: 
    - The Domain Layer defines the core business logic of the application.
    - It consists of use cases, entities, and abstract repositories.
    - Use cases encapsulate specific application behaviors or features.
    - Entities represent the essential business objects, often modeled as Dart classes.
    - Abstract repositories define contracts for data retrieval and storage operations but do not implement the actual data  source details
  
4.  Presentation Layer:
   - This layer is responsible for the user interface (UI) and interaction with the user.
   - It contains widgets, screens, and views that are shared within a feature not with other feature.
   - The Presentation Layer is built using Flutter's widgets and can use Bloc as a state management solution.
   - It have minimal business logic, focusing primarily on rendering data and handling user inputs.
    

These layers are glued by Dependency Injection which is used to provide instances of dependencies to different layers of the application, to ensures that the layers remain loosely coupled and facilitates unit testing by enabling the injection of mock dependencies.

# Purpose of Fvm:

On this app i've added FVM  which simplifies the management of Flutter versions, making it easier for developers to work on multiple projects with different Flutter requirements and ensuring stability and compatibility throughout the development process.

# Github Test workflow:

I've added test workflow which ensures that your Flutter project is properly tested, and code coverage information is reported to Codecov, allowing you to track code quality and test coverage. It also uses FVM for Flutter version management. Test workflow will pass or fail depending if were above or below the 75% threshold.


Please make use of the Makefile in the root of the project which contains commands that will make it easy to run the app and check code coverage for the tests.

# How to Run the project:

```
 make run_mobile
```

# How to Run Tests:

```
  make flutter_test
```
# How to See Test coverage in your browser:

```                                        main ● ?
 make flutter_cov_test
```


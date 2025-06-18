# AUVNET Internship Assessment

A comprehensive Flutter e-commerce application built as part of the AUVNET internship assessment. This project demonstrates modern Flutter development practices with clean architecture, state management, and backend integration.

## 📱 Project Overview

This Flutter application is a simple e-commerce platform that includes:
- **Authentication System**: User registration and login
- **Onboarding Flow**: Welcome screens for new users
- **Home Screen**: Product display with promotional banners
- **Profile Management**: User profile with image upload and address management
- **Cart & Category Features**: E-commerce functionality
- **Delivery System**: Order delivery management

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.8.0)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation Guide

1. **Clone the repository**
   ```bash
   git clone https://github.com/Selim513/AUVNET-Internship-Assessment.git
   cd AUVNET-Internship-Assessment
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Environment Setup**
   - Create a `.env` file in the root directory
   - Add your Supabase credentials:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 🏗️ Architecture Overview

### Clean Architecture Implementation

The project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core utilities and shared components
│   ├── cache/              # Local data caching
│   ├── errors/             # Error handling
│   ├── observer/           # BLoC observers
│   ├── service_locator/    # Dependency injection
│   ├── uses_case.dart      # Base use case implementation
│   ├── utils/              # Utility functions
│   └── widgets/            # Shared UI components
└── features/               # Feature-based modules
    ├── auth/               # Authentication module
    ├── home/               # Home screen module
    ├── profile/            # Profile management module
    ├── onboarding/         # Onboarding flow
    ├── cart/               # Shopping cart
    ├── category/           # Product categories
    ├── delivery/           # Delivery management
    └── splash_screen/      # App splash screen
```

### Architectural Rationale

1. **Feature-Based Structure**: Each feature is self-contained with its own data, domain, and presentation layers
2. **Separation of Concerns**: Clear boundaries between business logic, data access, and UI
3. **Dependency Inversion**: Abstractions define contracts, implementations depend on abstractions
4. **Testability**: Each layer can be tested independently

### Layer Breakdown

#### Data Layer
- **Data Sources**: Handle external data (APIs, local storage)
- **Repositories**: Implement domain contracts, coordinate data sources
- **Models**: Data transfer objects and entity mappings

#### Domain Layer
- **Entities**: Business objects
- **Use Cases**: Business logic operations
- **Repository Interfaces**: Contracts for data access

#### Presentation Layer
- **BLoC**: State management using BLoC pattern
- **Views**: UI screens and widgets
- **Models**: Presentation-specific data models

## 🛠️ Technologies & Dependencies

### Core Dependencies
- `flutter_bloc: ^9.1.1` - State management
- `supabase_flutter: ^2.9.1` - Backend services
- `shared_preferences: ^2.5.3` - Local data persistence
- `get_it: ^8.0.3` - Dependency injection
- `equatable: ^2.0.7` - Value equality

### UI & UX
- `flutter_screenutil: ^5.9.3` - Responsive design
- `google_fonts: ^6.2.1` - Typography
- `flutter_svg: ^2.2.0` - Vector graphics
- `cached_network_image: ^3.4.1` - Image caching
- `carousel_slider: ^5.1.1` - Image carousels
- `smooth_page_indicator: ^1.2.1` - Page indicators

### Additional Features
- `image_picker: ^1.1.2` - Camera/gallery image selection
- `persistent_bottom_nav_bar: ^6.2.1` - Navigation
- `device_preview: ^1.2.0` - Device testing
- `flutter_dotenv: ^5.2.1` - Environment configuration

## 🔧 Key Features Implementation

### Authentication System
- **Supabase Auth**: Secure user registration and login
- **Session Management**: Persistent user sessions
- **Form Validation**: Input validation and error handling

### Profile Management
- **Image Upload**: Camera and gallery integration
- **Local Storage**: Profile image caching
- **Address Management**: User address storage with Supabase sync
- **User Data Sync**: Real-time profile updates

### Home Screen
- **Promotional Banners**: Dynamic banner fetching from Supabase
- **Product Display**: Organized product presentation
- **Navigation**: Smooth navigation between screens

### Data Management
- **Offline Support**: Local data caching with SharedPreferences
- **Image Caching**: Efficient image loading and caching
- **State Persistence**: Maintain app state across sessions

## 🎯 State Management Strategy

The application uses **BLoC (Business Logic Component)** pattern for state management:

- **Centralized State**: All business logic centralized in BLoCs
- **Reactive Programming**: Stream-based state updates
- **Separation of Concerns**: UI reacts to state changes
- **Testable**: Business logic easily unit tested

## 📊 Backend Integration

### Supabase Services
- **Authentication**: User management and session handling
- **Database**: Real-time data synchronization
- **Storage**: File upload and retrieval


### Data Flow
1. **User Actions** → BLoC Events
2. **BLoC** → Use Cases
3. **Use Cases** → Repository
4. **Repository** → Data Sources (Supabase/Local)
5. **Data Sources** → Repository → BLoC → UI

## 🔐 Security & Best Practices

- **Environment Variables**: Sensitive data in `.env` files
- **Input Validation**: All user inputs validated
- **Error Handling**: Comprehensive error management
- **Code Organization**: Clean, maintainable code structure

## 📈 Future Enhancements

- Product search and filtering
- Payment integration
- Order tracking
- Push notifications
- Advanced user preferences
- Social authentication

## 👨‍💻 Developer Information

**Project**: AUVNET Internship Assessment  
**Framework**: Flutter  
**Architecture**: Clean Architecture with BLoC  
**Backend**: Supabase  
**Repository**: [GitHub Link](https://github.com/Selim513/AUVNET-Internship-Assessment)


# StudentManager App using Flutter, GetX, Django REST API  
Available for Android & Web

## Overview

**StudentManager** is a cross-platform application built with Flutter for managing student data through a backend powered by Django REST Framework (DRF). The app allows users to **create**, **read**, **update**, and **delete** (CRUD) student records seamlessly. It also supports **live data updates**, where the student data table reflects changes in real-time. This app is available for both Android and the Web.

## Key Features

- **View Students**: Display a list of students in a dynamic DataTable.
- **Add New Student**: Easily add new student data via a floating action button (FAB) and an interactive dialog.
- **Edit Student**: Update student details with a simple tap on the edit icon.
- **Delete Student**: Remove student records via the delete icon.
- **Real-time Updates**: The table updates automatically whenever a new student is added or data is modified.
- **GetX State Management**: GetX is used for efficient state management and API handling.
- **Responsive Design**: Optimized for both Android and web platforms.

## Tech Stack

- **Frontend**: Flutter using **GetX** for state management and **DataTable** for tabular data representation.
- **Backend**: Django REST Framework (DRF) API for CRUD operations.

## How It Works

- **Student List View**: Displays all student records in a scrollable DataTable.
- **Floating Action Button (FAB)**: Tapping this opens a dialog to add or edit student information (Name, Roll, City).
- **Real-Time Update**: Any changes (add, edit, delete) to student records will be instantly reflected in the DataTable without requiring a refresh.

## Installation and Setup

### Prerequisites

1. **Flutter SDK**: Make sure Flutter is installed on your machine. You can follow the [official Flutter documentation](https://flutter.dev/docs/get-started/install) for installation instructions.
2. **Backend**: Ensure the Django REST API backend is set up and running. The instructions for setting up the backend are available in the backend repository.

### Steps

1. **Clone the repository**:

   ```bash
   git clone https://github.com/edutrack.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd frontend
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the app** on Android or Web:

   ```bash
   flutter run
   ```

   For web-specific:

   ```bash
   flutter run -d chrome
   ```

### Backend API

Ensure the backend Django REST API is running locally or hosted. Update the `baseURL` in your Flutter app with the correct API endpoint.

```dart
const String baseURL = "http://your-backend-url/api/";
```

## Contributions

Feel free to contribute to this project by submitting issues or pull requests.

## License

This project is licensed under the MIT License.

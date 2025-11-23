# Project Blueprint

## Overview

This document outlines the structure, features, and implementation plan for the Flutter application. The goal is to create a plant care application with features like diagnosing plant issues, managing a personal garden, and learning more about plants.

## Implemented Features (Initial State)

*   **UI Structure:**
    *   Bottom Navigation Bar for main screens.
    *   Home Screen with a welcome message and basic layout.
    *   Placeholder screens for "Diagnose", "My Garden", and "More".
*   **Styling:**
    *   Basic theme with a green color scheme.
    *   Usage of a custom logo asset.

## Current Plan: Integrate Firebase Authentication

Based on the user's request, the following steps will be performed to add login and registration functionality.

### 1. Add Dependencies
*   Add `firebase_core` for Firebase initialization.
*   Add `firebase_auth` for authentication services.

### 2. Configure Firebase
*   Add the necessary Firebase configuration to the project so it can connect to the backend.
*   Initialize Firebase in the `main.dart` file.

### 3. Create Authentication Screen
*   Create a new file `lib/screens/auth_screen.dart`.
*   Implement the UI for both Login and Register forms as shown in the provided images.
*   Add the business logic to communicate with Firebase Auth for user creation and sign-in.

### 4. Update Application Flow
*   Modify `lib/main.dart` to show the `AuthScreen` if the user is not logged in.
*   If the user is already logged in, show the main application screen (`HomeScreen` with the bottom navigation).

### 5. Add Logout Functionality
*   Add a logout button to the `HomeScreen` to allow users to sign out.


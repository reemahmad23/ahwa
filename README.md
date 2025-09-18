# smart_ahwa_manager

A Flutter app for managing orders in a traditional Cairo **ahwa**.  
It allows the owner to add orders, mark them as completed, view pending ones, and generate daily reports.

---

## 📸 Project Screenshots

### 1. Model Structure
![Model](assets/images/model.jpg)

### 2. Order Model
![Order Model](assets/images/order_model.jpg)

### 3. Order Use Case
![Order Use Case](assets/images/order_use_case.jpg)

---

## 🎯 Design & SOLID Principles

This project applies **core OOP concepts** and at least **three SOLID principles**:

- **Encapsulation**  
  Implemented in the `Order` class (private fields with public getters and controlled mutation via `markCompleted`).

- **Inheritance & Polymorphism**  
  Used in the `Drink` hierarchy (`Tea`, `TurkishCoffee`, `HibiscusTea`).  
  The UI and business logic treat drinks abstractly as `Drink`, while concrete types define their own `price` and `displayName`.

- **Single Responsibility Principle (SRP)**  
  Each class has one reason to change:  
  - Entities (`Order`, `Drink`) hold data.  
  - `OrderRepository` handles persistence.  
  - `ReportService` handles reporting.  
  - Use-cases wrap domain actions.  
  - Managers handle UI state.

- **Open/Closed Principle (OCP)**  
  The app is open to extension but closed to modification.  
  For example, adding a new `Drink` subclass or new report doesn’t require changing existing consumers.

- **Dependency Inversion Principle (DIP)**  
  High-level modules (use-cases, services, managers) depend on abstractions (`OrderRepository`) rather than concrete implementations.  
  The `InMemoryOrderRepository` is injected at app startup.

---

## 🚀 Getting Started

This project is a starting point for a Flutter application.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the  
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

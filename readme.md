# 🗺️ BucketList

A SwiftUI app that lets users **mark, save, edit, and delete favorite places on a map**, protected with **Face ID / Touch ID authentication**.
It also shows **nearby Wikipedia information** for any saved location using the **Wikipedia API**.

---

## 📱 Features

- 🧭 **Interactive Map**
  - Tap anywhere on the map to add a new location pin.
  - Switch between **Standard** and **Hybrid** map styles.

- 🔐 **Biometric Authentication**
  - Uses **Face ID** or **Touch ID** to unlock access to saved places.

- 📝 **Edit & Delete Saved Locations**
  - Rename or describe any saved place.
  - Delete places directly from the edit screen.

- 🌍 **Wikipedia Integration**
  - Fetches and displays nearby points of interest for each location.
  - Uses the Wikipedia REST API to show location details.

- 💾 **Persistent Storage**
  - Saves locations securely using JSON encoding.
  - Data is protected with `.completeFileProtection`.



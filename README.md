# Galadima3 Portfolio Site

A personal portfolio site built with **Flutter**, hosted via GitHub Pages, showcasing my work and skills.

---

## 🚀 Features

- Responsive design for web (desktop/tablet/mobile)  
- Modular components for easy updates  
- A showcase of projects, skills, and contact info  
- Assets management (images, icons, etc.)  

---

## 📂 Repository Structure

```
├── .github/ # GitHub workflows & CI/CD 
├── android/ # Android build outputs (if building for Android)
├── ios/ # iOS build outputs
├── lib/ # Main Dart/Flutter source code
├── web/ # Web-specific assets / entrypoints
├── assets/ # Static assets: images, fonts, icons, etc.
├── test/ # Unit/widget tests
├── pubspec.yaml # Flutter dependencies & metadata
├── analysis_options.yaml # Lint and analysis rules
└── README.md # Project overview (this file)
```

## 🛠 Getting Started

These instructions will help you run the project locally, make changes, and deploy updates.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version compatible with web builds)  
- Git  
- A code editor (VS Code, IntelliJ, etc.)

### Setup

```bash
# Clone the repo
git clone https://github.com/Galadima3/Galadima3.github.io.git
cd Galadima3.github.io

# Install dependencies
flutter pub get
```
## Run locally (for web)
```bash
flutter run -d chrome
```

## 📦 Building & Deploying

### Build the web version and prepare for deployment:

```bash
flutter build web
```
Then push the build output (typically build/web/) to GitHub Pages branch (often gh-pages or master depending on your setup).
### 🔄 Automating Deployment with GitHub Actions

Instead of manually building and pushing every time, you can automate deployment using GitHub Actions.

-  Create a .github/workflows/deploy.yml file in your repo.
- Add the following workflow:

```yaml
name: Deploy Flutter Web to GitHub Pages

on:
  push:
    branches:
      - main  # or master, depending on your default branch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Install dependencies
        run: flutter pub get

      - name: Build web
        run: flutter build web --release

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web

```
- Commit and push.

- Every push to your main branch will automatically:

   - Install Flutter

   - Build the web app

   - Deploy it to GitHub Pages


## 📜 License

This project is licensed under the **MIT License** – see the [LICENSE](./LICENSE.txt) file for details.


## 📱 Contact 

Author: **Galadima3**

Contact: Galadima3@protonmail.com

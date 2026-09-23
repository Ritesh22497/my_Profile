# 🚀 Flutter Web Portfolio - GitHub Pages Live Publish Guide

Aapka poora portfolio **Flutter & Dart** me ban chuka hai! Isme senior developer animations, CustomPainter particle effects, responsive design, aur resume ki poori jankari shamil hai.

GitHub Pages par ise live chalane ke liye GitHub Actions workflow (`.github/workflows/deploy.yml`) pehle se hi set kar diya gaya hai. Jab bhi aap code push karenge, GitHub automatically ise Flutter Web me build karke live kar dega!

---

## Step 1: GitHub par New Repository Banayein
1. Apne browser me **[https://github.com/new](https://github.com/new)** kholein.
2. Repository name me likhein: `my_profile` (ya jo naam aap chahein).
3. Isko **Public** select karein.
4. **"Initialize this repository with a README"** ko uncheck (khali) rehne dein.
5. **"Create repository"** button par click karein.

---

## Step 2: VS Code / Terminal me Git Commands Run Karein
Apne terminal (`f:\flutter2026\my_profile`) me ye commands run karein:

```bash
# 1. Git initialize karein
git init
git branch -M main

# 2. Saari files add karein
git add .

# 3. Commit karein
git commit -m "feat: launch senior flutter developer portfolio in flutter web"

# 4. Apni GitHub repository ko link karein
git remote add origin https://github.com/Ritesh22497/my_profile.git

# 5. Push karein
git push -u origin main
```

---

## Step 3: GitHub Pages Enable Karein (1-Minute Setup)
1. Apni repository kholein: `https://github.com/Ritesh22497/my_profile`
2. Upar **Settings** tab par click karein.
3. Left sidebar me **Pages** par click karein.
4. **Build and deployment** section ke andar:
   - **Source** dropdown me select karein: **"GitHub Actions"**
5. Bas! Ab repository ke **Actions** tab me automatic build shuru ho jayega.
6. 1-2 minute me aapka Flutter Web portfolio is URL par live chalne lagega:
   👉 **`https://ritesh22497.github.io/my_profile/`**

---

## 💻 Local Machine Par Kaise Run Karein:
Agar aap apne laptop par abhi Flutter Web dekhna chahte hain:
```bash
flutter run -d chrome
```
Ya:
```bash
flutter run -d edge
```

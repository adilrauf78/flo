# 🌸 Flo - Baby Growth, Cycle & Wellness Tracker (Flutter App)

**Flo** is a beautiful and smart wellness tracking app made with **Flutter**, focused on helping users track baby growth, menstrual or pregnancy cycles, and keep personal health notes. The app features a clean, smooth UI with interactive flows and calendar-based tracking.

---

## 🧠 App Highlights

### 👩‍🍼 Baby Age Tracker
- Select baby’s birthdate
- View baby's current age in **days**, **weeks**, or **months**
- Scroll ahead to see how old the baby will be on a future date

### 🚺 Cycle Check System
- Track menstrual or pregnancy cycles
- View fertile and non-fertile days using calendar views
- Smart UI for period logging and reminders

### 📝 Post Screen
- Create personal notes/posts related to baby, health, or cycles
- View all previous posts
- Option to edit or delete posts
- Posts stored locally or via database (if integrated)

### 🗑️ Delete Functionality
- Delete cycle entries or personal posts
- Clean UI with confirmation before deletion

### 🚀 Smooth Onboarding
- First-time users answer personalized setup questions
- Choices guide app features shown later
- Controlled navigation using GetX

---

## 🧠 Key Features

- 🧠 Step-by-step onboarding flow
- 👶 Baby growth tracking by days, weeks, and months
- 🩸 Menstrual and fertility cycle calendar
- 📝 Personal note and post creation
- 🗑️ Delete specific posts
- 🏠 Clean and responsive home dashboard

---


## 💡 Tech Stack

| Layer        | Tech                         |
|--------------|------------------------------|
| UI           | Flutter + Custom Clippers    |
| State Mgmt   | GetX                         |
| Calendar     | Syncfusion + Paged Calendar  |
| Date Tools   | intl                         |

---

## 📦 Packages Used

```yaml
dependencies:
  flutter_screenutil: ^5.9.3         # Responsive UI
  flutter_svg: ^2.0.11               # SVG icons
  get: ^4.6.6                        # State management
  iconsax: ^0.0.8                    # Modern icon set
  paged_vertical_calendar: ^1.1.9   # Scrollable calendar view
  intl: ^0.19.0                      # Date formatting
  google_fonts: ^6.2.1              # Fonts
  flutter_custom_clippers: ^2.1.0   # UI wave/curve design
  toggle_switch: ^2.3.0             # Switch toggles
  syncfusion_flutter_datepicker: ^27.2.2  # Date picker
  simple_gradient_text: ^1.0.3      # Gradient text

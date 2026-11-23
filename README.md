<div align="center">

<img src="https://img.shields.io/badge/COMP_303-Year_III_·_Semester_I-6366F1?style=for-the-badge&logo=academia&logoColor=white" alt="Course"/>
<img src="https://img.shields.io/badge/Kathmandu_University-CSE-8B5CF6?style=for-the-badge&logo=google-scholar&logoColor=white" alt="Institution"/>

<br/><br/>

<img src="https://ui-avatars.com/api/?name=C&background=1E3A8A&color=fff&size=120&bold=true&rounded=true&font-size=0.55" width="90" alt="Createbook"/>

# **Createbook**
### 🚀 *A Facebook for Creators* 🚀

<br/>

*A dedicated social networking platform where creators share project & research ideas, discover like-minded collaborators, and build meaningful connections.*

<br/>

<img src="https://img.shields.io/badge/Flutter-3.50.1-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Dart-3.14.0-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
<img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white"/>
<img src="https://img.shields.io/badge/GetX-7B1FA2?style=for-the-badge&logo=getx&logoColor=white"/>

<br/><br/>

[![GitHub](https://img.shields.io/badge/Repository-ANONYMOUS--SIDD%2Fcreatebook-181717?style=for-the-badge&logo=github)](https://github.com/ANONYMOUS-SIDD/createbook)

</div>

---

## 👥 **Meet the Team**

<div align="center">

<table border="0" cellspacing="15" cellpadding="10">
<tr>
<td align="center" width="200">
<img src="https://ui-avatars.com/api/?name=Sushant+Timalsina&background=6366F1&color=fff&size=140&bold=true&rounded=true&font-size=0.4" width="110" alt="Sushant"/><br/><br/>
<b>Sushant Timalsina</b>
</td>
<td align="center" width="200">
<img src="https://ui-avatars.com/api/?name=Prasiddha+Timalsina&background=8B5CF6&color=fff&size=140&bold=true&rounded=true&font-size=0.4" width="110" alt="Prasiddha"/><br/><br/>
<b>Prasiddha Timalsina</b>
</td>
<td align="center" width="200">
<img src="https://ui-avatars.com/api/?name=Siddhant+Timalsina&background=3B82F6&color=fff&size=140&bold=true&rounded=true&font-size=0.4" width="110" alt="Siddhant"/><br/><br/>
<b>Siddhant Timalsina</b>
</td>
<td align="center" width="200">
<img src="https://ui-avatars.com/api/?name=Abhishek+Yadav&background=06B6D4&color=fff&size=140&bold=true&rounded=true&font-size=0.4" width="110" alt="Abhishek"/><br/><br/>
<b>Abhishek Kumar Yadav</b>
</td>
</tr>
</table>

</div>

---

## 🎯 **Overview**

In the contemporary digital landscape, existing social platforms (Facebook, Instagram, LinkedIn) focus primarily on general content sharing and entertainment, with limited emphasis on **academic projects, research work, and meaningful collaboration** among creators.

**Createbook** addresses this gap by providing a dedicated social networking environment where users can:

- 🖼️ Share project and research-related ideas through **image posts and short videos (≤ 60 seconds)**
- 🧠 Discover relevant content and creators via **intelligent recommendations**
- 🤝 Build **mutual creator links** (not just one-way following)
- 💬 Communicate through **real-time individual and group chats**
- 🌐 Participate in **creator communities** and collaboration opportunities

The platform leverages:
- **Graph-based algorithms** for creator link recommendations (mutual connections / friends-of-friends)
- **Content-based recommendation** for Ideas (matching interests, domains, and tags)
- **Firebase Authentication** for secure user identity
- **Supabase (PostgreSQL)** for structured relational data
- **Cloud Firestore** for real-time messaging

---

## ✨ **Features**

### ✅ Implemented
- **User Authentication** — Email/password signup and login via Firebase Auth
- **Creator Profile Creation** — Persists name, email, phone, avatar to Supabase `creators` table
- **Password Reset** — Email-based reset flow
- **Email Verification** — Sent automatically on signup
- **Fully Responsive UI** — Proportional scaling via `Responsive.w/h/sp()` helpers
- **Bottom Navigation Shell** — 5 tabs (Home, Search, Create, Chats, Profile)
- **Form Validation** — Email, Nepali phone number, password strength, confirm password
- **Loading States & Toasts** — Non-blocking feedback on all auth actions
- **Session Persistence** — Firebase session survives app restarts
- **Secrets Management** — Supabase credentials loaded from gitignored `env.dart`
- **Dark Blue Theme** — Cohesive custom gradient design system

### 🚧 Planned (per proposal)
- **Idea Publishing** — Image + short video (≤ 60s) uploads with title, caption, domain, tags
- **Feed & Discovery** — Chronological feed with visibility controls (public / connections-only)
- **Creator Link Management** — Send, accept, reject mutual connection requests
- **Recommendation Engine** — Graph-based creator suggestions + content-based idea suggestions
- **Real-Time Messaging** — Individual & group chats via Cloud Firestore
- **Creator Communities** — Shared interest groups for collaboration
- **Global Search** — Search for creators and ideas

---

## 🛠️ **Tech Stack**

### Frontend
| Tool | Purpose |
|:--|:--|
| **Flutter 3.50.1** | Cross-platform mobile framework (Android primary) |
| **Dart 3.14.0** | Language |
| **GetX 4.7.3** | State management, dependency injection, navigation |
| **Google Fonts** | Typography (Quicksand) |
| **Lottie 3.8.2** | Animated vector illustrations |

### Backend & Services
| Service | Purpose |
|:--|:--|
| **Firebase Authentication** | User identity (email/password) |
| **Cloud Firestore** | Real-time chat & group messaging *(planned)* |
| **Supabase (PostgreSQL)** | Structured relational data (creators, ideas, links, tags) |
| **Supabase Storage / Firebase Storage** | Media (images + videos) *(planned)* |

### Media & Utilities
| Package | Purpose |
|:--|:--|
| **image_picker 1.2.4** | Camera & gallery access |
| **video_player 2.14.1** | Play short videos in feed |
| **cached_network_image 4.0.7** | Efficient network image caching |
| **fluttertoast 10.0.3** | In-app toast notifications |
| **intl 0.20.3** | Date & time formatting |
| **uuid 4.6.0** | Unique ID generation |

---

## 📁 **Project Structure**

Createbook uses a **Feature-First Architecture** — each feature is fully self-contained (data + logic + UI), making the codebase easy to navigate, test, and collaborate on.

```text
createbook/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── app.dart                           # Root widget (GetMaterialApp)
│   ├── firebase_options.dart              # Auto-generated by FlutterFire CLI
│   │
│   ├── core/                              # ═══ Cross-cutting concerns ═══
│   │   ├── config/
│   │   │   ├── env.dart                   # ⚠️ GITIGNORED — real Supabase credentials
│   │   │   └── env.example.dart           # Committed template with placeholders
│   │   ├── constants/colors.dart          # AppColors palette
│   │   ├── services/
│   │   │   ├── firebase_service.dart      # Firebase init + getters
│   │   │   ├── supabase_service.dart      # Supabase init + client
│   │   │   └── toast_service.dart         # Toast notifications
│   │   ├── utils/responsive.dart          # Responsive scaling helpers
│   │   └── widgets/                       # (Planned) Global widgets
│   │
│   └── features/
│       ├── auth/                          # 🔐 Firebase Auth
│       │   ├── data/models/user_model.dart
│       │   ├── data/services/auth_service.dart
│       │   ├── logic/controllers/         # auth, loader, show_password
│       │   └── ui/
│       │       ├── screens/               # login_screen, signup_screen
│       │       ├── utils/                 # auth_utils, validators
│       │       └── widgets/               # buttons, header, input fields
│       ├── main/                          # 🏠 Shell & navigation
│       │   ├── logic/navigation_controller.dart
│       │   └── main_screen.dart
│       ├── ideas/                         # 💡 Feed & publishing (planned)
│       ├── profile/                       # 👤 Profile (planned)
│       ├── creator_links/                 # 🔗 Mutual connections (planned)
│       ├── recommendations/               # 🧠 Graph + content-based (planned)
│       ├── chat/                          # 💬 Firestore messaging (planned)
│       └── search/                        # 🔍 Global search (planned)
│
├── assets/images/                         # Lottie animation + backgrounds
├── android/                               # Android config
├── ios/                                   # iOS config
├── .gitignore                             # Excludes env.dart, build artifacts
├── pubspec.yaml                           # Dependencies & assets
└── README.md
```

### 🧩 Architecture Principles

1. **Feature-First** — Each feature owns its `data/`, `logic/`, `ui/`.
2. **Separation of Concerns** — data (models/repos) / logic (controllers) / ui (presentation).
3. **Shared Core** — Cross-feature utilities live in `lib/core/`.
4. **Responsive by Default** — All sizes via `Responsive.w/h/sp()`.
5. **Secrets Never Committed** — Credentials in gitignored `env.dart`.

---

## 🚀 **Getting Started**

### Prerequisites
- **Flutter SDK** `3.50.1+`
- **Android Studio** with Android SDK `37.0.0+`
- **Firebase CLI** + **FlutterFire CLI** (`dart pub global activate flutterfire_cli`)
- A **Firebase project** and a **Supabase project**

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/ANONYMOUS-SIDD/createbook.git
cd createbook
flutter pub get
```

### 2️⃣ Configure Firebase
```bash
firebase login
flutterfire configure --project=<your-firebase-project-id>
```
Enable **Authentication → Email/Password** and create a **Firestore Database** in the console.

### 3️⃣ Configure Supabase
```bash
cp lib/core/config/env.example.dart lib/core/config/env.dart
```
Edit `lib/core/config/env.dart` with your Project URL and anon key from *Supabase Dashboard → Project Settings → API*.

Then run the schema below in the **SQL Editor** 👇

> ⚠️ **Security:** `env.dart` is gitignored. Only `env.example.dart` is committed.

---

## 🗄️ **Database Schema**

### Supabase — `creators` table

```sql
CREATE TABLE IF NOT EXISTS creators (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  firebase_uid TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  phone TEXT,
  institution TEXT,
  department TEXT,
  course TEXT,
  bio TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE creators ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow all for now" ON creators FOR ALL USING (true) WITH CHECK (true);
```

> ⚠️ The permissive RLS policy above is for **development only**. Replace before submission.

### Firestore — Messaging (planned)
```text
conversations/{conversationId}
  ├── participants: [firebaseUid_1, firebaseUid_2, ...]
  ├── lastMessage: String
  ├── lastMessageAt: Timestamp
  ├── createdAt: Timestamp
  └── messages/{messageId}
        ├── senderUid: String
        ├── text: String
        └── sentAt: Timestamp
```

---

## ▶️ **Running the App**

```bash
flutter run                  # Debug
flutter build apk --release  # Release APK
```

## 🧪 **Testing**

```bash
flutter test
flutter analyze
```

---

## 📖 **References**

- Lü, L., & Zhou, T. (2011). *Link prediction in complex networks: A survey.* Physica A.
- Rao et al. (2025). *A Facebook-style friend recommender using graph heuristics.*
- Thelwall, M., & Kousha, K. (2014). *Academia.edu: Social network or academic network?*

---

## 📄 **License**

Part of the **COMP 303** course at Kathmandu University. Not for public distribution.

---

<div align="center">

<br/>

**Built with ❤️ by the Createbook Team**

<sub>Kathmandu University · Department of Computer Science & Engineering</sub>

<br/><br/>

<img src="https://img.shields.io/badge/Made_with-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Powered_by-Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black"/>
<img src="https://img.shields.io/badge/Backed_by-Supabase-3ECF8E?style=flat-square&logo=supabase&logoColor=white"/>

</div>
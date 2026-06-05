# 🌌 Moe Kyaw Aung Portfolio — Flutter Pro Max Version

**Supreme Powerful Professional Premium Flutter Web Portfolio**

Cyber-neon design with smooth animations, data-driven content, and production-ready architecture.

---

## ✨ Features

### Visual Design
- **Neon Color Palette**: Cyan (#00F5FF) + Hot Pink (#FF2BD6) + Electric Yellow (#FFE600)
- **Animated Background**: Grid pattern + CRT scanlines + glow orbs
- **Cyber Clip-path Corners**: Angular frames with gradient borders
- **Rotating Avatar Ring**: Sweep gradient animation with avatar
- **Gradient Text**: Name with multi-color gradient effect
- **Smooth Entrance Animations**: Fade-up + slide transitions

### Sections & Features

| Section | Features |
|---------|----------|
| **Navbar** | Sticky, scroll-aware glow, Myanmar labels, mobile hamburger menu |
| **Hero** | Animated typing effect (4 rotating roles), stats counter, social links |
| **About** | Profile summary card, animated stats (Certificates, GitHub Projects, etc.) |
| **Skills** | Scroll-triggered progress bars (Flutter, Kotlin, Firebase, etc.) |
| **Services** | 6 cards with hover light-beam effect |
| **Projects** | 6 project cards with tags, demo + source links |
| **Contact** | Form validation with Myanmar error messages + social links grid |
| **Back to Top** | Appears after 400px scroll |

### Premium Add-ons
- Dark mode by default
- Animated cursor effect
- Scroll progress glow bar
- Smooth scroll throughout
- Responsive design (Mobile/Tablet/Desktop)
- Myanmar language support (form validation)

---

## 📁 Project Structure

```txt
flutter_portfolio_pro_max/
├─ .github/
│  └─ workflows/
│     └─ deploy_github_pages.yml     # CI/CD for GitHub Pages
├─ assets/
│  ├─ images/                         # Avatar, backgrounds
│  ├─ icons/                          # App icons
│  └─ animations/                     # Lottie files
├─ lib/
│  ├─ main.dart
│  ├─ app/
│  │  ├─ app.dart
│  │  ├─ router/
│  │  │  └─ app_router.dart
│  │  ├─ theme/
│  │  │  ├─ app_theme.dart
│  │  │  ├─ app_colors.dart
│  │  │  └─ app_text_styles.dart
│  │  └─ di/
│  │     └─ injector.dart
│  ├─ core/
│  │  ├─ constants/
│  │  ├─ helpers/
│  │  ├─ services/
│  │  ├─ widgets/
│  │  └─ utils/
│  ├─ features/
│  │  ├─ shell/                       # Navbar, drawer, scroll glow
│  │  ├─ hero/
│  │  ├─ about/
│  │  ├─ skills/
│  │  ├─ services/
│  │  ├─ projects/
│  │  └─ contact/
│  └─ data/
│     ├─ models/                      # Project, Service, App models
│     └─ data_sources/                # PortfolioDataSource (data)
└─ pubspec.yaml

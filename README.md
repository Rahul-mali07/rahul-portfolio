# Rahul Mali — Developer Portfolio

A premium, responsive, single-page developer portfolio for **Rahul Mali**, built with semantic HTML5, modern CSS3, and minimal vanilla JavaScript. It is deployed as a fully static website on **GitHub Pages**.

> **Live website (verified):** `https://rahul-mali07.github.io/rahul-portfolio/`
>
> **Vercel mirror:** `https://rahul-portfolio-six-olive.vercel.app/`
>
> HTTPS is enforced on both deployments.

---

## Project Overview

This project presents Rahul Mali's profile as a Computer Science Engineering student, Full Stack Developer, and Cloud & DevOps enthusiast from Solapur, Maharashtra, India.

The site includes a hero introduction, about section, education details, technical skills, three project showcases, internship experience, contact links, and a footer with an automatically updating copyright year.

The design uses a dark developer-focused theme:

| Token | Value |
| --- | --- |
| Background | `#080D0B` |
| Primary accent | `#A3F36B` |
| Surface tones | Dark green / charcoal |
| Typography | Space Grotesk, Inter, JetBrains Mono |
| Icons | Font Awesome 6 (free CDN) |

---

## Important: Hosting Alternative (No AWS)

The original internship brief specifies **AWS S3 static hosting + CloudFront HTTPS**. This implementation intentionally uses **GitHub Pages** as a **zero-cost alternative** because the AWS Free Tier and credits are no longer available.

- No AWS services, SDKs, buckets, distributions, or paid infrastructure are used or configured.
- **AWS deployment is not completed and is not claimed anywhere in this project.**
- The source code is plain static HTML/CSS/JS, so it remains compatible with any static host, including AWS S3 + CloudFront, if that becomes available later.
- Using GitHub Pages **does not replace the AWS requirement** unless the internship coordinator formally approves the alternative.

---

## Features

- Responsive layout for desktop, tablet, and mobile
- Fixed, blurred navigation bar with active-section highlighting
- Accessible mobile navigation menu (keyboard, Escape key, and outside-click support)
- Hero section with developer-themed animated code window
- Smooth scrolling and subtle scroll-reveal animations
- Reduced-motion support via `prefers-reduced-motion`
- Skills grouped by Frontend, Backend, Database, Tools, and Concepts
- Exactly three project cards with technology badges
- Public repository link only where one was provided (CertifyPro)
- Internship experience timeline
- Contact section with email, GitHub, LinkedIn, and location
- Automatically updated copyright year
- Back-to-top link
- Semantic HTML, skip link, ARIA labels, and visible focus states
- No backend, database, build step, or paid API required

---

## Technologies Used

**Frontend**
- HTML5
- CSS3 (custom properties, grid, flexbox, animations)
- JavaScript (ES5-compatible vanilla JS, no framework)

**External assets**
- Google Fonts (Space Grotesk, Inter, JetBrains Mono)
- Font Awesome 6 Free (CDN)
- Inline SVG favicon

**Development & hosting**
- Git
- GitHub
- GitHub Pages
- VS Code (recommended editor)

The site loads no jQuery, Bootstrap, React, or other runtime frameworks. Bootstrap, React, Next.js, etc. appear only as skills listed in the portfolio content.

---

## Project Structure

```text
rahul-portfolio/
│
├── index.html
├── styles.css
├── script.js
├── README.md
│
└── assets/
    ├── images/
    │   └── .gitkeep
    └── icons/
        └── favicon.svg
```

- **index.html** — semantic page structure and all content
- **styles.css** — design tokens, layout, responsive rules, animations
- **script.js** — mobile navigation, active nav state, reveal animations, copyright year
- **assets/icons/favicon.svg** — site icon
- **assets/images/** — reserved for future optimized images

---

## Contact Email

The portfolio uses the following public contact address:

```text
malir3557@gmail.com
```

It is used in the contact button, the visible email line, and the footer email icon. To change it later, update all three `mailto:` references in **index.html**.

Recommended files to review before publishing:

- `index.html` — meta description and social/profile URLs
- `README.md` — live URL and deployment notes

No personal details, statistics, achievements, or experience have been invented.

---

## Run Locally

No installation or build step is required.

### Option 1 — Open directly

1. Open the project folder in VS Code.
2. Right-click `index.html` and choose **Reveal in File Explorer**.
3. Double-click `index.html` to open it in a browser.

### Option 2 — VS Code Live Server (recommended)

1. Install the **Live Server** extension by Ritwick Dey.
2. Open the project folder in VS Code.
3. Right-click `index.html` and select **Open with Live Server**.
4. The site opens at a local address such as `http://127.0.0.1:5500/`.

### Option 3 — Python local server

From a terminal inside the project folder:

```bash
python -m http.server 8000
```

Then open `http://localhost:8000`.

### Option 4 — Node.js local server

```bash
npx serve .
```

Follow the URL printed in the terminal.

> The website works fully offline from a static file perspective, but Google Fonts and Font Awesome icons require an internet connection to load. If they are unavailable, the page still works with system fallback fonts and without icon glyphs.

---

## GitHub Deployment Reference

The GitHub profile is **https://github.com/Rahul-mali07**. Deployment is already complete; the steps below are retained for reproducibility. The example uses the repository name `rahul-portfolio`.

### Create the repository

1. Sign in to GitHub.
2. Go to **Repositories → New repository**.
3. Name it `rahul-portfolio`.
4. Choose **Public** (required for free GitHub Pages on a free account).
5. Do **not** initialize it with a README, `.gitignore`, or license if you are pushing this existing project.
6. Click **Create repository**.

### Push the project from VS Code terminal

This project is already initialized as a local Git repository with the `main` branch, an initial commit, and the `origin` remote configured.

After creating the empty repository on GitHub, open the terminal in the `rahul-portfolio` project folder and run:

```bash
git push -u origin main
```

If Git asks for credentials, sign in through the browser or use a GitHub Personal Access Token instead of a password.

For a fresh copy of the project that is not yet a Git repository, run:

```bash
git init
git add .
git commit -m "Build responsive developer portfolio"
git branch -M main
git remote add origin https://github.com/Rahul-mali07/rahul-portfolio.git
git push -u origin main
```

If the remote already exists, use:

```bash
git remote set-url origin https://github.com/Rahul-mali07/rahul-portfolio.git
git push -u origin main
```

### Uploading through the GitHub website (alternative)

1. Open the new repository.
2. Click **Add file → Upload files**.
3. Drag in `index.html`, `styles.css`, `script.js`, `README.md`, and the `assets` folder.
4. Commit the files to the `main` branch.

Make sure the `assets` folder keeps its structure (`assets/icons/favicon.svg`).

---

## Enable GitHub Pages

1. Open the repository on GitHub.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
4. Choose the **main** branch and the **/ (root)** folder.
5. Click **Save**.
6. Wait 1–3 minutes for the first deployment.
7. The live URL will appear at the top of the Pages settings, in the form:

```text
https://YOUR-GITHUB-USERNAME.github.io/rahul-portfolio/
```

For this account, the expected format is:

```text
https://rahul-mali07.github.io/rahul-portfolio/
```

The repository is named `rahul-portfolio`, so the live URL matches the one at the top of this README.

> **Repository name special case:** If you name the repository exactly `Rahul-mali07.github.io`, the site is served at `https://rahul-mali07.github.io/` instead of with a `/rahul-portfolio/` path. The project uses relative asset paths, so it works in both cases.

### Updating the live site

After changing files locally:

```bash
git add .
git commit -m "Update portfolio content"
git push
```

GitHub Pages redeploys automatically from the `main` branch.

---

## Testing Checklist

Verified locally as a static site:

- [x] All internal navigation links target existing sections
- [x] Both hero CTAs point to Projects and Contact
- [x] All three project cards render with descriptions and technology badges
- [x] CertifyPro repository URL is correct; no repository URLs were invented for the other two projects
- [x] GitHub and LinkedIn URLs point to the provided profiles
- [x] No broken image references (the site uses an SVG favicon and CSS-built visuals)
- [x] No backend dependency; all content is static
- [x] Mobile menu opens, closes, and updates `aria-expanded`
- [x] Layout adapts across tested widths from 320px to 1440px
- [x] Copyright year updates automatically
- [x] Reduced-motion preference disables reveal animations
- [x] No framework/build step required; GitHub Pages can serve the root folder directly

### Automated Validation Results

- HTMLHint: **0 errors**
- `node --check script.js`: **passed**
- axe-core 4.10.2 (desktop and mobile): **0 WCAG A/AA violations**
- Lighthouse (live GitHub Pages, mobile): **Performance 77**, **Accessibility 100**, **Best Practices 100**, **SEO 100**
- Lighthouse total blocking time: **0 ms**; cumulative layout shift: **0**
- Browser console and network: **0 errors, 0 failed requests** in Chrome, Edge, Firefox 132, and WebKit 18.2 (Safari engine)
- Responsive checks at 320, 360, 390, 480, 640, 768, 900, 1024, and 1440 px: **no horizontal page overflow**
- No-JavaScript fallback: content remains visible and readable
- Contrast ratios for the palette were manually checked against WCAG AA (all pass)

> Lighthouse performance is a throttled mobile lab score. The remaining opportunities are first paint/LCP and third-party font caching. The page has no blocking JavaScript, 0 ms total blocking time, and 0 layout shift.

### Deployment Status

- [x] Repository published: `https://github.com/Rahul-mali07/rahul-portfolio`
- [x] GitHub Pages enabled from the `main` branch root
- [x] Live site verified over HTTPS: `https://rahul-mali07.github.io/rahul-portfolio/`
- [x] Vercel production deployment verified over HTTPS: `https://rahul-portfolio-six-olive.vercel.app/`
- [x] Vercel project connected to the GitHub repository for automatic redeploys
- [x] Deployment tested in Chrome, Edge, Firefox 132, and WebKit 18.2 with no console or network errors
- [x] Mobile navigation, responsive layout, contact email, and internal links verified against the live site

**Manual checks left for the owner:**

- [ ] Optional final visual check on a real macOS Safari device
- [ ] Obtain coordinator approval for the GitHub Pages alternative

---

## Accessibility Notes

- Skip-to-content link
- Semantic landmarks: `header`, `nav`, `main`, `section`, `article`, `footer`
- One `h1`, logical heading levels below it
- Visible `:focus-visible` outline
- Mobile toggle uses `aria-expanded`, `aria-controls`, and a dynamic `aria-label`
- Active section links use `aria-current="page"`
- Decorative icons are hidden from screen readers with `aria-hidden="true"`
- Contact card links have descriptive visible labels
- Color palette maintains strong contrast against the dark background

---

## Performance Notes

- No JavaScript frameworks or large runtime libraries
- CSS and JS are separate, cacheable files
- `script.js` uses `defer`; a tiny inline script only adds the `js` class
- Fonts use `display=swap` and preconnect hints
- Visuals are built with CSS and inline SVG, avoiding heavy image downloads
- Animations use transform/opacity and respect reduced-motion settings
- `assets/images/` is available for optimized future images (use WebP/AVIF where possible)

---

## Credits

- Fonts: [Google Fonts](https://fonts.google.com/) — Space Grotesk, Inter, JetBrains Mono
- Icons: [Font Awesome 6 Free](https://fontawesome.com/)
- Hosting: [GitHub Pages](https://pages.github.com/) and [Vercel](https://vercel.com/)

All portfolio content belongs to **Rahul Mali**. This project was created for the Maincrafts Technology Cloud Computing & DevOps Internship, Task 1, using a zero-cost GitHub Pages alternative to AWS S3 + CloudFront.

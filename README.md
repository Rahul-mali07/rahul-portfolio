# Rahul Mali — Developer Portfolio — Docker Containerization (Task 2)

## 1. Project Title

**Rahul Mali — Developer Portfolio — Containerization Using Docker and Deployment on a Cloud Virtual Machine**

This repository contains the original static portfolio website plus the Docker, documentation, and helper files added for **Maincrafts Technology — Cloud Computing & DevOps Internship, Task 2**.

---

## 2. Internship Information

| Field | Details |
| --- | --- |
| Company | Maincrafts Technology |
| Internship | Cloud Computing & DevOps |
| Task | Task 2 — Containerization Using Docker and Deployment on a Cloud Virtual Machine |
| Candidate | Rahul Sampatrao Mali |
| Repository | `https://github.com/Rahul-mali07/rahul-portfolio` |
| Working branch | `task2-docker-deployment` |
| Local OS used | Windows 11 |
| Terminal used | PowerShell |
| Web server used | Nginx inside Docker |

**Cloud rule for this task:** No AWS service is used. No AWS credentials, access keys, secret keys, or billing details were requested or configured. No paid cloud resource or paid hosting subscription was created.

---

## 3. Project Overview

This is a premium, responsive, single-page developer portfolio built with semantic HTML5, modern CSS3, and vanilla JavaScript. The original design, colors, animations, images, layout, responsiveness, content, sections, and projects were preserved.

The page includes:

- Hero introduction with animated developer code window
- About section with education and background
- Skills grouped by Frontend, Backend, Database, Tools, Concepts, and Design & Media
- Four project showcases
- Experience timeline
- Contact section with email, phone, GitHub, and LinkedIn links
- Downloadable resume
- Footer with an automatically updating copyright year
- Accessible mobile navigation, skip link, ARIA labels, and reduced-motion support

The original dark theme remains unchanged:

| Token | Value |
| --- | --- |
| Background | `#080D0B` |
| Primary accent | `#A3F36B` |
| Surface tones | Dark green / charcoal |
| Typography | Space Grotesk, Inter, JetBrains Mono |
| Icons | Font Awesome 6 Free via CDN |

The existing GitHub Pages and Vercel deployments from earlier work remain documented below, but they are **not** presented as the Task 2 cloud VM deployment.

- Existing GitHub Pages site: `https://rahul-mali07.github.io/rahul-portfolio/`
- Existing Vercel mirror: `https://rahul-portfolio-six-olive.vercel.app/`

---

## 4. Objectives

1. Inspect the existing portfolio and identify the website root.
2. Containerize the static site with Docker without changing the design or content.
3. Serve the site with Nginx inside an Alpine-based Docker image.
4. Build the image locally with Docker Desktop on Windows 11.
5. Run the container and map host port `8080` to container port `80`.
6. Test the homepage, CSS, JavaScript, assets, navigation, sections, and responsive layout.
7. Investigate a free temporary cloud Docker environment without using AWS or paid resources.
8. Document exactly what was verified and what remains manual.
9. Provide helper PowerShell scripts and a screenshot checklist.
10. Prepare the work on a separate GitHub branch for review.

---

## 5. Technologies Used

**Frontend (unchanged)**

- HTML5
- CSS3 with custom properties, grid, flexbox, and animations
- Vanilla JavaScript (ES5-compatible, no framework)
- Google Fonts
- Font Awesome 6 Free via CDN
- Inline SVG favicon

**DevOps / Task 2**

- Docker Desktop 28.0.1 on Windows 11
- Docker Engine / Docker CLI
- Docker image: `portfolio-website`
- Nginx on Alpine Linux (`nginx:alpine`)
- PowerShell 5.1 helper scripts
- Git and GitHub
- Headless Chrome for local browser verification

**Not used**

- AWS, EC2, S3, CloudFront, or any other AWS service
- Paid cloud VMs
- Paid hosting subscriptions
- Backend, database, build step, or private API keys

---

## 6. Project Structure

```text
rahul-portfolio/
│
├── Dockerfile
├── .dockerignore
├── README.md
│
├── screenshots/
│   └── README.md
│
├── scripts/
│   ├── build.ps1
│   ├── run.ps1
│   ├── stop.ps1
│   └── status.ps1
│
├── index.html
├── styles.css
├── script.js
│
├── assets/
│   ├── icons/
│   │   └── favicon.svg
│   ├── images/
│   │   └── .gitkeep
│   └── resume/
│       └── Rahul_Mali_Resume.pdf
│
└── resume/
    └── Rahul_Mali_Resume.html
```

**Website root:** the repository root. `index.html`, `styles.css`, `script.js`, and `assets/` are all at or below this root, so the existing relative paths work correctly when Nginx serves `/usr/share/nginx/html`.

---

## 7. What Is Docker?

Docker is a tool that packages an application and everything it needs to run into a **container**. A container is lightweight because it shares the host operating system kernel instead of carrying a full operating system like a traditional virtual machine.

For this project, Docker packages the portfolio files and an Nginx web server so the same website can run consistently on Docker Desktop, a Linux VM, or another Docker-capable environment.

---

## 8. What Is a Docker Image?

A Docker image is a read-only template used to create containers. It contains the application files, runtime, libraries, and startup configuration.

This project creates an image named:

```powershell
portfolio-website
```

Check it with:

```powershell
docker images
```

Verified local image details on 2026-11-23:

| Field | Value |
| --- | --- |
| Repository | `portfolio-website` |
| Tag | `latest` |
| Base image | `nginx:alpine` |
| Size | approximately 93.9 MB |

---

## 9. What Is a Docker Container?

A Docker container is a running instance of a Docker image. It is isolated from the host but can be reached through a published port.

This project uses the container name:

```text
portfolio-container
```

The host port `8080` is mapped to container port `80`:

```text
0.0.0.0:8080 -> 80/tcp
```

---

## 10. What Is Dockerfile?

A Dockerfile is a plain-text instruction file that tells Docker how to build an image.

The Dockerfile used here is intentionally minimal:

```dockerfile
FROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80
```

Explanation:

- `FROM nginx:alpine` uses the small, official Nginx image based on Alpine Linux.
- `COPY . /usr/share/nginx/html` copies the website root into Nginx's default document root.
- `EXPOSE 80` documents that the web server listens on port `80`.

A custom Nginx configuration was **not** added because the default configuration already serves `index.html`, static CSS, JavaScript, SVG, and PDF files correctly.

---

## 11. Why Nginx?

Nginx is a fast, lightweight, production-grade web server. It is a good fit for this project because:

- The portfolio is a static website.
- Nginx serves static files efficiently.
- The official `nginx:alpine` image is small.
- The default document root is `/usr/share/nginx/html`.
- No backend or application runtime is required.
- No custom routing or reverse proxy configuration is needed.

Alternative servers such as Apache or a Node.js development server would add unnecessary complexity for this static site.

---

## 12. Docker Installation on Windows

Docker Desktop was already installed in the working environment. The daemon was not running initially and was started before testing.

### Install or verify Docker Desktop

1. Download and install **Docker Desktop for Windows** from Docker's official website.
2. Use WSL 2 backend when prompted during installation.
3. Start Docker Desktop from the Windows Start menu.
4. Confirm that the engine is running.
5. Open PowerShell and run:

```powershell
docker --version
docker info
```

Expected result:

```text
Docker version 28.0.1, build 068a01e
```

Docker CLI version verified in this environment: **28.0.1**.

### If `docker info` fails

If Docker reports that the daemon is unavailable, start Docker Desktop and wait until the engine indicator shows it is running. Then run `docker info` again.

---

## 13. Docker Image Creation

From the project root (`rahul-portfolio`), run:

```powershell
docker build -t portfolio-website .
```

The final `.` means "use the current directory as the build context".

Verify the image:

```powershell
docker images
```

Or check only this image:

```powershell
docker images portfolio-website
```

Helper script alternative:

```powershell
.\scripts\build.ps1
```

**Status:** verified successfully. The build completed without errors.

---

## 14. Running Docker Container

Run the container:

```powershell
docker run -d --name portfolio-container -p 8080:80 portfolio-website
```

Meaning:

- `-d` runs the container in the background.
- `--name portfolio-container` gives the container a safe, recognizable name.
- `-p 8080:80` maps Windows host port `8080` to Nginx port `80` inside the container.
- `portfolio-website` is the image to run.

Verify:

```powershell
docker ps
docker port portfolio-container 80/tcp
```

Helper script alternative:

```powershell
.\scripts\run.ps1
```

The run script does not delete unrelated containers. If `portfolio-container` already exists, it starts the existing container instead of creating another one.

**Status:** verified successfully. Output showed:

```text
portfolio-container   Up ...   0.0.0.0:8080->80/tcp
```

---

## 15. Local Testing

### Local URL

```text
http://localhost:8080
```

### Verified local results

Testing date: **2026-11-23**

| Check | Status |
| --- | --- |
| Docker Desktop engine available | Verified |
| `docker build -t portfolio-website .` | Verified, no errors |
| Image visible in `docker images` | Verified |
| `portfolio-container` running | Verified |
| Port mapping `8080 -> 80` | Verified |
| `nginx -t` inside container | Verified, syntax OK |
| Homepage `/` | HTTP 200 |
| `styles.css` | HTTP 200, `text/css` |
| `script.js` | HTTP 200, `application/javascript` |
| `assets/icons/favicon.svg` | HTTP 200, `image/svg+xml` |
| `assets/resume/Rahul_Mali_Resume.pdf` | HTTP 200, `application/pdf` |
| `resume/Rahul_Mali_Resume.html` | HTTP 200 |
| All six section IDs present | Verified |
| CSS and JS references present | Verified |
| Three resume download links present | Verified |
| Scroll reveal JavaScript runs | Verified in rendered DOM |
| Copyright year updates to 2026 | Verified in rendered DOM |
| Mobile menu opens and closes after link click | Verified in headless Chrome |
| No horizontal overflow at 320, 390, 768, 1440 px | Verified |
| Browser console errors | 0 found |
| Page exceptions | 0 found |
| Failed local network requests | 0 found |
| HTTP errors during browser reload | 0 found |

User-facing checks still worth doing manually:

- Open `http://localhost:8080` in your normal browser.
- Click each navigation item.
- Scroll through About, Skills, Projects, and Contact.
- Download the resume.
- Use browser DevTools at a mobile width.

These are already automated above where possible, but a final human visual check is recommended before submitting screenshots.

### Useful verification commands

```powershell
docker ps
docker images
docker logs portfolio-container
docker exec portfolio-container nginx -t
docker port portfolio-container 80/tcp
```

PowerShell helper:

```powershell
.\scripts\status.ps1
```

Stop or start the container:

```powershell
.\scripts\stop.ps1
.\scripts\run.ps1
```

---

## 16. Free Cloud Deployment Practice

### Important status

**Verified temporary cloud deployment: NOT completed.**

No cloud VM was available for an authenticated deployment test during this work. No public IP or public URL was invented.

### Play with Docker investigation

Investigated: `https://labs.play-with-docker.com/`

Finding: the site displays a deprecation notice stating that Play with Docker is unavailable starting **March 1, 2026**. As the current date is **2026-11-23**, the hosted playground is not a supported option for this task.

Docker's own announcement confirms the shutdown and points learners to alternatives such as Docker Desktop Labspaces, Iximiuz labs, and Google Cloud Shell.

### Historical Play with Docker steps (documented but NOT executed)

These steps are kept only for reference if a Docker-capable playground is later provided by the internship coordinator:

```bash
git clone https://github.com/Rahul-mali07/rahul-portfolio.git
cd rahul-portfolio
docker build -t portfolio-website .
docker run -d --name portfolio-container -p 80:80 portfolio-website
docker ps
```

Then you would use the playground's **OPEN PORT 80** button and copy only the temporary URL that the playground generates.

Play with Docker limitations:

- Temporary sessions, historically deleted after a few hours.
- No permanent public IP.
- No permanent hosting.
- No persistent custom domain.
- The generated URL must never be presented as permanent.
- Authentication may be required.

### Documented free alternative — Google Cloud Shell

Google Cloud Shell gives a temporary Linux VM with Docker preinstalled. According to Google's documentation, Cloud Shell is free for users with a Google Cloud account. Do **not** enable billing, create billable resources, or deploy to a paid service.

**Status:** documented but **not executed**.

Manual steps:

1. Sign in with a Google account and open Google Cloud Shell.
2. If you do not want persistent storage, choose **Ephemeral mode**.
3. In the Cloud Shell terminal, run:

```bash
git clone https://github.com/Rahul-mali07/rahul-portfolio.git
cd rahul-portfolio
docker build -t portfolio-website .
docker run -d --name portfolio-container -p 8080:80 portfolio-website
docker ps
```

4. Use port `8080`, not port `80`, because Cloud Shell Web Preview allows ports in the range `2000`–`65000`.
5. Click **Web Preview → Preview on port 8080**, or use the documented URL form:

```bash
echo "https://8080-$WEB_HOST"
```

6. Test the portfolio in the preview window.
7. Stop the container when finished:

```bash
docker stop portfolio-container
```

Important limitations:

- The Cloud Shell VM is temporary and is discarded after inactivity.
- The preview URL is protected by the signed-in user's proxy and is not general permanent hosting.
- A Google account is required.
- If your organisation requires billing before Cloud Shell access, stop and ask for permission; do not enable paid resources.

### Deployment status summary

| Deployment type | Status |
| --- | --- |
| Local Docker Desktop deployment | Verified |
| Play with Docker temporary deployment | Not available; deprecated |
| Google Cloud Shell temporary practice | Documented only, not executed |
| Permanent cloud hosting | Not created |
| AWS deployment | Not used and not claimed |

---

## 17. Deployment Commands

### Local Docker commands

```powershell
cd "D:\minwcraft tasks\task 2\rahul-portfolio"
docker build -t portfolio-website .
docker images
docker run -d --name portfolio-container -p 8080:80 portfolio-website
docker ps
docker port portfolio-container 80/tcp
```

Open:

```text
http://localhost:8080
```

Stop and restart:

```powershell
docker stop portfolio-container
docker start portfolio-container
```

### PowerShell helper scripts

```powershell
.\scripts\build.ps1
.\scripts\run.ps1
.\scripts\status.ps1
.\scripts\stop.ps1
```

### Documented cloud VM commands (manual only)

```bash
git clone https://github.com/Rahul-mali07/rahul-portfolio.git
cd rahul-portfolio
docker build -t portfolio-website .
docker run -d --name portfolio-container -p 8080:80 portfolio-website
docker ps
```

Use the environment's own port-preview feature. Do not hard-code or invent a public URL.

---

## 18. Screenshots

The screenshot checklist is in:

```text
screenshots/README.md
```

Real local screenshots were captured from the actual Docker Desktop state, real PowerShell output, and the real local website:

- `screenshots/01-docker-desktop-running.png`
- `screenshots/02-docker-image.png`
- `screenshots/03-docker-container.png`
- `screenshots/04-local-portfolio.png`
- `screenshots/05-local-sections.png`
- `screenshots/06-responsive-mobile.png`

No fake screenshots are included. The following remain unchecked because they require an actual cloud environment or a manual DevTools image:

1. `07-browser-devtools.png` — console/network checks were verified programmatically with Chrome DevTools Protocol, but no DevTools image was captured.
2. `08-docker-playground.png` — only if a Docker playground is actually available.
3. `09-public-cloud-url.png` — only after a real temporary cloud deployment is tested.

---

## 19. Problems Faced and Solutions

| Problem | Cause | Solution |
| --- | --- | --- |
| `docker info` initially failed | Docker CLI was installed, but Docker Desktop engine was not running | Started Docker Desktop and waited for the engine; `docker info` then reported server version 28.0.1 |
| Concern about copied development files | `COPY .` includes the full build context | Added `.dockerignore` to exclude Git metadata, editor files, logs, temporary files, environment files, credentials, scripts, screenshots, and README |
| Need to avoid breaking the design | Original site uses relative paths | Kept `index.html`, `styles.css`, `script.js`, `assets/`, and `resume/` in the same relative structure and used Nginx's default document root |
| Possible duplicate container on rerun | Running `docker run` twice with the same name fails | `scripts/run.ps1` checks for the exact container name and starts the existing container if stopped |
| Play with Docker unavailable | Hosted service deprecated and shut down as of March 1, 2026 | Documented the limitation and provided Google Cloud Shell as a free temporary manual alternative |
| Cloud deployment could not be verified | No authenticated free Docker-capable VM was available in this session | Marked cloud deployment as documented only; no public URL or successful result was claimed |

No build errors, asset 404s, browser console errors, or failed local network requests were found after the fix above.

---

## 20. Learning Outcomes

- Understood the difference between a Docker image, container, and Dockerfile.
- Containerized an existing static website without changing its design.
- Used Nginx as a lightweight static web server inside Docker.
- Practised port mapping from Windows host port `8080` to container port `80`.
- Used `.dockerignore` to keep unnecessary and private files out of the image.
- Verified container health with `docker ps`, `docker port`, `docker logs`, and `nginx -t`.
- Tested HTTP status codes, content types, static assets, rendered DOM, mobile navigation, and responsive layout.
- Learned that free practice environments can be temporary or discontinued and must be documented honestly.
- Prepared reusable PowerShell scripts for a repeatable local workflow.

---

## 21. Project Repository Link

Repository:

```text
https://github.com/Rahul-mali07/rahul-portfolio
```

Task branch:

```text
task2-docker-deployment
```

Original website history remains on `main`. The Task 2 files were prepared on the separate branch so the existing work is preserved.

---

## 22. Author Information

**Rahul Sampatrao Mali**

- B.E. Computer Science & Engineering student
- Full Stack Developer
- GitHub: `https://github.com/Rahul-mali07`
- LinkedIn: `https://www.linkedin.com/in/rahul-mali-1abb8431a/`
- Portfolio: `https://rahul-mali07.github.io/rahul-portfolio/`

This project was prepared for the Maincrafts Technology Cloud Computing & DevOps Internship, Task 2. All portfolio content belongs to Rahul Mali. No AWS service or paid infrastructure was used.

# Screenshot Checklist — Task 2

Capture real screenshots only. Do not use generated, edited, or downloaded images as evidence.

Save each file in this `screenshots/` folder with the suggested filename.

- [x] `01-docker-desktop-running.png` — Docker Desktop open with the Containers window visible.
- [x] `02-docker-image.png` — PowerShell output of `docker images` with `portfolio-website` visible.
- [x] `03-docker-container.png` — PowerShell output of `docker ps` with `portfolio-container` and `0.0.0.0:8080->80/tcp` visible.
- [x] `04-local-portfolio.png` — Portfolio open at `http://localhost:8080`, showing the hero section.
- [x] `05-local-sections.png` — Long-page local render showing the main portfolio sections.
- [x] `06-responsive-mobile.png` — Local site rendered at a 390px mobile viewport; no horizontal overflow was found.
- [ ] `07-browser-devtools.png` — Browser Network and Console tabs showing no major failed local requests or errors. Not captured as an image; verified programmatically with Chrome DevTools Protocol instead.
- [ ] `08-docker-playground.png` — Docker playground instance, **only if a free Docker-capable VM is actually available**.
- [ ] `09-public-cloud-url.png` — Portfolio opened through the temporary public URL, **only if deployment was actually tested**.

## Notes

- The checked screenshots were captured from the real local Docker Desktop, real PowerShell output, and the real local website on 2026-11-23. No generated or invented evidence was used.
- Play with Docker displayed a deprecation notice when this task was prepared and is not a supported hosted service as of March 1, 2026.
- Do not invent or hand-write a public URL. Capture only what the playground itself provides.
- A temporary playground URL is not permanent hosting and must be labelled as temporary in the final submission.
- If a screenshot cannot be captured, leave the box unchecked and explain the reason in the submission.

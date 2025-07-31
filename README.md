# Employee Certification Tracker – SAP ABAP

![ABAP](https://img.shields.io/badge/Language-ABAP-blue)
![Status](https://img.shields.io/badge/Project%20Status-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)

> A lightweight SAP ABAP utility that enables HR and administration teams to **track employee certifications & licenses, monitor expiry dates, and receive automated reminders**, all from an easy‑to‑read ALV report.

---

## 📑 Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Folder Structure](#folder-structure)
5. [Screenshots](#screenshots)
6. [Getting Started](#getting-started)
7. [Sample Data](#sample-data)
8. [How It Works](#how-it-works)
9. [Contributing](#contributing)
10. [License](#license)
11. [Author](#author)

---

## Overview
This project is an internship‑sized ABAP program that demonstrates:
* A **selection screen** for filtering employees / certification types  
* **ALV Grid** output showing validity status at a glance  
* **Email reminders** sent X days before certification expiry (optional enhancement)  

Use it as a template for real‑world compliance tracking or as a portfolio piece to showcase ABAP, ALV, and modular design skills.

---

## Features
| # | Feature | Description |
|---|---------|-------------|
| 1 | **Certification repository** | Stores employee‑certification records with validity periods |
| 2 | **ALV Grid report** | Interactive list with traffic‑light colour coding for expiring items |
| 3 | **Expiry calculation** | Determines days remaining and flags overdue items |
| 4 | **Email notification** | (Enhancement) Sends reminders via *CL_BCS* |
| 5 | **Sample data loader** | Upload CSV to quickly populate test records |

---

## Tech Stack
* **ABAP 7.x**
* **SAP GUI** (tested on 7.70)
* **ALV Grid** (`CL_GUI_ALV_GRID`)
* Optional: **BCS e‑mail API** (`CL_BCS`)

---

## Folder Structure
```
├── src/                 ABAP source code (reports, includes, DDIC)
├── docs/                Design document & flow diagram
├── sample-data/         CSV for quick testing
├── screenshots/         UI & report screenshots
└── README.md            Project documentation
```

---

## Screenshots
> Replace the placeholders below with real images located in **/screenshots**  
> 
> ```
> ![Selection Screen](screenshots/selection_screen.png)
> ![ALV Grid Output](screenshots/alv_output.png)
> ![Expiry Email](screenshots/email_sample.png)
> ```

---

## Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/YOUR-USERNAME/employee-certification-tracker-abap.git
   ```
2. **Import ABAP objects**
   * Use *SAPLink* / *ABAPGit* or manually copy `src/*` into SE38/SE80.
3. **Load sample data** *(optional)*
   * In SE38, run report `ZEMP_CERT_SAMPLE_LOADER` (provided)  
   * Point to `sample-data/sample_data.csv`
4. **Execute main report**
   * Transaction `SE38` → program `ZEMP_CERT_TRACKER`

---

## Sample Data
A ready‑to‑import CSV is provided in **/sample-data**.  
Sample rows:

| Employee_ID | Name  | Certification | Valid_From | Valid_To |
|-------------|-------|---------------|------------|----------|
| E001 | Alice | PMP | 2023‑01‑01 | 2025‑01‑01 |
| E002 | Bob   | SAP ABAP | 2022‑06‑01 | 2024‑06‑01 |
| E003 | Cara  | AWS Solutions Architect | 2024‑03‑15 | 2027‑03‑15 |

---

## How It Works
1. **Selection screen** collects filters.
2. Program reads table `ZEMP_CERT_HDR` and `ZEMP_CERT_DET`.
3. Calculates `days_remaining = valid_to ‑ sy-datum`.
4. Builds internal table for ALV; sets `traffic_light` based on thresholds.
5. Displays ALV; double‑click drill‑down shows certificate history.
6. (Enhancement) Scheduled job calls reminder FM to e‑mail employees & HR.

---

## Contributing
Pull requests are welcome!  
Open an Issue for major changes or feature requests.

---

## License
Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for details.

---

## Author
**Mummadi Sai Meghana**  
*SAP ABAP Developer · Yuvaintern Internship Program*  
[LinkedIn](https://www.linkedin.com/in/sai-meghana) · [GitHub](https://github.com/sai-meghana5)

---

> *Happy coding & keep those certifications up to date!* ✨

# SAP ABAP – Employee Certification & License Tracker

This is a sample SAP ABAP project developed to track and manage employee certifications and licenses in an SAP S/4HANA environment.

## 🔍 Objective

To help HR or compliance departments manage employee certifications efficiently by tracking:
- Certification names
- Issue and expiry dates
- Expiration warnings (e.g., 30 days prior)
- Current status (Active/Expired)

## 🏗️ Components

### 1. Custom Table – `ZEMP_CERT_TRACK`
Stores all certification data.

| Field        | Data Type | Description               |
|--------------|-----------|---------------------------|
| EMP_ID       | CHAR(10)  | Employee ID               |
| CERT_ID      | CHAR(10)  | Certification ID          |
| CERT_NAME    | CHAR(40)  | Certification Name        |
| ISSUE_DATE   | DATS      | Date of Certification     |
| EXPIRY_DATE  | DATS      | Expiry Date               |
| STATUS       | CHAR(1)   | 'A' = Active, 'E' = Expired|

**File:** `ZEMP_CERT_TRACK.ddic.txt`  
(Contains sample DDIC table structure as a reference.)

---

### 2. ABAP Report – `ZEMP_CERT_REPORT`
Displays employee certifications with flags for expired or soon-to-expire entries.

**Features:**
- Simple loop over internal table
- Calculates days left to expiry
- Marks entries with alerts (e.g., "EXPIRED", "EXPIRING SOON!")

**File:** `ZEMP_CERT_REPORT.abap`

---

## 📸 Screenshots (Optional)
Place any SAP GUI screenshots inside the `screenshots/` folder.

---

## 💡 Future Enhancements
- ALV Grid report
- Email reminders for upcoming expiry
- Excel upload of certification data
- Transaction code for easy access

---

## 👤 Author
**Mummadi Sai Meghana**  
Intern – Yuvaintern SAP ABAP Program  
📅 May 2025

---

## 📄 License
This project is licensed under the MIT License. See the `LICENSE` file for details.

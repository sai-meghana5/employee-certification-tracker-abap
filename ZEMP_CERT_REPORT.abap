*&---------------------------------------------------------------------*
*& Report ZEMP_CERT_REPORT
*&---------------------------------------------------------------------*
*& Purpose: Display employee certifications and alert on expiry status
*& Author : Mummadi Sai Meghana
*& Date   : May 2025
*&---------------------------------------------------------------------*

REPORT zemp_cert_report.

TABLES: zemp_cert_track.

TYPES: BEGIN OF ty_cert,
         emp_id      TYPE zemp_cert_track-emp_id,
         cert_id     TYPE zemp_cert_track-cert_id,
         cert_name   TYPE zemp_cert_track-cert_name,
         issue_date  TYPE zemp_cert_track-issue_date,
         expiry_date TYPE zemp_cert_track-expiry_date,
         status      TYPE zemp_cert_track-status,
       END OF ty_cert.

DATA: it_cert TYPE STANDARD TABLE OF ty_cert,
      wa_cert TYPE ty_cert.

START-OF-SELECTION.

  SELECT emp_id
         cert_id
         cert_name
         issue_date
         expiry_date
         status
    FROM zemp_cert_track
    INTO TABLE it_cert.

  LOOP AT it_cert INTO wa_cert.

    DATA(lv_days_left) = wa_cert-expiry_date - sy-datum.

    WRITE: / 'Employee ID:', wa_cert-emp_id,
             'Certification:', wa_cert-cert_name,
             'Expiry Date:', wa_cert-expiry_date,
             'Issue Date:' ,wa_cert-issue_date,
             'Days Left:', lv_days_left,
             'Status:', wa_cert-status.

    IF lv_days_left < 0.
      WRITE: '-> EXPIRED'.
    ELSEIF lv_days_left < 30.
      WRITE: '-> EXPIRING SOON!'.
    ENDIF.

  ENDLOOP.

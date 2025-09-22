*&---------------------------------------------------------------------*
*& Report ZEMP_CERT_REPORT
*&---------------------------------------------------------------------*
*& Purpose: Display employee certifications with ALV grid and expiry alerts
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
         days_left   TYPE i,
         alert       TYPE string,
       END OF ty_cert.

DATA: it_cert TYPE STANDARD TABLE OF ty_cert,
      wa_cert TYPE ty_cert.

START-OF-SELECTION.

* Fetch certification data
  SELECT emp_id
         cert_id
         cert_name
         issue_date
         expiry_date
         status
    FROM zemp_cert_track
    INTO TABLE @it_cert.

* Add calculated fields (days_left & alert)
  LOOP AT it_cert INTO wa_cert.
    wa_cert-days_left = wa_cert-expiry_date - sy-datum.

    IF wa_cert-days_left < 0.
      wa_cert-alert = 'EXPIRED'.
    ELSEIF wa_cert-days_left < 30.
      wa_cert-alert = 'EXPIRING SOON'.
    ELSE.
      wa_cert-alert = 'VALID'.
    ENDIF.

    MODIFY it_cert FROM wa_cert.
  ENDLOOP.

* Display with ALV Grid
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_structure_name = 'ZEMP_CERT_TRACK' " Dictionary structure
    TABLES
      t_outtab         = it_cert
    EXCEPTIONS
      program_error    = 1
      OTHERS           = 2.

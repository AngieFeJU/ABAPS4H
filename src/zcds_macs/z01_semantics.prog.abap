*&---------------------------------------------------------------------*
*& Report z01_semantics
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z01_semantics.

*Vista Ofrece las naotaciones que se tienen en la cabecera
*select from cdsviewannopos
*Nueva vista
select from Cds_View_Annotation_Position
fields *
where cdsname eq 'ZCDS_10_T100445'
*and annotationname like '%.%'
into table @data(gt_annotations_header).

cl_demo_output=>write( gt_annotations_header ).


*Vista Ofrece las naotaciones que se tienen a nivel columna
select from Cds_Field_Annotation
fields *
where cdsname eq 'ZCDS_10_T100445'
*and annotationname like '%.%'
into table @data(gt_annotations_field).

cl_demo_output=>write( gt_annotations_field ).

cl_demo_output=>display(  ).

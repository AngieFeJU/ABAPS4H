@AbapCatalog.sqlViewAppendName: 'ZCDS_23_100445'
@EndUserText.label: 'CDS Extend'
extend view zcds_22_t100445 with zcds_23_t100445
{
  scarr.currcode,
  scarr.url
}

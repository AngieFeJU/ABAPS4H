@AbapCatalog.sqlViewName: 'ZSQL_01_CDS_MACS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Herarchical Data'
define view zsql_cds_01_tree_macs
    as select from ztree
    association [1..*] to zsql_cds_01_tree_macs as _tree on $projection.parent = _tree.id
{
    key id, 
    key parent_id as parent,
        name, 
        _tree   
}

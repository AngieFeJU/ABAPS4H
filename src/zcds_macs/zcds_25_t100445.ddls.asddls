define hierarchy zcds_25_t100445
with parameters pManager : abap.char( 3 )
  as parent child hierarchy(
    source zcds_24_t100445
    child to parent association _Manager
    start where
      Manager = $parameters.pManager
    siblings order by
      Employee
    multiple parents allowed
  )
{
  key  Employee,
       Manager,
       Name,
       //Agrega mas elementos disponibles de  la definicion
       $node.parent_id             as ParentId,
       $node.hierarchy_parent_rank as ParentRack,
       $node.node_id               as NodeId,
       $node.hierarchy_level       as HLevel,
       $node.hierarchy_tree_size   as TreeSize,
       $node.hierarchy_rank        as HRank
       
}

# member_row.ROW_CLASS
* __Type :__ attribut d'affichage
* __Disponible dans :__ une boucle [`<!-- BEGIN member_row -->...<!-- END member_row -->`](https://github.com/Etana/template/blob/master/var/member_row.md#readme)
* __Utilisation :__

```html
<!-- BEGIN member_row -->
{member_row.ROW_CLASS}
<!-- END member_row -->
```

## Description[*](https://fa-tvars.appspot.com/var/member_row.ROW_CLASS)
Vaut `row1` :

* pour le premier membre sur lequel on boucle.
* si il valait `row2` pour le membre précédent.

et vaut `row2` au sinon.

Dans la template de base, c'est utilisé comme classe aux cases afin de donner un style différent une ligne sur deux.

## Utilisations dans les templates

### Version phpBB2
* __[`groupcp_info_body`](../tpl/var/groupcp_info_body.md#readme) :__ lignes [`66`](../tpl/src/subsilver/groupcp_info_body.tpl#L66), [`67`](../tpl/src/subsilver/groupcp_info_body.tpl#L67), [`68`](../tpl/src/subsilver/groupcp_info_body.tpl#L68), [`69`](../tpl/src/subsilver/groupcp_info_body.tpl#L69), [`70`](../tpl/src/subsilver/groupcp_info_body.tpl#L70), [`71`](../tpl/src/subsilver/groupcp_info_body.tpl#L71), [`72`](../tpl/src/subsilver/groupcp_info_body.tpl#L72)
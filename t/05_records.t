
; use Test::More tests => 6
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }



; is("".Cdml->recordset(),'[FMP-Record][/FMP-Record]')
; is("".Cdml->recordset("Need For Speed"),'[FMP-Record]Need For Speed[/FMP-Record]')

; is("".Cdml->portal({name => 'RechnungsNr'})
    ,'[FMP-Portal: RechnungsNr][/FMP-Portal]')

; is("".Cdml->portal({name => 'RechnungsNr'},'123')
    ,'[FMP-Portal: RechnungsNr]123[/FMP-Portal]')

; is("".Cdml->field(name => 'fld'),'[FMP-Field: fld, Raw]')
; is("".Cdml->field(name => 'fld', encode => 'HTML'),'[FMP-Field: fld, HTML]')


; use Test::More tests => 6
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }

; isa_ok(Cdml->choice,'HO::Tmpl::Markup::CDML::Element::Choice')

; my $expected = '[FMP-If: CurrentAction.neq.VIEW]test[/FMP-If]'
; my $condition = Cdml->current('action')->tag.'.neq.VIEW'
; is("".Cdml->choice($condition,'test'),$expected)

; is("".Cdml()->choice("FLD.eq.VAL","true","false"),
    '[FMP-If: FLD.eq.VAL]true[FMP-Else]false[/FMP-If]')
    
; is("".Cdml()->choice("FLD.eq.VAL","VAl",
                       "FLD.eq.COL","COL",
                       "false"),
    '[FMP-If: FLD.eq.VAL]VAl[FMP-ElseIf: FLD.eq.COL]COL[FMP-Else]false[/FMP-If]')

; is("".Cdml()->choice("FLD.eq.VAL","VAl",
                       "FLD.eq.COL","COL",
                       "FLD.eq.NUM","NUM",
                       "false"),
    '[FMP-If: FLD.eq.VAL]VAl[FMP-ElseIf: FLD.eq.COL]COL' .
                           '[FMP-ElseIf: FLD.eq.NUM]NUM' .
                           '[FMP-Else]false[/FMP-If]')

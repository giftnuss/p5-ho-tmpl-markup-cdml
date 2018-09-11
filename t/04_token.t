
; use Test::More tests => 6
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }


; is("".Cdml->token,'[FMP-CurrentToken: Raw]')
; is("".Cdml->token(id => 1),'[FMP-CurrentToken: 1, Raw]')
; is("".Cdml->token(id => 2,encode => 'HTML'),'[FMP-CurrentToken: 2, HTML]')

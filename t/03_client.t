
; use Test::More tests => 6
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }


; my $clientaddress = Cdml->client('address')
; is("".$clientaddress,'[FMP-ClientAddress]','ClientAddress')

; my $clientip = Cdml->client("ip")
; is("".$clientip,'[FMP-ClientIP]','ClientIP');

; my $clientpassword = Cdml->client("password")
; is("".$clientpassword,'[FMP-ClientPassword]','ClientPassword')

; my $clienttype = Cdml->client('type')
; is("".$clienttype,'[FMP-ClientType]','ClientType')

; my $username = Cdml->client('username')
; is("".$username,'[FMP-ClientUserName]','ClientUserName')

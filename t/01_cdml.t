; use Test::More 'no_plan'
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }

; is(Cdml(),'HO::Tmpl::Markup::CDML')

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

; my $mimetype = Cdml->content('mimetype','text/xml')
; is("".$mimetype,'[FMP-ContentMIMEType: text/xml]','MIME type')

;exit
; my $f=new CDML::Field('X')
; is("$f",'[FMP-Field: X, Raw]')

#; $f->encode('HTML')
#; is("$f",'[FMP-Field: X, HTML]')

#; $a=new CDML::Current('FoundCount');
#; is("$a",'[FMP-CurrentFoundCount]');

#; $a=new CDML::Record
#; is("$a",'[FMP-Record][/FMP-Record]');

#; $a=new CDML::Record('DATA')
#; is("$a",'[FMP-Record]DATA[/FMP-Record]');

; use Test::More 'no_plan'
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }

; is(Cdml(),'HO::Tmpl::Markup::CDML')

; my $mimetype = Cdml->content('mimetype','text/xml')
; is("".$mimetype,'[FMP-ContentMIMEType: text/xml]','MIME type')

;exit
; my $f=new CDML::Field('X')
; is("$f",'[FMP-Field: X, Raw]')

; $f->encode('HTML')
; is("$f",'[FMP-Field: X, HTML]')

; $a=new CDML::Current('FoundCount');
; is("$a",'[FMP-CurrentFoundCount]');

; $a=new CDML::Record
; is("$a",'[FMP-Record][/FMP-Record]');

; $a=new CDML::Record('DATA')
; is("$a",'[FMP-Record]DATA[/FMP-Record]');


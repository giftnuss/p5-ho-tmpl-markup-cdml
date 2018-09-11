
; use Test::More tests => 8
; use strict; use warnings

; BEGIN
    { use_ok( 'HO::Tmpl::Markup::CDML','Cdml' )
    }

; is("".Cdml->current("foundcount"),'[FMP-CurrentFoundCount]')
; is("".Cdml->current("recid"),'[FMP-CurrentRecID]')
; is("".Cdml->current("recpos"),'[FMP-CurrentRecordNumber]')
; is("".Cdml->current("recordcount"),'[FMP-CurrentRecordCount]')
; is("".Cdml->current("skip"),'[FMP-CurrentSkip]')
; is("".Cdml->current("action"),'[FMP-CurrentAction]')

; isa_ok(Cdml->current("action"),'HO::Tmpl::Markup::CDML::Element::Single')

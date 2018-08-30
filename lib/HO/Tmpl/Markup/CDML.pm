  package HO::Tmpl::Markup::CDML
# ******************************
; our $VERSION='0.02'
# *******************
; use strict; use warnings; use utf8
; no warnings "void"

; use Carp ()

; use parent 'Exporter'
; our @EXPORT_OK = ('Cdml')

; use HO::Tmpl::Markup::CDML::Element
; use HO::Tmpl::Markup::CDML::Element::Single
; use HO::Tmpl::Markup::CDML::Element::Double
; use HO::Tmpl::Markup::CDML::Element::Choice
; use HO::Tmpl::Markup::CDML::Element::Valuelist

; sub Cdml { return 'HO::Tmpl::Markup::CDML' }

; our @baseclasses =
    ( 'HO::Tmpl::Markup::CDML::Element::Single'
    , 'HO::Tmpl::Markup::CDML::Element::Double'
    , 'HO::Tmpl::Markup::CDML::Element::Choice'
    , 'HO::Tmpl::Markup::CDML::Element::Valuelist'
    )

; our %current =
    ( action      => 'Action'       # Zuletzt ausgeführte Datenbank Aktion
    , datasource  => 'Database'     # meist das gleiche wie ein DB-Table/Domain
    , date        => 'Date'         # Aktuelles Datum
    , error       => 'Error'        # Fehlercode der letzten Aktion
    , foundcount  => 'FoundCount'   # Aktuell aufgerufene Datensätze
    , layout      => 'Layout'       # eine beschränkte Auswahl von Feldern
    , recid       => 'RecID'        # System interne Record ID
    , recpos      => 'RecordNumber' # Aktuelle Position in der Auswahl
    , recordcount => 'RecordCount'  # Anzahl der vorhandenen Records
    , skip        => 'Skip'         # Wieviele Datensätze der Auswahl auslassen
    , time        => 'Time'         # Aktuelle Uhrzeit
    )

; sub current
    { my ($self,$tag,@args) = @_
    ; $tag = lc($tag)
    ; my $name = "Current" . ($current{$tag} || do
        { Carp::croak "CDML: Invalid tag '$tag' in method current." })
    ; return $baseclasses[0]->new($name)
    }

# FIXME: Die Dokumentation  von CDML ist nicht ganz klar
; sub token
    { my ($self,%args) = @_
    ; my $id = $args{'nr'} || $args{'id'} || ''
    ; my $enc = $args{'encode'} || 'Raw'
    ; my $name = "CurrentToken" . ($id ? ": $id, $enc" : ": $enc")
    ; return $baseclasses[0]->new($name)
    }

; sub recordset
    { my ($self,@args) = @_
    ; return $baseclasses[1]->new('Record',@args)
    }

; sub portal
    { my ($self,$opts,@args) = @_
    ; my $name = $opts->{'name'} ||
        Carp::croak "CDML: No name specified for portal."
    ; my $markup = $baseclasses[1]->new('Portal',@args)
    ; return $markup->set_tag_param($name)
    }

; sub field
    { my ($self,%args) = @_
    ; my $name = $args{'name'} || Carp::croak "CDML: No name specified for a field."
    ; my $enc  = $args{'encode'} || 'Raw'
    ; return $baseclasses[0]->new(sprintf("%s: %s, %s",'Field',$name,$enc))
    }

; our %client =
    ( address  => 'Address'
    , ip       => 'IP'
    , type     => 'Type'     # UserAgent-Identifikation
    , username => 'UserName'
    , password => 'Password'
    )

; sub client
    { my ($self,$info) = @_
    ; $info = $client{lc($info)} ||
        Carp::croak "CDML: Unknown client info type '$info'."
    ; return $baseclasses[0]->new("Client$info")
    }

; our %content =
    ( mimetype => 'MIMEType'
    )

; sub content
    { my ($self,$info,$arg) = @_
    ; $info = $content{lc($info)} ||
        Carp::croak "CDML: Unknown Content-Header '$info'."
    ; my $element = $baseclasses[0]->new("Content$info")
    ; $element->set_tag_param($arg)
    ; return $element
    }

; sub choice
    { my ($self,@args) = @_
    ; return $baseclasses[2]->new(@args)
    }

; sub valuelist
    { my ($self,$opts,@args) = @_
    ; my $field = $opts->{'field'}
        || Carp::croak "CDML: No field specified for valuelist."
    ; my $listname = $opts->{'listname'}

    ; my $markup = $baseclasses[3]->new('ValueList',@args)
    ; $markup->set_field($field)
    ; $markup->set_listname($listname) if $listname

    ; return $markup
    }

; sub valuelistitem
    { return $baseclasses[0]->new('ValueListItem')
    }

; sub valuelistchecked
    { return $baseclasses[0]->new('ValueListChecked')
    }

; sub inlineaction
    { return new HO::('[FMP-InlineAction]IA - is a todo.[/FMP-InlineAction]')
    }

; package HO::Tmpl::Markup::CDML::element
# ***************************************
; our $VERSION='0.03'
# *******************

; use base 'HO::tag'

; sub _begin_tag    () { '[FMP-' }  # inline
; sub _close_tag    () { ']' }      # inline
; sub _close_stag   () { ']' }      # inline
; sub _begin_endtag () { '[/FMP-' } # inline

; sub set_tag_param
    { my ($self,$param) = @_
    ; return $self->set_attribute('param' => $param)
    }

; sub attributes_string
    { my ($self) = @_
    ; my $param  = $self->get_attribute('param')
    ; return $param ? ": $param" : ''
    }

; 1

__END__


    # The FileMaker Dynamic Markup Language or FDML was a markup language used in
    # the earlier versions of FileMaker introduced in 1998. It is also often
    # referred to as Claris Dynamic Markup Language or CDML, named after the old
    # company Claris.
    #
    # from wikipedia


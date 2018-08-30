  package HO::Tmpl::Markup::CDML::Element::Valuelist;
# ***************************************************
  our $VERSION='0.02';
# ********************
; use parent 'HO::Tmpl::Markup::CDML::Element::Double'

; sub set_field
    { my ($self,$field) = @_
    ; return $self->set_attribute('field' => $field)
    }

; sub set_listname
    { my ($self,$listname) = @_
    ; return $self->set_attribute('listname' => $listname)
    }

; sub attributes_string
    { my ($self) = @_
    ; my $field  = $self->get_attribute('field')
    ; my $list   = $self->get_attribute('listname')

    ; return ": $field" . ($list ? ", List=$list" : '')
    }

; 1

__END__

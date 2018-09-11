  package HO::Tmpl::Markup::CDML::Element;
# ****************************************
  our $VERSION='0.03';
# ********************

; use parent 'HO::Tag'

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

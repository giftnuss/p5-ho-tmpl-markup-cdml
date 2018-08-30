  package HO::Tmpl::Markup::CDML::Element::Choice;
# ************************************************
  our $VERSION='0.01';
# ********************
; use parent 'HO::Tmpl::Markup::CDML::Element::Double'

# NOTE: here are no array refs allowed as arguments
# Maybe add a check if array refs contain an even
# number of arguments.
; my $custom_insert = sub
    { my ($self,@args) = @_

    ; if(@args%2) # an else exists
        { $self->set_default_choice( pop @args )
        }
    ; push @{$self->_thread}, @args
    ; return $self
    }

; sub set_default_choice
    { my ($self,$else) = @_
    ; if($self->has_attribute('default'))
        { $self->get_attribute('default')->insert($else)
        }
      else
        { $self->set_attribute('default',new HO($else))
        }
    ; return $self
    }

; sub init
    { my ($self,@args) = @_
    ; my $class = ref $self

    ; my $idx = HO::accessor::_value_of($class,"_insert")
    ; $self->[$idx] = $custom_insert

    ; return $self->insert(@args)
    }

; sub string
    { my $self=shift
    ; my $r   = ""
    ; my @list = @{$self->_thread}
    ; my ($c,$i) = splice(@list,0,2)

    ; $r .= $self->_begin_tag . 'If: ' . $c . $self->_close_tag . $i

    ; while(@list)
        { ($c,$i) = splice(@list,0,2)
        ; $r .=  $self->_begin_tag . 'ElseIf: ' . $c . $self->_close_tag . $i
        }

    ; if($self->has_attribute('default'))
        { $r .= $self->_begin_tag . 'Else' . $self->_close_tag
              . $self->get_attribute('default')
        }

    ; $r .= $self->_begin_endtag . 'If' . $self->_close_tag
    ; return $r
    }

; 1

__END__

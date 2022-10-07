#!/bin/bash
#


TMPF=`mktemp`
env -i tcsh ${TCSH_ARG} -c "
    set home=${HOME} ;
    setenv JLAB_ROOT ${JLAB_ROOT} ;
    setenv JLAB_VERSION ${JLAB_VERSION} ;
    setenv OSTYPE ${OSTYPE}
    setenv TERM ${TERM} ;
    setenv PATH ${PATH} ;
    setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH} ;
    setenv DYLD_LIBRARY_PATH ${DYLD_LIBRARY_PATH} ;
    set packages = ( clhep xercesc qt geant4 scons ccdb mlibrary hipo )
    source /root/ce/jlab.csh  ;
    printenv" | perl -e '
  my %IGNORE;
  ## Add variables to ignore to the space-delimited list below
  foreach( qw(
    HISTTIMEFORMAT SHELL PS1 overwrite _ BASH_FUNC_module\(\)
  )){ $IGNORE{$_}="yes"; }

  while(<>) {
    chomp;

    ## Look for and treat variables from printenv here
    if(/^([_a-zA-Z0-9]*?)=(.*)$/) {
      my $var = $1;
      my $arg = $2;

      next if( exists($IGNORE{$var}) );

      if( $ENV{OSTYPE} eq "darwin" ) {
        if( $var =~ /(DY)?LD_LIBRARY_PATH/ ) {
          $arg =~ s/:$//;   # strip trailing colon
          print "export ${var}=\"${arg}:$ENV{$var}\"\n";
        }
        next;
      }

      ## DEFAULT is to re-export the variable list into the bash environment
      print "export ${var}=\"${arg}\"\n";
      next;
    }

    ## Dump information messages (and everything else) to STDERR where it should not hurt anyone
    print STDERR "$_\n";
  }
' >> $TMPF

source "$TMPF"
rm -f "$TMPF"

alias l='ls -l'
alias lt='ls -lrt'


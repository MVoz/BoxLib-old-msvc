
    CC  := pgcc
    CXX := pgc++
    FC  := pgf95
    F90 := pgf95
    FFLAGS   += -module $(mdir) -I$(mdir) 
    F90FLAGS += -module $(mdir) -I$(mdir)

FCOMP_VERSION := $(shell $(FC) -V 2>&1 | grep 'target')

    ifdef OMP
      F90FLAGS += -mp=nonuma -Minfo=mp
      FFLAGS += -mp=nonuma -Minfo=mp
      CFLAGS += -mp=nonuma -Minfo=mp
      CXXFLAGS += -mp=nonuma -Minfo=mp
    endif

    ifdef NDEBUG
      FFLAGS   += -gopt -O2
      F90FLAGS += -gopt -O2
      CFLAGS   += -gopt -O2
      CXXFLAGS += -gopt -O2
    else
      FFLAGS   += -g
      F90FLAGS += -g
      CFLAGS   += -g
      CXXFLAGS += -g
    endif

    LDFLAGS += -pgc++libs
    
#--------------------------------------------------------------------------------------------------#
#                                                                                                  #
# JCL Debug extension tools                                                                        #
#                                                                                                  #
#--------------------------------------------------------------------------------------------------#

!ifndef ROOT
ROOT = $(MAKEDIR)\..
!endif

!ifndef JCL
JCL = ..\..\..\..
!endif

#---------------------------------------------------------------------------------------------------
INC = $(JCL)\source
LIB = $(JCL)\lib\d7;$(JCL)\lib\d6;$(JCL)\lib\d5
DCU =
RES =
BIN = $(JCL)\bin
MAP = $(BIN)\$&.map
DRC = $&.drc
#---------------------------------------------------------------------------------------------------
MAKE = $(ROOT)\bin\make.exe -$(MAKEFLAGS) -f$**
DCC = $(ROOT)\bin\dcc32.exe -e$(BIN) -i$(INC) -n$(DCU) -q -r$(RES) -u$(LIB) -w $**
BRCC = $(ROOT)\bin\brcc32.exe $**
#---------------------------------------------------------------------------------------------------
default: \
  MakeJclDbg.exe \
  MapToJdbg.exe \
  TlbToMap.exe
#---------------------------------------------------------------------------------------------------

MakeJclDbg.exe: MakeJclDbg.dpr
  $(DCC)

MapToJdbg.exe: MapToJdbg.dpr
  $(DCC)

TlbToMap.exe: TlbToMap.dpr
  $(DCC)


# CADENCE .tcshrc
# =======================================================================
set cadence_base_dir = "/escnfs/home/csesoft/cadence/installs"
setenv XLM $cadence_base_dir/XCELIUM1903
setenv ASSURA $cadence_base_dir/ASSURA41
setenv CONFRML $cadence_base_dir/CONFRML172
setenv ETS $cadence_base_dir/ET151
setenv EXT $cadence_base_dir/EXT172
setenv IC $cadence_base_dir/IC617
setenv INCISIVE $cadence_base_dir/INCISIVE152
#setenv INDAGO $cadence_base_dir/INDAGO201611
setenv INNOVUS $cadence_base_dir/INNOVUS171
#setenv JOULES $cadence_base_dir/JLS151
setenv GENUS $cadence_base_dir/GENUS172
setenv LD_LIBRARY_PATH $IC/tools.lnx86/lib
setenv LIBERATE $cadence_base_dir/LIBERATE171
setenv MDV $cadence_base_dir/MDV1803
setenv MVS $cadence_base_dir/MVS172
setenv PVS $cadence_base_dir/PVS161
#setenv RC $cadence_base_dir/RC142
setenv SIGRITY $cadence_base_dir/SIGRITY2017
setenv SPB $cadence_base_dir/SPB172
setenv SPECTRE $cadence_base_dir/SPECTRE171
setenv SSV $cadence_base_dir/SSV172
setenv STRATUS $cadence_base_dir/STRATUS172
#setenv LCU $cadence_base_dir/LCU
setenv DD_DONT_DO_OS_LOCKS SET
setenv CDS_LIC_FILE $cadence_base_dir/license.txt
setenv LM_LICENSE_FILE $cadence_base_dir/license.txt
# # setenv CDS_AUTO_64BIT = ALL
setenv SPECTRE_DEFAULTS -E
setenv CDS_Netlisting_Mode Analog
setenv CDS_AUTO_64BIT "EXCLUDE:si.exe"
# SystemC Environment
setenv SYSTEMC $STRATUS/tools.lnx86/stratus/systemc/2.3

alias prepend 'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 "\!:2":${\!:1}'
alias extend 'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 ${\!:1}:\!:2'
setenv LANG C
prepend PATH $IC/tools.lnx86/bin
prepend PATH $IC/tools.lnx86/dfII/bin
prepend PATH $IC/tools.lnx86/dfII/bin/artil
prepend PATH $IC/share/bin
prepend PATH $IC/doc/cdsdoc/bin
prepend PATH $XLM/tools.lnx86/bin
prepend PATH $ASSURA/tools.lnx86/bin
prepend PATH $CONFRML/tools.lnx86/bin
prepend PATH $ETS/tools.lnx86/bin
prepend PATH $EXT/tools.lnx86/bin
prepend PATH $INCISIVE/tools.lnx86/bin
#prepend PATH $INDAGO/tools.lnx86/bin
prepend PATH $INNOVUS/tools.lnx86/bin
#prepend PATH $JOULES/tools.lnx86/bin
prepend PATH $GENUS/tools.lnx86/bin
prepend PATH $LIBERATE/tools.lnx86/bin
#prepend PATH $LCU/tools.lnx86/bin
prepend PATH $MDV/tools.lnx86/bin
prepend PATH $MVS/tools.lnx86/bin
prepend PATH $PVS/tools.lnx86/bin
#prepend PATH $RC/tools.lnx86/bin
prepend PATH $SIGRITY/tools.lnx86/bin
prepend PATH $SPB/tools.lnx86/bin
prepend PATH $SPECTRE/tools.lnx86/bin
prepend PATH $SSV/tools.lnx86/bin
prepend PATH $STRATUS/tools.lnx86/bin
prepend LD_LIBRARY_PATH $IC/tools.lnx86/dfII/lib
prepend LD_LIBRARY_PATH $XLM/tools.lnx86/lib
prepend LD_LIBRARY_PATH $ASSURA/tools.lnx86/lib
prepend LD_LIBRARY_PATH $CONFRML/tools.lnx86/lib
prepend LD_LIBRARY_PATH $ETS/tools.lnx86/lib
prepend LD_LIBRARY_PATH $EXT/tools.lnx86/lib
prepend LD_LIBRARY_PATH $INCISIVE/tools.lnx86/lib
#prepend LD_LIBRARY_PATH $INDAGO/tools.lnx86/lib
prepend LD_LIBRARY_PATH $INNOVUS/tools.lnx86/lib
#prepend LD_LIBRARY_PATH $JOULES/tools.lnx86/lib
prepend LD_LIBRARY_PATH $GENUS/tools.lnx86/lib
prepend LD_LIBRARY_PATH $LIBERATE/tools.lnx86/lib
#prepend LD_LIBRARY_PATH $LCU/tools.lnx86/lib
prepend LD_LIBRARY_PATH $MDV/tools.lnx86/lib
prepend LD_LIBRARY_PATH $MVS/tools.lnx86/lib
prepend LD_LIBRARY_PATH $PVS/tools.lnx86/lib
#prepend LD_LIBRARY_PATH $RC/tools.lnx86/lib
prepend LD_LIBRARY_PATH $SIGRITY/tools.lnx86/lib
prepend LD_LIBRARY_PATH $SPB/tools.lnx86/lib
prepend LD_LIBRARY_PATH $SPECTRE/tools.lnx86/lib
prepend LD_LIBRARY_PATH $SSV/tools.lnx86/lib
prepend LD_LIBRARY_PATH $STRATUS/tools.lnx86/lib
prepend LD_LIBRARY_PATH $SYSTEMC/lib-linux64

#
## NCSU
setenv USE_NCSU_CDK
setenv CDS_SITE $cadence_base_dir/NCSU/ncsu-cdk-1.6.0.beta/local
setenv CDK_DIR $cadence_base_dir/NCSU/ncsu-cdk-1.6.0.beta
setenv CDS $cadence_base_dir/NCSU/

#!/bin/bash


export CDS_LIC_FILE=5280@192.168.32.10

export CDS_ROOT=/home/tools/cadence/installs
export CDS=$CDS_ROOT/IC618

export SPECTREHOME=$CDS_ROOT/SPECTRE201
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Some of these variables are used by various other tools, e.g. foundry's PDK.
# Set them to be safe
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export CDSDIR=$CDS
export CDSHOME=$CDS
export CADENCE_DIR=$CDS
export CDS_INST_DIR=$CDS
#export CDS_ROOT=$CDS
export CDSROOT=$CDS
export PATH=$CDS/bin:$PATH
export LD_LIBRARY_PATH=$CDS/tools.lnx86/lib/64bit/RHEL/RHEL8

# Support for 64-bit executables (this should be set for 64-bit hosts - IMPORTANT!!!)
export CDS_AUTO_64BIT=ALL

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Master IC PATH
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export PATH=$PATH:$CDSDIR/tools/dfII/bin:$CDSDIR/tools/plot/bin

# To run Virtuoso Schematic and Verilog Driven Mixed-Signal Flow,  the following
# environment variable must be set before starting Virtuoso.
export CDS_ENABLE_VMS=1

# #export OA_HOME=$CDS/oa_v22.50.036
# export OA_UNSUPPORTED_PLAT=linux_rhel50_gcc48x

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Cadence Analog Simulators (MMSIM) - Spectre, SpectreRF, &
# RelXpert (Reliability Simulator)
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export PATH=$PATH:$SPECTREHOME/bin:$SPECTREHOME/tools/relxpert/bin

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Cadence QRC Extraction, Advanced Analysis & Modeling (EXT)
#
# Note: QRC must appear in the PATH before Assura executables
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export QRC_HOME=$CADHOME/EXT151
#export PATH=$PATH:$QRC_HOME/bin

# Enhance precision of QRC for DFM MOS extraction
export QRC_MOS_LW_PRECISION=Y

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Cadence Assura (ASSURA) - DRC. LVS, parasitic extraction
#
# These executables should be on the PATH after DFII executables
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export ASSURAHOME=$CDS_ROOT/ASSURA41
export PATH=$PATH:$ASSURAHOME/tools/bin:$ASSURAHOME/tools/assura/bin

export PEGASUSHOME=$CDS_ROOT/PEGASUS213
export PATH=$PATH:$PEGASUSHOME/tools/bin

export QUANTUSHOME=$CDS_ROOT/QUANTUS212
export PATH=$PATH:$QUANTUSHOME/tools/bin

# Setting this variable enables Assura to work with PVS licenses only without
# attempts to check-out Assura licenses first and thus speeds up execution.
#export ASSURA_USE_PVS_LICENSE=1

# Set up foundry DFM PATH for Assura - CRNxxG/CRNxxLP process for current project
# export TSMC_ASU_DFM_PATH=/opt/PDKs/tsmc/CRNxxG/Assura/lvs_rcx/DFM
#export TSMC_ASU_DFM_PATH=/opt/PDKs/tsmc/CRNxxLP/Assura/lvs_rcx/DFM

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Cadence Physical Verification System, MaskCompose, & QuickView (PVS)
#
# K2_VIEWER_HOME must be set before Quickview is invoked. LM_LICENSE_FILE
# is required to run any K2 product.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export K2_HOME=$CDS_ROOT/PEGASUS213/tools/K2
export K2_VIEWER_HOME=$K2_HOME/Viewer
export K2_MASKCOMPOSE_HOME=$K2_HOME/MaskCompose
export K2_MC_DATA=$HOME/Projects
#export PATH=$PATH:$CADHOME/PVS151/bin:$CADHOME/PVS151/tools/bin:$K2_MASKCOMPOSE_HOME/bin
export XKEYSYMDB=$CDSDIR/tools/plot/etc/XKeysymDB

##############################################################
# Cadence Digital Flow - HDL Simulations, Synthesis, P&R
#
##############################################################
# Genus Synthesis Solution (GENUS) - Logic & Physical Synthesis
#export PATH=$PATH:$CADHOME/GENUS152/tools/bin

# Command on terminal to launch Genus
# genus

# RTL Power Analysis (Joules)
#export PATH=$PATH:$CADHOME/JLS151/bin

# Command on terminal to start Joules
# joules &

# Innovus Implementation System (INNOVUS) - P&R
#export PATH=$PATH:$CADHOME/INNOVUS152/bin

# Command on terminal to launch Innovus
# innovus &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Cadence C-to-Silicon Compiler (CTOS)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH=$PATH:$CADHOME/CTOS142/bin

# Command on terminal to launch CTOS
# ctosgui &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Encounter Conformal (CONFRML) - Constraint Designer, Low Power Designer,
# & ECO Designer
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH=$PATH:$CADHOME/CONFRML152/bin

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Command on terminal to launch Confirmal with license options:
# -xl/-gxl/-rcv/-eco/-ecogxl/-lp/-lpxl/-ccd/-ccdxl/-lpgxl/-verify;
#  default is set to -l if no option is given.
# example:  "lec -lp -verify -gui &" for Low Power license and Verify license
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# lec -lpgxl -verify -gui &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Silicon Signoff & Verification (SSV) - including Tempus Timing Signoff
# & Voltus IC Power Integrity
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH=$PATH:$CADHOME/SSV152/tools/bin

# Command on terminal to launch tempus or voltus
# tempus &
# voltus &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Incisive Verification Platform - Digital HDL simulators
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH=$PATH:$CADHOME/INCISIVE151/bin:$CADHOME/INCISIVE151/tools/bin::$CADHOME/INCISIVE151/tools/vtools/vfault/bin

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# For 3-step (ncvlog, ncelab, and ncsim) flow to run Virtuoso AMS Designer simulator,
# the following library path environment variable has to be set.
#
# # For single-step (irun) running AMS simulator, LD_LIBRARY_PATH is not required.
# #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export LD_LIBRARY_PATH=$CADHOME/INCISIVE151/tools/lib/64bit:$CADHOME/INCISIVE151/tools/lib

# Enable noise analysis in AMS designer
AMS_ENABLE_NOISE=YES

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Set up Universal Verification Methodology (UVM) Environment Variables
#
# uvm_home defines the path to the UVM class library
# ml_uvm defines the path to the ml_uvm code
# ml_seq_dir defines the path to the SystemVerilog ml_uvm_seq package for using
# sequencer stubs
# The SystemVerilog package ml_uvm_seq is included in the Specman installation.
# To use it, you must add the following command-line options to your compilation flow,
# as additional command-line arguments to irun or ncvlog :
# irun ... ${ML_SEQ_DIR}/ml_uvm_seq.sv -incdir ${ML_SEQ_DIR}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export uvm_home=$CADHOME/INCISIVE151/tools/uvm
# export ml_uvm=$CADHOME/INCISIVE151/tools/uvm/uvm_lib/uvm_ml/sc/ml_uvm
# export ml_seq_dir=$CADHOME/INCISIVE151/specman/src

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Set up the HOME Environment Variable for Incisive Verification Kits
# Source the appropriate environment setup file (Note: a space is required
# between . and $SOCV_KIT_HOME/env.sh)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export SOCV_KIT_HOME=$CADHOME/INCISIVE151/kits/VerificationKit
# . $SOCV_KIT_HOME/env.sh

# Command on terminal to start up Incisive Verification Kits
# start_kit &

#***********************************************************************
# Command on terminal to launch NClaunch
#***********************************************************************
# nclaunch &

# Command on terminal to start up Specman & SimVision
# specman -gui &

# Command on terminal to invoke Desktop Manager
# emanager -desktop &
# vmanager &

# Encounter Diagnostics & Test (ET)
#export PATH=$PATH:$CADHOME/ET151/bin

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Command on terminal to launch ET,  or with license options: -architect/-truetime/-diag
# commands eta, ett and ediag are equivalent to et -architect, et -truetime and et -diag
# which invokes Encounter Test Architect,  Encounter True_time Delay Test and
# Encounter Diagnostics, respectively.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# eta &
# ett &
# ediag &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Verification IP Product Catalog (VIPCAT)
#
# VIP products are configured using a GUI called PureView.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export CDN_VIP_ROOT=$CADHOME/VIPCAT113
# export CADENCE_VIP_LIC_ORDER=newrev:soc:portfolio:alacarte
# export ABVIP_ISNT_DIR=$CDN_VIP_ROOT/tools/abvip
# # In e , set SPECMAN_PATH to the location of the specific UVC directory
# export SPECMAN_PATH=$PATH:$CDN_VIP_ROOT/utils:$CDN_VIP_ROOT/packages:$CDN_VIP_ROOT/vips/enet/vr_enet
# export DENALI=$CDN_VIP_ROOT/tools/denali_64bit
# #export PATH=$PATH:$DENALI/bin
# In SV, add the UVC by including the specific VIP SV directory in the irun command:
#irun -incdir $CDN_VIP_ROOT/vips/enet/vr_enet/sv

# Command on terminal to launch PureView to configure VIP products.
# pureview

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Manufacturability and Variability Sign-Off (MVS) - Litho Analyzers,
# CMP Predictor
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export PATH=$PATH:$CADHOME/MVS152/tools/bin

# Commands on terminal to launch Litho Analyzers, CMP Predictor
#lpa &
#lea &
# need to figure out correct license keys in license.dat for CMP Predictor
# (current ones don't work)
#cmms -ccp &
#cmms -ccpo &

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Library Characterizer (Liberate)
#
# Include the integrated Spectre in PATH
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#export ALTOSHOME=$CADHOME/LIBERATE151
#export PATH=$PATH:$ALTOSHOME/bin
#export PATH=$PATH:$ALTOSHOME/tools.lnx86/spectre/bin
#export ALTOS_64=1

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Set up NCSU CDK
#
# This is optional for educational purpose; use foundry provided PDKs
# instead for production projects by including foundry PDKs in cds.lib
# in the working directory.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export CDK_DIR=/opt/PDKs/ncsu-cdk-1.6.0.beta

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Mentor Graphics Calibre
#
# MGC_HOME environment variable has been deprecated in favor
# of CALIBRE_HOME. 
#
# Use absolute PATH to license.dat instead of port@hostname
#
# .cdsinit in the working directory should be modified for Calibre to
# be integrated into Virtuoso menu bar.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export MGC_HOME=/opt/mentor
# export CALIBRE_HOME=$MGC_HOME/Calibre2015/aoi_cal_2015.2_36.27
# export MGLS_LICENSE_FILE=$MGC_HOME/license/license.dat
# export PATH=$PATH:$CALIBRE_HOME/bin
# export MGC_LIB_PATH=$CALIBRE_HOME/lib

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Mentor Environment Checking
#
# CALIBRE_OS_MSG_LEVEL variable is deprecated with the Calibre 2013.1 release.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#***********************************************************************
# Enable Calibre RealTime with Cadence Virtuoso
#***********************************************************************
#export MGC_CALIBRE_REALTIME_VIRTUOSO_ENABLED=1
#export OA_PLUGIN_PATH=$CALIBRE_HOME/shared/pkgs/icv/tools/queryskl
#export LD_LIBRARY_PATH=$CALIBRE_HOME/shared/pkgs/icv/tools/calibre_client/lib/64:${LD_LIBRARY_PATH}
#export MGC_CALIBRE_REALTIME_VIRTUOSO_SAVE_MESSENGER_CELL=1

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This variable enables Calibre Interactive to save all GUI settings including default
# values to a runset file for future re-run
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
export MGC_CALIBRE_SAVE_ALL_RUNSET_VALUES=1

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Set up socket connection with Virtuoso schematic or layout viewer (using default ports
# 9199 for schematic and 9189 for layout) in the form of host:port
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export MGC_CALIBRE_SCHEMATIC_SERVER=ThinkPad-T510:9199
# export MGC_CALIBRE_LAYOUT_SERVER=ThinkPad-T510:9189

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Set up foundry DFM PATH for Calibre - CRNxxG/CRNxxLP process for current project
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# export TSMC_CAL_DFM_PATH=/opt/PDKs/tsmc/CRNxxG/Calibre/lvs/DFM
#export TSMC_CAL_DFM_PATH=/opt/PDKs/tsmc/CRNxxLP/Calibre/lvs/DFM

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# The license server is no longer needed once all features are set to uncounted or 0
# (unlimited use) for the FEATURE lines in license.dat. file.  The SERVER, VENDOR and
# USE_SERVER lines can be safely removed from license.dat file, i.e. license.dat here
# contains FEATURE lines only.  DO NOT START UP LICENSE SERVER DAEMON!!!
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#***********************************************************************
# Set the name of the executable for displaying PDF documentation from Calibre Help
# menu. The default is acroread if it exists.  Make sure evince has been installed before
# setting up the following (on Ubuntu type command "sudo apt-get install evince").
#***********************************************************************
export MGC_PDF_READER=evince
export OA_HOME=/home/tools/cadence/installs/IC618/oa_v22.60.092
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Command on terminal to launch Cadence Virtuoso tools
#
# Adding & runs the process in the background allowing to continue using
# the current terminal.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#virtuoso &

;+ 
; This routine will download the data and plot Figure 1 panels c-f. The 
; output figure file will be a postscript titled: "Fig1_panels_c_f_ApJ_AAS71170.ps"
; saved under the user's "Default" directory.
; The code is written in Interactive Data Language (IDL). It is assumed that the 
; SPEDAS IDL package from www.spedas.org is available to the user. 
; Either the path to the unzipped SPEDAS codeset is known to IDL or the folder is 
; copied under the Default directory.
; 
; Data files will be downloaded to ~/data on a Unix-Mac machine. 
; 
; IDL version: 9.2
; SPEDAS version: spdsw_r33269_2025-04-18
; Uploaded to Github on Dec. 21, 2025.


; Initializing the download directory for MMS
mms_init

;;;;;; Loading burst mode data from MMS1 over an extended period:
tr = time_double(['2025-02-10/02:30:00','2025-02-10/06:00:00'])
timespan, tr
;; Loading magnetometer data
mms_load_fgm, trange=tr, probe='1', data_rate='brst', level='l2', /time_clip, /get_fgm_ephemeris
;; Loading ion and electron data
mms_load_fpi, trange=tr, datatype= ['des-moms', 'dis-moms'], data_rate='brst', /center, level='l2', probe='1', /time_clip
;;; Combining magnetic field components and strength
store_data, 'mms1_fgm_b_gse_brst_l2_ball', data=['mms1_fgm_b_gse_brst_l2_bvec','mms1_fgm_b_gse_brst_l2_btot'], dlim={ylog:0, ystyle:1, labflag:1}
;;; Combining ion and electron density timeseries.
store_data, 'mms1_Ni_Ne_brst', data = ['mms1_des_numberdensity_brst', 'mms1_dis_numberdensity_brst']

;; Option commands are for setting up the figure.
options, 'mms1_fgm_b_gse_brst_l2_btot','ytitle','|B| [nT]'
options, 'mms1_fgm_b_gse_brst_l2_btot','ysubtitle',''
options, 'mms1_fgm_b_gse_brst_l2_btot','labels','|B|'
options, 'mms1_fgm_b_gse_brst_l2_btot','thick',4
options, 'mms1_fgm_b_gse_brst_l2_bvec','labels',['B!dx!n','B!dy!n','B!dz!n']
options, 'mms1_fgm_b_gse_brst_l2_bvec','thick',4
options, 'mms1_fgm_b_gse_brst_l2_bvec','constant',0

options, 'mms1_fgm_b_gse_brst_l2_ball','ytitle','B!DGSE!N [nT]'
options, 'mms1_fgm_b_gse_brst_l2_ball','ysubtitle',''
options, 'mms1_fgm_b_gse_brst_l2_ball','yrange',[-15,15]
options, 'mms1_fgm_b_gse_brst_l2_ball','ystyle', 1
options, 'mms1_fgm_b_gse_brst_l2_ball','ytickinterval',10

options, 'mms1_des_numberdensity_brst','colors', 6
options, 'mms1_des_numberdensity_brst','labels', 'Ne'
options, 'mms1_des_numberdensity_brst','ytitle','N!De!N [cm!E-3!N]'
options, 'mms1_des_numberdensity_brst','labflag',-1
options, 'mms1_des_numberdensity_brst','ysubtitle',''
options, 'mms1_dis_numberdensity_brst', 'colors', 2
options, 'mms1_dis_numberdensity_brst', 'labels', 'Ni'
options, 'mms1_dis_numberdensity_brst', 'ytitle','N!Di!N [cm!E-3!N]'
options, 'mms1_dis_numberdensity_brst', 'labflag',-1
options, 'mms1_dis_numberdensity_brst', 'ysubtitle',''

options, 'mms1_Ni_Ne_brst', 'ytitle','N [cm!E-3!N]'
options, 'mms1_Ni_Ne_brst', 'labels', ['n!de!n','n!di!n']
options, 'mms1_Ni_Ne_brst', 'labflag',-1
options, 'mms1_Ni_Ne_brst', 'ysubtitle',''
options, 'mms1_Ni_Ne_brst', 'yrange',[0,10.]
options, 'mms1_Ni_Ne_brst','ytickinterval', 5.

options, 'mms1_dis_energyspectr_omni_brst', 'ytitle', 'E [eV]'
options, 'mms1_dis_energyspectr_omni_brst' ,'ysubtitle',''
options, 'mms1_dis_energyspectr_omni_brst', 'yrange',[1e2,2e4]
options, 'mms1_dis_energyspectr_omni_brst', 'yTICKS', 2
options, 'mms1_dis_energyspectr_omni_brst', 'ytickvalues', [1e2, 1e3, 1e4]
options, 'mms1_dis_energyspectr_omni_brst', 'ytickname', ['10!u2!n','10!u3!n','10!u4!n']
options, 'mms1_dis_energyspectr_omni_brst', 'ztitle', 'keV/[cm!u2!n s str keV]'
options, 'mms1_dis_energyspectr_omni_brst', 'zrange',[1e2,1e8]
options, 'mms1_dis_energyspectr_omni_brst', 'ZTICKS', 2
options, 'mms1_dis_energyspectr_omni_brst', 'ztickvalues', [1e2, 1e5, 1e8]
options, 'mms1_dis_energyspectr_omni_brst', 'ztickname', ['10!u2!n','10!u5!n','10!u8!n']

options, 'mms1_dis_bulkv_gse_brst', 'ysubtitle',''
options, 'mms1_dis_bulkv_gse_brst', 'labels', ['V!dx!n', 'V!dy!n', 'V!dz!n']
options, 'mms1_dis_bulkv_gse_brst', 'ytitle','V!Di-GSE!N [km/s]'
options, 'mms1_dis_bulkv_gse_brst', 'ytickinterval', 300.0
options, 'mms1_dis_bulkv_gse_brst', 'yrange', [-600,300.0]
options, 'mms1_dis_bulkv_gse_brst', 'ystyle', 1
options, 'mms1_dis_bulkv_gse_brst', 'constant', 0.0
options, 'mms1_dis_bulkv_gse_brst', 'thick',4

pnames = ['mms1_fgm_b_gse_brst_l2_ball', 'mms1_dis_energyspectr_omni_brst', 'mms1_Ni_Ne_brst', 'mms1_dis_bulkv_gse_brst']
options, pnames, 'charsize', 1.9
options, pnames, 'XTICKLEN', 0.075
options, pnames, 'YTICKLEN', 0.02
tplot_options, 'xmargin', [15, 15]
; Opening the figure file for writeout:
popen,'Fig1_panels_c_f_ApJ_AAS71170', xsize=7.5, ysize=7.5, unit = 'inches', color = 'w'
;; Plotting four variables
tplot,pnames, get_plot_position=pos, trange = time_double('2025-02-10/'+['04:47:26','04:48:16'])
;; printing panel labels:
letts = ['c','d','e','f']
for kk=0, 3 do begin
  pp=pos[*,kk]
  xt=(pp[2]-pp[0])*0.025+pp[0]
  yt = (pp[3]-pp[1])*0.10+pp[1]
  XYOUTS, xt, yt, letts[kk]+')',CHARSIZE = 3.17, /NORMAL, color=255
  XYOUTS, xt, yt, letts[kk]+')',CHARSIZE = 3.0, /NORMAL
endfor

pclose   ; ; This closes the figure file


















end
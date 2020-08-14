#define FILE_STRSTR		"calstr.h"
#define STR_VERSIONSTR	"v4.4005"
#define STR_VERSION			0	/*v4.4005*/
#define STR_CANCELLED	     1 	/*CANCELLED*/
#define STR_WORKING	     2	/*Working*/
#define STR_STILLWORKING     3	/*working...*/
#define STR_PLEASEWAIT	     4	/*please wait*/
#define STR_ENTERNAME	     5	/*Name must be entered*/
#define STR_ENTERDATE	     6	/*Date must be entered*/
#define STR_ENTERERROR	     7	/*Error must be entered*/
#define STR_ENTERPARMS	     8	/*Parameters must be entered*/
#define STR_INPUTERROR	     9	/*Input Error*/
#define STR_BADRESOLUTION   10	/*Invalid resolution (1..100)*/
#define STR_INVALIDPLOTNO   11	/*Invalid plot number (1..30)*/
#define STR_COMPILING	    12	/*Compiling*/
#define STR_APPLYTOCURRENT  13	/*Apply to current group*/
#define STR_CALCMENU	    14	/*&Calculate\tAlt+F10*/
#define STR_RECALCMENU	    15	/*Alter &data\tAlt+F10*/
#define STR_CALCULATING	    16	/*Calculating*/
#define STR_CHECKINGNAMES   17	/*checking names...*/
#define STR_NUMBERING	    18	/*numbering items...*/
#define STR_TESTINGREL	    19	/*testing for relations...*/
#define STR_COMPUTING	    20	/*calculating distributions...*/
#define STR_QUESTSAVE	    21	/*New data has been\nentered.  Save file\nbefore closing*/
#define STR_QUESTSAVEFILE   22	/* has\nchanged.  Save file\nbefore closing*/
#define STR_CLOSINGRUN	    23	/*Closing run*/
#define STR_SAVERUN	    24	/*Save run file*/
#define STR_QUESTDEL	    25	/*Are you sure you want to delete*/
#define STR_EDITGROUP	    26	/*Edit group*/
#define STR_RENAMETO	    27	/*Rename to*/
#define STR_OPENDATA	    28	/*Open data file*/
#define STR_OPENPLOT	    29	/*Open plot file*/
#define STR_OPENRUN	    30	/*Open run file*/
#define STR_CLOSELOG	    31	/*Close log file*/
#define STR_APPENDRUN	    32	/*Append run file*/
#define STR_KEEPPLOT	    34	/*Keep plot file*/
#define STR_DEFAULT1	    35	/*Calendar date 1*/
#define STR_DEFAULT2	    36	/*Calendar date 2*/
#define STR_CALENDARAGE	    37	/*Calendar date*/
#define STR_CALENDARYEARS   38	/*Calendar years*/
#define STR_RADIOCARBONAGE  39	/*Radiocarbon determination*/
#define STR_CALIBAGE	    40	/*Calibrated date*/
#define STR_OPTIONSHELP	    41	/* plts curv rang dist gauss norm ref bp pgno col cont solid hist grid shad ital fine vert font size*/
#define STR_PRINTERBUSY	    42	/*Printer being used*/
#define STR_CALIBPLOT	    43	/*Calibration plot*/
#define STR_GOTOPAGE	    44	/*Goto Page*/
#define STR_NEWPAGENO	    45	/*new page number*/
#define STR_OPEN	    46	/*Open*/
#define STR_SAVEAS	    47	/*Save as*/
#define STR_PRINTDOCNAME    48	/*Cal_Plot*/
#define STR_PRINTING	    49	/*Printing*/
#define STR_COMMANDPMT	    50	/*command*/
#define STR_NAMEPMT	    51	/*name date error [ENTER]*/
#define STR_EXPECTINGPMT    52	/*expecting*/
#define STR_DATEPMT	    53	/*date*/
#define STR_ERRORPMT	    54	/*error*/
#define STR_READINGCAL	    55	/*Reading calibration curve*/
#define STR_OFFSET	    56	/*Offset : */
#define STR_XTEST	    57	/*X2-Test:*/
#define STR_LIKELIHOOD      58  /*Likelihood*/
#define STR_AGREEMENT	    59	/*Agreement*/
#define STR_OVERAG	    61	/*Overall agreement*/
#define STR_DYNAMICAG	    62	/*Dynamic agreement*/
#define STR_UNDEFINED	    63	/*values undefined*/
#define STR_TOOLOW	    64	/*cannot resolve order (low)*/
#define STR_TOOHIGH	    65	/*cannot resolve order (high)*/
#define STR_USINGMCMC	    66	/*work.operation="MCMC";*/
#define STR_READINGFILES    67  /*reading in files*/
#define STR_INITIALISING    68	/*initialising*/
#define STR_FINDINDEX       69  /*finding indices*/
#define STR_DONE	    70	/*work.done=*/
#define STR_CONV	    71	/*work.convergence=*/
#define STR_RPTSTARTMCMC    72	/*( MCMC*/
#define STR_RPTENDMCMC	    73	/*) MCMC*/
#define STR_REPORTING	    74	/*reporting*/
#define STR_COLLAPSING	    75	/*collapsing arrays*/
#define STR_CALCSHIFT	    76	/*work.operation="Shift";*/
#define STR_CALCDIFF	    77	/*work.operation="Difference";*/
#define STR_PROGACTIVE	    78	/*Program active*/
#define STR_PROGWAIT	    79	/*Please wait\nuntil it has\nfinished*/
#define STR_PAGE            80	/*Page*/
#define STR_OF		    81  /*of*/
#define STR_TO		    82  /*to*/
#define STR_LINESREAD	    83	/*lines read*/
#define STR_CALCFACT        84  /*work.operation="Factor";*/
#define STR_ATEST	    85	/*Agreement test:*/
#define STR_OVERALL	    86  /*Overall*/
#define STR_PROBABILITY	    87	/*Probability*/
#define STR_SEEPLOT	    88  /*Plot file created : */
#define STR_DYNAMIC	    89  /*Dynamic*/
#define STR_CHECKINGCONV    90  /*checking convergence*/
#define STR_ABOUT	    91  /*Radiocarbon Calibration\nand Statistical Analysis Program*/
#define STR_COPYRIGHT	    92  /*(c) Copyright Christopher Bronk Ramsey 1995*/
#define STR_ADDRESS	    93  /*Research Lab for Archaeology\n6 Keble Rd\nOxford OX1 4JD*/
#define STR_OK		    94  /*work.ok=*/
#define STR_PASS	    95  /*work.passes=*/
#define STR_RESETLOG	    96  /*clear contents*/
#define STR_NORMPROB        97	/*Probability per year*/
#define STR_RELPROB	    98	/*Relative probability*/
#define STR_NONAME	    99	/*Undefined*/

#define STR_RPTPOSTTYPE	   101	/* */
#define STR_RPTPOSTNAME	   102	/* */
#define STR_RPTPREDATE	   103	/*: */
#define STR_RPTPM	   104	/*+/-*/
#define STR_RPTBP	   105	/*BP*/
#define STR_RPTRCBP	   106	/*BP*/
#define STR_RPTBC	   107	/*BC*/
#define STR_RPTAD	   108	/*AD*/
#define STR_RPTPREMULT	   109	/*\n*/
#define STR_RPTPRESINGLE   110	/* */
#define STR_RPTPREINF	   111	/*  */
#define STR_RPTCONF	   112	/*% probability\n*/
#define STR_RPTSIGMA	   113	/* sigma\n*/
#define STR_RPTPRERANGE	   114	/*    */
#define STR_RPTPREPROP	   115	/* (*/
#define STR_RPTPOSTPROP	   116	/*) */
#define STR_RPTNOPROP	   117	/*  */
#define STR_RPTNOLIMIT	   118	/*...*/
#define STR_RPTINTERRANGE  119	/*\n*/
#define STR_RPTENDRANGE	   120	/*\n*/
#define STR_RPTENDDIST	   121	/**/
#define STR_RPTBATSEP	   122  /*\t*/
#define STR_RPTBATINTER    123  /*\n*/
#define STR_RPTCALAD       124	/*CalAD*/
#define STR_RPTCALBC	   125	/*CalBC*/
#define STR_RPTBCAD		   126	/*BC/AD*/
#define STR_RPTCALBCAD     127	/*CalBC/CalAD*/
#define STR_RPTINFINITY    128	/*Ø*/
#define STR_RPTCALBP       129	/*CalBP*/

#define STR_OPTBCAD	   130	/*0 for BC/AD 1 for BP*/
#define STR_OPTTERSE	   131	/*0 for long prompt 1 for terse*/
#define STR_OPTLANG	   132	/*1 for macro language 0 for line input*/
#define STR_OPTSD	   133	/*1 to give range*/
#define STR_OPTWHOLE	   134	/*0 for split range 1 for whole range*/
#define STR_OPTPROB	   135	/*0 for intercept method 1 for probability*/
#define STR_OPTSIGN	   136	/*0 for 'BC' and 'AD' 1 for '+' and '-'*/
#define STR_OPTREP	   137	/*1 to save distributions*/
#define STR_OPTRPLOT	   138  /*1 to plot sequences in reverse order*/
#define STR_OPTRESOL	   139	/*calculation resolution*/
#define STR_OPTCUBIC	   140	/*0 for linear 1 for cubic interpolation*/
#define STR_OPTMAX	   141	/*limit of bp range*/
#define STR_OPTAPPEND	   142	/*filename   to append output to a file*/
#define STR_OPTWRITE	   143	/*filename   to write output to a file*/
#define STR_OPTREAD	   144	/*filename   to read input from a file*/
#define STR_OPTCAL	   145	/*filename   to use another calibration file*/
#define STR_OPTROUND	   146  /*1 to round ranges*/
#define STR_OPTUNISPAN	147	/*0 for old method 1 for uniform span prior*/
#define STR_OPTINCLCONV 148 /*1 to include convergence data in plot files*/
#define STR_ROPTNONUNISPAN    149  /*non-usp*/
#define STR_ROPTLINEAR	   150	/*lin*/
#define STR_ROPTCUBIC	   151	/*cub*/
#define STR_ROPTPROB	   152	/*prob*/
#define STR_ROPTINTER	   153	/*intr*/
#define STR_ROPTWHOLE	   154	/*whole*/
#define STR_ROPTRES	   155	/*r*/
#define STR_ROPTSD         156	/*sd*/
#define STR_ROPTUP	   157  /*strat*/
#define STR_ROPTDOWN       158  /*chron*/
#define STR_ROPTNONLIN	   159  /*inv_sq*/

#define STR_PRIOR		160	/*Calculated distributions*/
#define STR_POSTERIOR	161 /*Modelled distributions*/
#define STR_PRIORINT	162	/*Calculated intervals*/
#define STR_POSTINT		163	/*Modelled intervals*/
#define STR_INTERVALS	164	/*Intervals*/
#define STR_PLOTS		165 /*Plotted results*/
#define STR_ELEMENTS	166 /*Elements of*/
#define STR_OXCALDIR	167	/*Choose directory for OxCal output files*/

#define VERB_AGE	201 /*Age*/
#define	VERB_ANTE	202	/*Before*/
#define VERB_ARRAY  203 /*Array*/
#define	VERB_AXIS	204	/*Axis*/
#define	VERB_BOUND	205	/*Boundary*/
#define	VERB_CALC	206	/*Calculate*/
#define	VERB_CALEND	207	/*C_Date*/
#define	VERB_CCOMB	208	/*C_Combine*/
#define	VERB_COMB	209	/*Combine*/
#define	VERB_COMMENT	210	/*!*/
#define	VERB_CORRELM	211	/*Correl_Matrix*/
#define	VERB_CORREL	212	/*Correlation*/
#define	VERB_COVARM	213	/*Covar_Matrix*/
#define	VERB_CSIM	214	/*C_Simulate*/
#define	VERB_CURVE	215	/*Curve*/
#define	VERB_DATE	216	/*Date*/
#define	VERB_DELTAR	217	/*Delta_R*/
#define VERB_DEPTH  218 /*Depth_Model*/
#define	VERB_DIFF	219	/*Difference*/
#define	VERB_DSEQ	220	/*D_Sequence*/
#define	VERB_END	221 /*End*/
#define	VERB_ERROR	222	/*Error*/
#define	VERB_EVENT	223	/*Event*/
#define VERB_EXP	224 /*Exp*/
#define	VERB_FACT	225	/*Factor*/
#define	VERB_FILE	226	/*Prior*/
#define	VERB_FIRST	227	/*First*/
#define	VERB_GAP	228	/*Gap*/
#define VERB_KDEMODEL   229 /*KDE_Model*/
#define VERB_KDEPLOT    230 /*KDE_Plot*/
#define	VERB_LABEL	231	/*Label*/
#define	VERB_LAST	232	/*Last*/
#define	VERB_LINE	233	/*Line*/
#define VERB_LNN    234 /*LnN*/
#define VERB_MCMC	235 /*MCMC_Sample*/
#define	VERB_MIX	236	/*Mix_Curves*/
#define	VERB_NOOP	237	/*NoOp*/
#define VERB_NORMAL 238 /*N*/
#define VERB_NUMBER 239 /*Number*/
#define VERB_OBJECT 240 /*Object*/
#define	VERB_OFFS	241	/*Offset*/
#define	VERB_OPTION	242	/*Options*/
#define	VERB_ORDER	243	/*Order*/
#define VERB_P		244 /*P*/
#define	VERB_PAGE	245	/*Page*/
#define	VERB_PAUDATE	246	/*PaU_Date*/
#define	VERB_PAUSIM	247	/*PaU_Simulate*/
#define	VERB_PERIOD	248	/*Period*/
#define	VERB_PHASE	249	/*Phase*/
#define	VERB_PLOT	250	/*Plot*/
#define VERB_POIS	251 /*Pois*/
#define	VERB_POST	252 /*After*/
#define	VERB_PSEQ	253	/*P_Sequence*/
#define VERB_QMODEL 254 /*Outlier_Model*/
#define	VERB_QUEST	255	/*Outlier*/
#define	VERB_RAND	256	/*R_Simulate*/
#define	VERB_RANG	257	/*Interval*/
#define	VERB_RCOMB	258	/*R_Combine*/
#define	VERB_F14C	259	/*R_F14C*/
#define	VERB_RDATE	260	/*R_Date*/
#define	VERB_RESERV	261	/*Reservoir*/
#define	VERB_SAMP	262	/*Posterior*/
#define	VERB_SAMPLE	263	/*Sample*/
#define VERB_SAP    264 /*Sapwood*/
#define	VERB_SEQ	265	/*Sequence*/
#define VERB_SHAPE  266 /*Shape*/
#define	VERB_SHIFT	267	/*Shift*/
#define	VERB_SIGMA	268	/*Sigma_Boundary*/
#define VERB_SMODEL 269 /*Sapwood_Model*/
#define	VERB_SPAN	270	/*Span*/
#define VERB_START	271 /*Start*/
#define	VERB_SUM	272	/*Sum*/
#define	VERB_T		273	/*T*/
#define	VERB_TAQ	274	/*TAQ*/
#define	VERB_TAU	275	/*Tau_Boundary*/
#define	VERB_THUDATE	276 /*ThU_Date*/
#define	VERB_THUSIM	277	/*ThU_Simulate*/
#define VERB_TOPHAT 278 /*Top_Hat*/
#define	VERB_TPQ	279	/*TPQ*/
#define VERB_TRANS	280 /*Transition*/
#define VERB_U		281	/*U*/
#define	VERB_USEQ	282	/*U_Sequence*/
#define VERB_VALUE	283 /*Probability*/
#define	VERB_VSEQ	284	/*V_Sequence*/
#define	VERB_XREF	285	/*XReference*/
#define	VERB_ZERO	286	/*Zero_Boundary*/

#define FILT_CALIB	   330	/*Calibration data files (*.14c,*.dta)|*.14c; *.dta||*/
#define FILT_RUNALL	   331	/*Run files (*.14i)|*.14i|All files (*.*)|*.*||*/
#define FILT_LOGALL	   332	/*Log files (*.14l)|*.14l|All files (*.*)|*.*||*/
#define FILT_PLOT	   333	/*Plot files (*.14p)|*.14p|*/
#define FILT_DATASAMP	   334	/*Data files (*.14d)|*.14d|Sample files (*.14s)|*.14s||*/
#define FILT_END	   335	/*|*/
#define FILT_ALL	   336	/*All files|*.*||*/
#define FILT_PERIOD        337  /*Periods (*.htm)|*.htm||*/
#define FILT_EXE	   338  /*Executables (*.exe)|*.exe||*/

#define ERR_INFORM	   350	/*i : */
#define ERR_WARN	   351	/*Warning! */
#define ERR_FATAL	   352	/*Fatal Error! */
#define ERR_OPTIONSSAVED   353	/*Options Saved*/
#define ERR_COMMACTIVE	   354	/*Command line active*/
#define ERR_EXITHELP	   355	/*(exit with '}')*/
#define ERR_PROGACTIVE	   356	/*Program active*/
#define ERR_PLEASEWAIT	   357	/*please wait*/
#define ERR_CALCULATED	   358	/*Already Calculated*/
#define ERR_CALCHELP	   359	/*choose Alter data option*/
#define ERR_PLOTONLY	   360	/*Plot only window*/
#define ERR_WINDACTIVE	   361	/*Window active*/
#define ERR_NOTDATE	   362	/*Not a date*/
#define ERR_NOTCAL	   363	/*Not a calendar date*/
#define ERR_NOTRC	   364	/*Not a radiocarbon date*/
#define ERR_BADCOMMAND	   365	/*Inappropriate command*/
#define ERR_DUPLICATES	   366	/*Duplicate names found*/
#define ERR_EDITHELP	   367	/*please edit*/
#define ERR_SUBSID	   368	/*Subsidiary window*/
#define ERR_SUBSIDHELP	   369	/*close and calculate parent*/
#define ERR_FILENOTCALSAM  370	/*Wrong file type (.14d, .14s)*/
#define ERR_WRONGFILE	   371	/*Wrong file type (.14d, .14s, .14p)*/
#define ERR_FILENOTFOUND   372	/*File not found*/
#define ERR_MEMCAL	   373	/*Not enough memory for calibration curve arrays*/
#define ERR_MEMARRAY	   374	/*Not enough memory for working arrays*/
#define ERR_REFERENCES	   375	/*Ref*/
#define ERR_OUTOFRANGE	   376	/*Date out of range*/
#define ERR_NEAREND	   377	/*Date may extend out of range*/
#define ERR_PROBOUT	   378	/*Date probably out of range*/
#define ERR_BADNEST	   379	/*Inappropriate nesting*/
#define ERR_NESTEDIN	   380	/*into*/
#define ERR_SETTO	   381	/*set to*/
#define ERR_BADGAP	   382	/*Inappropriate gap error*/
#define ERR_NEGATIVE	   383	/*Negative value*/
#define ERR_MADEPOS	   384	/*forced positive*/
#define ERR_NOPARMS	   385	/*Parameters not found*/
#define ERR_DUPLNAMES	   386	/*Duplicate names*/
#define ERR_DUPLNAMESGRP   387	/*Duplicate names found in group*/
#define ERR_NOFILESFOR	   388	/*Files not found for*/
#define ERR_NOGIBBSNOS     389  /*Numbers not found*/
#define ERR_RELATION	   390	/*Error in relation*/
#define ERR_GAPCONFLICT	   391	/*Conflicting gaps used with a reference*/
#define ERR_ASSUMEGAP	   392	/*assuming gap for*/
#define ERR_TOOMANY   393  /*Max number of distributions exceeded*/
#define ERR_NOREL	   394	/*Cannot find relationship*/
#define ERR_SELFREL	   395	/*Self referential relationship*/
#define ERR_RANGEUNCERTAIN 396	/*Cannot be sure of range*/
#define ERR_NORANGE	   397	/*Cannot find range*/
#define ERR_GIBBSCOMPLETE  398	/*MCMC sample completed*/
#define ERR_GIBBSFAIL	   399	/*MCMC sample failed*/
#define ERR_GIBBSTERM	   400	/*MCMC sample terminated*/
#define ERR_GIBBSABORT	   401	/*MCMC sample aborted*/
#define ERR_ITUSED	   402	/*iterations used*/
#define ERR_DISTNULL	   403	/*NULL distribution*/
#define ERR_DISTZERO	   404	/*ZERO distribution*/
#define ERR_NORANGECALC	   405	/*Not calculating range*/
#define ERR_XESTIMATED	   406	/*X-Test value estimated*/
#define ERR_XFAILS	   407	/*X-Test fails at 5%*/
#define ERR_NOHELP	   408	/*Help file not found*/
#define ERR_NOTRENAMED	   409	/*File not renamed to*/
#define ERR_NOTOPENNED	   410	/*Unable to open*/
#define ERR_NODATA	   411	/*No data found*/
#define ERR_NOMAKE	   412	/*Cannot make array*/
#define ERR_FUNCREDEF      414  /*Value for function redefined*/
#define ERR_NOEXTRACT      415  /*Cannot extract numerical data*/
#define ERR_AFAILS         416  /*Poor agreement*/
#define ERR_BEYONDRANGE	   417  /*Number out of range*/
#define ERR_INCREASERES    418  /*make system resolution coarser*/
#define ERR_RESCHANGED     419  /*System resolution changed to*/
#define ERR_POORCONV	   420  /*Poor convergence reported in*/
#define ERR_MANYPLOTS	   421	/*Large number of plots*/
#define ERR_NONLINEAR	   422	/*Only possible for linear modelling*/
#define ERR_NONLINRES	   423	/*Incompatable non-linear resolution*/
#define ERR_DUPLBOUND      424  /*Confused boundary setup*/
#define ERR_NOBOUNDARIES   425  /*No boundaries used - check manual*/
#define ERR_XREFBOUND      426  /*Extensive use of cross referenced boundaries can cause problems*/
#define ERR_CURVEDEFINED   427	/*Curve already defined - cannot set Delta_R or Reservoir*/
#define ERR_NONGLOBALOPTIONS  428  /*Options can only be set globally*/
#define ERR_ORDERPROBLEM	429	/*Cannot resolve order*/
#define ERR_MODELPROBLEM	430 /*Model not supported in this context*/
#define ERR_ASSIGNCONFLICT	431 /*Assignement conflict*/
#define ERR_NOOUTLIERMODEL	432 /*No outlier model specified - use Outlier_Model()*/
#define ERR_NOVALUE			433 /*Cannot determine value*/
#define ERR_CONSTRAINT		434 /*Cannot apply constraint*/
#define ERR_FUNCNOTFOUND    435 /*Function not found*/

#define VERB_OLDCALEND	450	/*cal*/
#define VERB_OLDDATE	451	/*date*/
#define VERB_OLDFILE	452	/*file*/
#define VERB_OLDRAND	453	/*rand*/
#define VERB_OLDASYM	454	/*asym*/
#define VERB_OLDQUEST	455 /*question*/

#define FILE_CALHELP	   463	/*OXCAL.HLP*/
#define FILE_OPT	   464	/*OxCal.dat*/
#define FILE_LAUNCH	   466	/*OxCalLaunch.dat*/
#define FILE_CALIB	   470  /*intcal20.14c*/
#define FILE_NONAME	   472  /*Untitled*/
#define FILE_DATADIR   473	/*\\Data\\*/
#define FILE_MANUALDIR 474  /*\\Manual\\*/
#define FILE_PREAMBLE  475  /*Preamble.txt*/
#define FILE_POSTAMBLE 476  /*Postamble.txt*/
#define FILE_RELFILE   477  /*OxCal.rel*/
#define FILE_TABFILE   478  /*OxCalTab.txt*/

#define EXT_WORK 	   481	/*.work*/
#define EXT_PRIOR	   482	/*.prior*/
#define EXT_LOG 	   485	/*.log*/
#define EXT_GRN		   486  /*.dta*/
#define EXT_SEAT	   487  /*.14c*/
#define EXT_EXE        488  /*.exe*/
#define EXT_JS		   489  /*.js*/
#define EXT_TXT        490  /*.txt*/
#define EXT_CSV		   491	/*.csv*/
#define EXT_PATH	   492  /*Path.dat*/

#define OPT_CURVE			500	/*Curve*/
#define OPT_CUBIC			501 /*Cubic*/
#define OPT_BCAD			502 /*BCAD*/
#define OPT_PLUSMINUS		503 /*PlusMinus*/
#define OPT_USP				504 /*UniformSpanPrior*/
#define OPT_USPL			505 /*UniformSpanLimits*/
#define OPT_USPG			506 /*UniformSpanGroups*/
#define OPT_KITERATIONS		507	/*kIterations*/
#define OPT_SD1				508 /*SD1*/
#define OPT_SD2				509 /*SD2*/
#define OPT_SD3				510 /*SD3*/
#define OPT_ROUND			511	/*Round*/
#define OPT_ROUNDBY			512 /*RoundBy*/
#define OPT_FLORUIT			513 /*Floruit*/
#define OPT_RESOLUTION		514	/*Resolution*/
#define OPT_CONVERGENCE		515 /*ConvergenceData*/
#define OPT_YEAR			516 /*Year*/
#define OPT_RAW				517 /*RawData*/
#define OPT_F14C			518 /*UseF14C*/
#define OPT_INTERCEPT		519 /*Intercept*/
#define OPT_ENSEMBLES       520 /*Ensembles*/
#define OPT_END				521 /**/

#define JS_LIKELIHOOD		580 /*likelihood*/
#define JS_POSTERIOR		581 /*posterior*/

#define HELP_AGE	601 /*Age type conversion*/
#define	HELP_ANTE	602	/*Probability of preceding*/
#define HELP_ARRAY  603 /*Data array*/
#define	HELP_AXIS	604	/*Axis limits*/
#define	HELP_BOUND	605	/*Phase boundary*/
#define	HELP_CALC	606	/*Pre-calculate*/
#define	HELP_CALEND	607	/*Calendar date*/
#define	HELP_CCOMB	608	/*Combine calendar dates*/
#define	HELP_COMB	609	/*Combine probabilities*/
#define	HELP_COMMENT		610	/*Comment*/
#define	HELP_CORRELM	611	/*Correlation Matrix*/
#define	HELP_CORREL	612	/*Correlation Plot*/
#define	HELP_COVARM	613	/*Covariance Matrix*/
#define	HELP_CSIM	614	/*Simulate calendar date*/
#define	HELP_CURVE	615	/*Radiocarbon calibration curve*/
#define	HELP_DATE	616	/*Date type conversion*/
#define	HELP_DELTAR	617	/*Delta-R reservoir shift*/
#define HELP_DEPTH	618 /*Depth model interpolation*/
#define	HELP_DIFF	619	/*Age difference*/
#define	HELP_DSEQ	620	/*Defined sequence*/
#define HELP_END	621 /*End of a transition*/
#define	HELP_ERROR	622	/*Age error*/
#define	HELP_EVENT	623	/*Undated event*/
#define	HELP_EXP	624	/*Exponential distribution*/
#define	HELP_FACT	625	/*Age factor*/
#define	HELP_FILE	626	/*Prior distribution*/
#define	HELP_FIRST	627	/*First of a group*/
#define	HELP_GAP	628	/*Gap between/after*/
#define	HELP_KDEMODEL	629	/*KDE model*/
#define	HELP_KDEPLOT	630	/*KDE plot*/
#define	HELP_LABEL	631	/*Text label*/
#define	HELP_LAST	632	/*End of a group*/
#define	HELP_LINE	633	/*Line*/
#define HELP_LNN    634 /*Ln Normal distribution*/
#define HELP_MCMC	635 /*MCMC Samples written to file*/
#define	HELP_MIX	636	/*Mix radiocarbon calibration curves*/
#define	HELP_NOOP	637	/*Null operation*/
#define HELP_NORMAL	638 /*Normal distribution*/
#define HELP_NUMBER 639 /*Number type conversion*/
#define HELP_OBJECT 640 /*Data object*/
#define	HELP_OFFS	641	/*Offset*/
#define	HELP_OPTION	642	/*Program options*/
#define	HELP_ORDER	643	/*Find event order*/
#define HELP_P		644 /*Probability distribution*/
#define	HELP_PAGE	645	/*New page*/
#define	HELP_PAUDATE	646	/*PaU U-series date*/
#define	HELP_PAUSIM	647	/*Simulate PaU U-series date*/
#define	HELP_PERIOD	648	/*Period information*/
#define	HELP_PHASE	649	/*Unordered group*/
#define	HELP_PLOT	650	/*Plot group*/
#define HELP_POIS	651 /*Poisson distribution*/
#define	HELP_POST	652	/*Probability of following*/
#define	HELP_PSEQ	653	/*Poisson distributed sequence*/
#define	HELP_QMODEL	654	/*Outlier model*/
#define	HELP_QUEST	655	/*Question an event*/
#define	HELP_RAND	656	/*Simulate radiocarbon date*/
#define	HELP_RANG	657	/*Interval*/
#define	HELP_RCOMB	658	/*Combine radiocarbon dates*/
#define	HELP_RDATE	659	/*Radiocarbon date*/
#define	HELP_F14C	660	/*Radiocarbon fraction modern*/
#define	HELP_RESERV	661	/*Reservoir time constant*/
#define	HELP_SAMP	662	/*Sampled distribution*/
#define	HELP_SAMPLE	663	/*Sample from a distribution*/
#define HELP_SAP    664 /*Sapwood estimated date*/
#define	HELP_SEQ	665	/*Ordered group*/
#define HELP_SHAPE	666 /*Shape of boundary transition*/
#define	HELP_SHIFT	667	/*Date A shifted by B*/
#define	HELP_SIGMA	668	/*1 sigma boundary*/
#define	HELP_SMODEL	669	/*Sapwood model*/
#define	HELP_SPAN	670	/*Span of a group*/
#define HELP_START	671 /*Start of a transition*/
#define	HELP_SUM	672	/*Sum probabilities*/
#define	HELP_T		673	/*T-Distribution*/
#define	HELP_TAQ	674	/*Terminus Ante Quem*/
#define	HELP_TAU	675	/*Exponential time constant boundary*/
#define	HELP_THUDATE	676	/*ThU U-series date*/
#define	HELP_THUSIM	677	/*Simulate ThU U-series date*/
#define HELP_TOPHAT 678 /*Top hat distribution*/
#define	HELP_TPQ	679	/*Terminus Post Quem*/
#define HELP_TRANS	680 /*Duration of event*/
#define HELP_U		681 /*Uniform probability distribution*/
#define	HELP_USEQ	682	/*Uniform deposition sequence*/
#define HELP_VALUE	683	/*Probability of a specific value*/
#define	HELP_VSEQ	684	/*Variable sequence*/
#define	HELP_XREF	685	/*Cross reference*/
#define	HELP_ZERO	686	/*Zero level phase boundary*/



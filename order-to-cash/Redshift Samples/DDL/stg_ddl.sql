--**

CREATE schema stg;

CREATE TABLE stg.lis_11_vahdr (
    rocancel character varying(2) ENCODE lzo,
    vbeln character varying(20) ENCODE lzo,
    angdt character varying(256) ENCODE lzo,
    auart character varying(256) ENCODE lzo,
    augru character varying(256) ENCODE lzo,
    bnddt character varying(256) ENCODE lzo,
    bukrs character varying(8) ENCODE lzo,
    erdat character varying(8) ENCODE lzo,
    faksk character varying(256) ENCODE lzo,
    hwaer character varying(256) ENCODE lzo,
    kunnr character varying(256) ENCODE lzo,
    kurst character varying(256) ENCODE lzo,
    kvgr1 character varying(256) ENCODE lzo,
    kvgr2 character varying(256) ENCODE lzo,
    kvgr3 character varying(256) ENCODE lzo,
    kvgr4 character varying(256) ENCODE lzo,
    kvgr5 character varying(256) ENCODE lzo,
    lifsk character varying(256) ENCODE lzo,
    fkart character varying(8) ENCODE lzo,
    stwae character varying(256) ENCODE lzo,
    vbtyp character varying(8) ENCODE lzo,
    vdatu character varying(256) ENCODE lzo,
    vkbur character varying(256) ENCODE lzo,
    vkgrp character varying(256) ENCODE lzo,
    vkorg character varying(256) ENCODE lzo,
    vtweg character varying(256) ENCODE lzo,
    waerk character varying(10) ENCODE lzo,
    spara character varying(256) ENCODE lzo,
    vgtyp_ak character varying(256) ENCODE lzo,
    anzau character varying(256) ENCODE lzo,
    periv character varying(4) ENCODE lzo,
    odq_changemode character varying(2) ENCODE lzo,
    odq_entitycntr integer ENCODE az64
) DISTSTYLE AUTO;

CREATE TABLE stg.LIS_11_VAITM (ROCANCEL VARCHAR(2),
VBELN VARCHAR(20),
ABSTA VARCHAR(2),
POSNR VARCHAR(12),
UVALL VARCHAR(2),
UVFAK VARCHAR(2),
UVPRS VARCHAR(2),
UVVLK VARCHAR(2),
ANGDT VARCHAR(8),
AUART VARCHAR(8),
AUGRU VARCHAR(6),
BNDDT VARCHAR(8),
BUKRS VARCHAR(8),
FAKSK VARCHAR(4),
HWAER VARCHAR(10),
KUNNR VARCHAR(20),
KURST VARCHAR(8),
KVGR1 VARCHAR(6),
KVGR2 VARCHAR(6),
KVGR3 VARCHAR(6),
KVGR4 VARCHAR(6),
KVGR5 VARCHAR(6),
LIFSK VARCHAR(4),
STWAE VARCHAR(10),
VBTYP VARCHAR(8),
VKBUR VARCHAR(8),
VKGRP VARCHAR(6),
VKORG VARCHAR(8),
VTWEG VARCHAR(4),
ABGRU VARCHAR(4),
AEDAT VARCHAR(8),
AWAHR NUMERIC(8,2),
BRGEW NUMERIC(11,3),
BWAPPLNM VARCHAR(60),
BWVORG VARCHAR(6),
CHARG VARCHAR(20),
CMKUA NUMERIC(7,5),
EAN11 VARCHAR(36),
ERDAT VARCHAR(8),
ERNAM VARCHAR(24),
ERZET VARCHAR(26),
FAKSP VARCHAR(4),
GEWEI VARCHAR(6),
KBMENG NUMERIC(11,3),
KLMENG NUMERIC(11,3),
KMEIN VARCHAR(6),
KNUMA_AG VARCHAR(20),
KPEIN NUMERIC(6,3),
KWMENG NUMERIC(11,3),
KZWI1 NUMERIC(11,2),
KZWI2 NUMERIC(11,2),
KZWI3 NUMERIC(11,2),
KZWI4 NUMERIC(11,2),
KZWI5 NUMERIC(11,2),
KZWI6 NUMERIC(11,2),
LFMNG NUMERIC(7,3),
LGORT VARCHAR(8),
LSMENG NUMERIC(11,3),
MATKL VARCHAR(18),
MATNR VARCHAR(80),
MATWA VARCHAR(80),
MEINS VARCHAR(6),
MVGR1 VARCHAR(6),
MVGR2 VARCHAR(6),
MVGR3 VARCHAR(6),
MVGR4 VARCHAR(6),
MVGR5 VARCHAR(6),
MWSBP NUMERIC(9,2),
NETPR NUMERIC(11,2),
NETWR NUMERIC(11,2),
NTGEW NUMERIC(11,3),
PABLA VARCHAR(50),
PKUNRE VARCHAR(20),
PKUNRG VARCHAR(20),
PKUNWE VARCHAR(20),
PRODH VARCHAR(36),
PSPDNR VARCHAR(20),
PSTYV VARCHAR(8),
PVRTNR VARCHAR(16),
ROUTE VARCHAR(12),
SOBKZ VARCHAR(2),
SPART VARCHAR(4),
STADAT VARCHAR(8),
STCUR NUMERIC(12,5),
SUGRD VARCHAR(8),
UEBTK VARCHAR(2),
UEBTO NUMERIC(2,1),
UMVKN NUMERIC(6,3),
UMVKZ NUMERIC(6,3),
UMZIN NUMERIC(6,3),
UMZIZ NUMERIC(6,3),
UNTTO NUMERIC(2,1),
VDATU VARCHAR(8),
VGBEL VARCHAR(20),
VGPOS VARCHAR(12),
VGTYP VARCHAR(8),
VOLEH VARCHAR(6),
VOLUM NUMERIC(11,3),
VRKME VARCHAR(6),
VSTEL VARCHAR(8),
WAERK VARCHAR(10),
WAVWR NUMERIC(11,2),
WERKS VARCHAR(8),
ZIEME VARCHAR(6),
ZMENG NUMERIC(7,3),
ZWERT NUMERIC(9,2),
BZIRK VARCHAR(12),
FBUDA VARCHAR(8),
FKDAT VARCHAR(8),
INCO1 VARCHAR(6),
INCO2 VARCHAR(56),
KDGRP VARCHAR(4),
KTGRD VARCHAR(4),
KURSK NUMERIC(12,5),
KURSK_DAT VARCHAR(8),
PRSDT VARCHAR(8),
WAKTION VARCHAR(20),
WMINR VARCHAR(20),
WAERK_VBAK VARCHAR(10),
SPARA VARCHAR(4),
VGTYP_AK VARCHAR(8),
PS_POSID VARCHAR(48),
ANZAUPO NUMERIC(12,5),
PERIV VARCHAR(4),
MCEX_APCAMPAIGN VARCHAR(64),
APOPLANNED VARCHAR(2),
MCBW_NETPR_AVKM NUMERIC(11,2),
ODQ_CHANGEMODE VARCHAR,
ODQ_ENTITYCNTR NUMERIC(18,2));

CREATE TABLE stg.matr_attr (
    mandt character varying(3) ENCODE lzo,
    matnr character varying(40) ENCODE lzo,
    ersda date ENCODE az64,
    ernam character varying(12) ENCODE lzo,
    laeda date ENCODE az64,
    aenam character varying(12) ENCODE lzo,
    vpsta character varying(15) ENCODE lzo,
    pstat character varying(15) ENCODE lzo,
    lvorm character varying(1) ENCODE lzo,
    mtart character varying(4) ENCODE lzo,
    mbrsh character varying(1) ENCODE lzo,
    matkl character varying(9) ENCODE lzo,
    bismt character varying(40) ENCODE lzo,
    meins character varying(3) ENCODE lzo,
    bstme character varying(3) ENCODE lzo,
    zeinr character varying(22) ENCODE lzo,
    zeiar character varying(3) ENCODE lzo,
    zeivr character varying(2) ENCODE lzo,
    zeifo character varying(4) ENCODE lzo,
    aeszn character varying(6) ENCODE lzo,
    blatt character varying(3) ENCODE lzo,
    blanz integer ENCODE az64,
    ferth character varying(18) ENCODE lzo,
    formt character varying(4) ENCODE lzo,
    groes character varying(32) ENCODE lzo,
    wrkst character varying(48) ENCODE lzo,
    normt character varying(18) ENCODE lzo,
    labor character varying(3) ENCODE lzo,
    ekwsl character varying(4) ENCODE lzo,
    brgew numeric(16, 3) ENCODE az64,
    ntgew numeric(16, 3) ENCODE az64,
    gewei character varying(3) ENCODE lzo,
    volum numeric(16, 3) ENCODE az64,
    voleh character varying(3) ENCODE lzo,
    behvo character varying(2) ENCODE lzo,
    raube character varying(2) ENCODE lzo,
    tempb character varying(2) ENCODE lzo,
    disst character varying(3) ENCODE lzo,
    tragr character varying(4) ENCODE lzo,
    stoff character varying(40) ENCODE lzo,
    spart character varying(2) ENCODE lzo,
    kunnr character varying(10) ENCODE lzo,
    eannr character varying(13) ENCODE lzo,
    wesch numeric(16, 3) ENCODE az64,
    bwvor character varying(1) ENCODE lzo,
    bwscl character varying(1) ENCODE lzo,
    saiso character varying(4) ENCODE lzo,
    etiar character varying(2) ENCODE lzo,
    etifo character varying(2) ENCODE lzo,
    entar character varying(1) ENCODE lzo,
    ean11 character varying(18) ENCODE lzo,
    numtp character varying(2) ENCODE lzo,
    laeng numeric(16, 3) ENCODE az64,
    breit numeric(16, 3) ENCODE az64,
    hoehe numeric(16, 3) ENCODE az64,
    meabm character varying(3) ENCODE lzo,
    prdha character varying(18) ENCODE lzo,
    aeklk character varying(1) ENCODE lzo,
    cadkz character varying(1) ENCODE lzo,
    qmpur character varying(1) ENCODE lzo,
    ergew numeric(16, 3) ENCODE az64,
    ergei character varying(3) ENCODE lzo,
    ervol numeric(16, 3) ENCODE az64,
    ervoe character varying(3) ENCODE lzo,
    gewto numeric(4, 1) ENCODE az64,
    volto numeric(4, 1) ENCODE az64,
    vabme character varying(1) ENCODE lzo,
    kzrev character varying(1) ENCODE lzo,
    kzkfg character varying(1) ENCODE lzo,
    xchpf character varying(1) ENCODE lzo,
    vhart character varying(4) ENCODE lzo,
    fuelg numeric(6, 3) ENCODE az64,
    stfak bigint ENCODE az64,
    magrv character varying(4) ENCODE lzo,
    begru character varying(4) ENCODE lzo,
    datab date ENCODE az64,
    liqdt date ENCODE az64,
    saisj character varying(4) ENCODE lzo,
    plgtp character varying(2) ENCODE lzo,
    mlgut character varying(1) ENCODE lzo,
    extwg character varying(18) ENCODE lzo,
    satnr character varying(40) ENCODE lzo,
    attyp character varying(2) ENCODE lzo,
    kzkup character varying(1) ENCODE lzo,
    kznfm character varying(1) ENCODE lzo,
    pmata character varying(40) ENCODE lzo,
    mstae character varying(2) ENCODE lzo,
    mstav character varying(2) ENCODE lzo,
    mstde date ENCODE az64,
    mstdv date ENCODE az64,
    taklv character varying(1) ENCODE lzo,
    rbnrm character varying(9) ENCODE lzo,
    mhdrz numeric(8, 4) ENCODE az64,
    mhdhb numeric(8, 4) ENCODE az64,
    mhdlp numeric(6, 3) ENCODE az64,
    inhme character varying(3) ENCODE lzo,
    inhal numeric(16, 3) ENCODE az64,
    vpreh numeric(10, 5) ENCODE az64,
    etiag character varying(18) ENCODE lzo,
    inhbr numeric(16, 3) ENCODE az64,
    cmeth character varying(1) ENCODE lzo,
    cuobf character varying(18) ENCODE lzo,
    kzumw character varying(1) ENCODE lzo,
    kosch character varying(18) ENCODE lzo,
    sprof character varying(1) ENCODE lzo,
    nrfhg character varying(1) ENCODE lzo,
    mfrpn character varying(40) ENCODE lzo,
    mfrnr character varying(10) ENCODE lzo,
    bmatn character varying(40) ENCODE lzo,
    mprof character varying(4) ENCODE lzo,
    kzwsm character varying(1) ENCODE lzo,
    saity character varying(2) ENCODE lzo,
    profl character varying(3) ENCODE lzo,
    ihivi character varying(1) ENCODE lzo,
    iloos character varying(1) ENCODE lzo,
    serlv character varying(1) ENCODE lzo,
    kzgvh character varying(1) ENCODE lzo,
    xgchp character varying(1) ENCODE lzo,
    kzeff character varying(1) ENCODE lzo,
    compl character varying(2) ENCODE lzo,
    iprkz character varying(1) ENCODE lzo,
    rdmhd character varying(1) ENCODE lzo,
    przus character varying(1) ENCODE lzo,
    mtpos_mara character varying(4) ENCODE lzo,
    bflme character varying(1) ENCODE lzo,
    cwm_xcwmat character varying(1) ENCODE lzo,
    cwm_valum character varying(3) ENCODE lzo,
    cwm_tolgr character varying(9) ENCODE lzo,
    cwm_tara character varying(1) ENCODE lzo,
    cwm_tarum character varying(3) ENCODE lzo,
    matnr_ext character varying(40) ENCODE lzo,
    matnr_vers character varying(10) ENCODE lzo,
    matnr_sel character varying(51) ENCODE lzo,
    nsnid character varying(9) ENCODE lzo,
    color_atinn character varying(10) ENCODE lzo,
    size1_atinn character varying(10) ENCODE lzo,
    size2_atinn character varying(10) ENCODE lzo,
    color character varying(18) ENCODE lzo,
    size1 character varying(18) ENCODE lzo,
    size2 character varying(18) ENCODE lzo,
    free_char character varying(18) ENCODE lzo,
    care_code character varying(16) ENCODE lzo,
    brand_id character varying(4) ENCODE lzo,
    fiber_code1 character varying(3) ENCODE lzo,
    fiber_part1 numeric(6, 3) ENCODE az64,
    fiber_code2 character varying(3) ENCODE lzo,
    fiber_part2 numeric(6, 3) ENCODE az64,
    fiber_code3 character varying(3) ENCODE lzo,
    fiber_part3 numeric(6, 3) ENCODE az64,
    fiber_code4 character varying(3) ENCODE lzo,
    fiber_part4 numeric(6, 3) ENCODE az64,
    fiber_code5 character varying(3) ENCODE lzo,
    fiber_part5 numeric(6, 3) ENCODE az64,
    rpa_wgh1 character varying(18) ENCODE lzo,
    rpa_wgh2 character varying(18) ENCODE lzo,
    rpa_wgh3 character varying(18) ENCODE lzo,
    rpa_wgh4 character varying(18) ENCODE lzo,
    fashgrd character varying(4) ENCODE lzo,
    odq_changemode character varying(2) ENCODE lzo,
    odq_entitycntr numeric(5, 2) ENCODE az64
) DISTSTYLE AUTO;

CREATE TABLE stg.customer_attr (
    mandt character varying(3) ENCODE lzo,
    kunnr character varying(10) ENCODE lzo,
    adrnr character varying(10) ENCODE lzo,
    anred character varying(15) ENCODE lzo,
    aufsd character varying(2) ENCODE lzo,
    bahne character varying(50) ENCODE lzo,
    bahns character varying(50) ENCODE lzo,
    bbbnr character varying(7) ENCODE lzo,
    bbsnr character varying(5) ENCODE lzo,
    begru character varying(4) ENCODE lzo,
    brsch character varying(4) ENCODE lzo,
    bubkz character varying(1) ENCODE lzo,
    datlt character varying(14) ENCODE lzo,
    erdat date ENCODE az64,
    ernam character varying(12) ENCODE lzo,
    exabl character varying(1) ENCODE lzo,
    faksd character varying(2) ENCODE lzo,
    fiskn character varying(10) ENCODE lzo,
    knazk character varying(2) ENCODE lzo,
    knrza character varying(10) ENCODE lzo,
    konzs character varying(10) ENCODE lzo,
    ktokd character varying(4) ENCODE lzo,
    kukla character varying(2) ENCODE lzo,
    land1 character varying(3) ENCODE lzo,
    lifnr character varying(10) ENCODE lzo,
    lifsd character varying(2) ENCODE lzo,
    locco character varying(10) ENCODE lzo,
    loevm character varying(1) ENCODE lzo,
    name1 character varying(35) ENCODE lzo,
    name2 character varying(35) ENCODE lzo,
    name3 character varying(35) ENCODE lzo,
    name4 character varying(35) ENCODE lzo,
    niels character varying(2) ENCODE lzo,
    ort01 character varying(35) ENCODE lzo,
    ort02 character varying(35) ENCODE lzo,
    pfach character varying(10) ENCODE lzo,
    pstl2 character varying(10) ENCODE lzo,
    pstlz character varying(10) ENCODE lzo,
    regio character varying(3) ENCODE lzo,
    counc character varying(3) ENCODE lzo,
    cityc character varying(4) ENCODE lzo,
    rpmkr character varying(5) ENCODE lzo,
    sortl character varying(10) ENCODE lzo,
    sperr character varying(1) ENCODE lzo,
    spras character varying(1) ENCODE lzo,
    stcd1 character varying(16) ENCODE lzo,
    stcd2 character varying(11) ENCODE lzo,
    stkza character varying(1) ENCODE lzo,
    stkzu character varying(1) ENCODE lzo,
    stras character varying(35) ENCODE lzo,
    telbx character varying(15) ENCODE lzo,
    telf1 character varying(16) ENCODE lzo,
    telf2 character varying(16) ENCODE lzo,
    telfx character varying(31) ENCODE lzo,
    teltx character varying(30) ENCODE lzo,
    telx1 character varying(30) ENCODE lzo,
    lzone character varying(10) ENCODE lzo,
    xcpdk character varying(1) ENCODE lzo,
    xzemp character varying(1) ENCODE lzo,
    vbund character varying(6) ENCODE lzo,
    stceg character varying(20) ENCODE lzo,
    dear1 character varying(1) ENCODE lzo,
    dear2 character varying(1) ENCODE lzo,
    dear3 character varying(1) ENCODE lzo,
    dear4 character varying(1) ENCODE lzo,
    dear5 character varying(1) ENCODE lzo,
    dear6 character varying(1) ENCODE lzo,
    gform character varying(2) ENCODE lzo,
    bran1 character varying(10) ENCODE lzo,
    bran2 character varying(10) ENCODE lzo,
    bran3 character varying(10) ENCODE lzo,
    bran4 character varying(10) ENCODE lzo,
    bran5 character varying(10) ENCODE lzo,
    ekont character varying(10) ENCODE lzo,
    umsat numeric(10, 2) ENCODE az64,
    umjah character varying(4) ENCODE lzo,
    uwaer character varying(5) ENCODE lzo,
    jmzah integer ENCODE az64,
    jmjah character varying(4) ENCODE lzo,
    katr1 character varying(2) ENCODE lzo,
    katr2 character varying(2) ENCODE lzo,
    katr3 character varying(2) ENCODE lzo,
    katr4 character varying(2) ENCODE lzo,
    katr5 character varying(2) ENCODE lzo,
    katr6 character varying(3) ENCODE lzo,
    katr7 character varying(3) ENCODE lzo,
    katr8 character varying(3) ENCODE lzo,
    katr9 character varying(3) ENCODE lzo,
    katr10 character varying(3) ENCODE lzo,
    stkzn character varying(1) ENCODE lzo,
    umsa1 numeric(17, 2) ENCODE az64,
    txjcd character varying(15) ENCODE lzo,
    mcod1 character varying(50) ENCODE lzo,
    mcod2 character varying(50) ENCODE lzo,
    mcod3 character varying(50) ENCODE lzo,
    periv character varying(2) ENCODE lzo,
    abrvw character varying(3) ENCODE lzo,
    inspbydebi character varying(1) ENCODE lzo,
    inspatdebi character varying(1) ENCODE lzo,
    ktocd character varying(4) ENCODE lzo,
    pfort character varying(35) ENCODE lzo,
    werks character varying(4) ENCODE lzo,
    dtams character varying(1) ENCODE lzo,
    dtaws character varying(2) ENCODE lzo,
    duefl character varying(1) ENCODE lzo,
    hzuor character varying(2) ENCODE lzo,
    sperz character varying(1) ENCODE lzo,
    etikg character varying(10) ENCODE lzo,
    civve character varying(1) ENCODE lzo,
    milve character varying(1) ENCODE lzo,
    kdkg1 character varying(2) ENCODE lzo,
    kdkg2 character varying(2) ENCODE lzo,
    kdkg3 character varying(2) ENCODE lzo,
    kdkg4 character varying(2) ENCODE lzo,
    kdkg5 character varying(2) ENCODE lzo,
    xknza character varying(1) ENCODE lzo,
    fityp character varying(2) ENCODE lzo,
    stcdt character varying(2) ENCODE lzo,
    stcd3 character varying(18) ENCODE lzo,
    stcd4 character varying(18) ENCODE lzo,
    xicms character varying(1) ENCODE lzo,
    xxipi character varying(1) ENCODE lzo,
    xsubt character varying(3) ENCODE lzo,
    cfopc character varying(2) ENCODE lzo,
    txlw1 character varying(3) ENCODE lzo,
    txlw2 character varying(3) ENCODE lzo,
    ccc01 character varying(1) ENCODE lzo,
    ccc02 character varying(1) ENCODE lzo,
    ccc03 character varying(1) ENCODE lzo,
    ccc04 character varying(1) ENCODE lzo,
    cassd character varying(2) ENCODE lzo,
    knurl character varying(132) ENCODE lzo
) DISTSTYLE AUTO;

CREATE TABLE stg.lis_12_vchdr (
    rocancel character varying(2) ENCODE lzo,
    vbeln character varying(20) ENCODE lzo,
    ablad character varying(50) ENCODE lzo,
    btgew numeric(8, 3) ENCODE az64,
    bukrs character varying(8) ENCODE lzo,
    bzirk character varying(12) ENCODE lzo,
    erdat character varying(8) ENCODE lzo,
    faksk character varying(4) ENCODE lzo,
    gewei character varying(6) ENCODE lzo,
    inco1 character varying(6) ENCODE lzo,
    inco2 character varying(56) ENCODE lzo,
    kdgrp character varying(4) ENCODE lzo,
    kunag character varying(20) ENCODE lzo,
    kunnr character varying(20) ENCODE lzo,
    lfart character varying(8) ENCODE lzo,
    lfdat character varying(8) ENCODE lzo,
    lifnr character varying(20) ENCODE lzo,
    lifsk character varying(4) ENCODE lzo,
    lstel character varying(4) ENCODE lzo,
    ntgew numeric(8, 3) ENCODE az64,
    pkunre character varying(20) ENCODE lzo,
    pkunrg character varying(20) ENCODE lzo,
    pspdnr character varying(20) ENCODE lzo,
    pvrtnr character varying(16) ENCODE lzo,
    route character varying(12) ENCODE lzo,
    vbtyp character varying(8) ENCODE lzo,
    vkorg character varying(8) ENCODE lzo,
    voleh character varying(6) ENCODE lzo,
    volum numeric(8, 3) ENCODE az64,
    vstel character varying(8) ENCODE lzo,
    wadat character varying(8) ENCODE lzo,
    wadat_ist character varying(8) ENCODE lzo,
    anzli numeric(5, 0) ENCODE az64,
    mcbw_anzpk numeric(5, 0) ENCODE az64,
    periv character varying(4) ENCODE lzo,
    wa_delay_lf numeric(5, 0) ENCODE az64,
    odq_changemode character varying(2) ENCODE lzo,
    odq_entitycntr numeric(5, 2) ENCODE az64
) DISTSTYLE AUTO;

CREATE TABLE stg.lis_12_vcitm (
    rocancel character varying(2) ENCODE lzo,
    vbeln character varying(20) ENCODE lzo,
    koqua character varying(2) ENCODE lzo,
    kosta character varying(2) ENCODE lzo,
    posnr character varying(12) ENCODE lzo,
    wbsta character varying(2) ENCODE lzo,
    ablad character varying(50) ENCODE lzo,
    bukrs character varying(8) ENCODE lzo,
    bzirk character varying(12) ENCODE lzo,
    faksk character varying(4) ENCODE lzo,
    inco1 character varying(6) ENCODE lzo,
    inco2 character varying(56) ENCODE lzo,
    kdgrp character varying(4) ENCODE lzo,
    kunag character varying(20) ENCODE lzo,
    kunnr character varying(20) ENCODE lzo,
    lfart character varying(8) ENCODE lzo,
    lfdat character varying(8) ENCODE lzo,
    lifnr character varying(20) ENCODE lzo,
    lifsk character varying(4) ENCODE lzo,
    lstel character varying(4) ENCODE lzo,
    route character varying(12) ENCODE lzo,
    vbtyp character varying(8) ENCODE lzo,
    vkorg character varying(8) ENCODE lzo,
    vstel character varying(8) ENCODE lzo,
    wadat character varying(8) ENCODE lzo,
    wadat_ist character varying(8) ENCODE lzo,
    aedat character varying(8) ENCODE lzo,
    aktnr character varying(20) ENCODE lzo,
    brgew numeric(8, 3) ENCODE az64,
    bwapplnm character varying(60) ENCODE lzo,
    bwvorg character varying(6) ENCODE lzo,
    charg character varying(20) ENCODE lzo,
    ean11 character varying(36) ENCODE lzo,
    erdat character varying(8) ENCODE lzo,
    ernam character varying(24) ENCODE lzo,
    erzet character varying(26) ENCODE lzo,
    faksp character varying(4) ENCODE lzo,
    gewei character varying(6) ENCODE lzo,
    gsber character varying(8) ENCODE lzo,
    komkz character varying(2) ENCODE lzo,
    kvgr1 character varying(6) ENCODE lzo,
    kvgr2 character varying(6) ENCODE lzo,
    kvgr3 character varying(6) ENCODE lzo,
    kvgr4 character varying(6) ENCODE lzo,
    kvgr5 character varying(6) ENCODE lzo,
    kzvbr character varying(2) ENCODE lzo,
    lfimg numeric(7, 3) ENCODE az64,
    lgmng numeric(7, 3) ENCODE az64,
    lgnum character varying(6) ENCODE lzo,
    lgort character varying(8) ENCODE lzo,
    lgpla character varying(20) ENCODE lzo,
    lgtyp character varying(6) ENCODE lzo,
    matkl character varying(18) ENCODE lzo,
    matnr character varying(80) ENCODE lzo,
    matwa character varying(80) ENCODE lzo,
    meins character varying(6) ENCODE lzo,
    mvgr1 character varying(6) ENCODE lzo,
    mvgr2 character varying(6) ENCODE lzo,
    mvgr3 character varying(6) ENCODE lzo,
    mvgr4 character varying(6) ENCODE lzo,
    mvgr5 character varying(6) ENCODE lzo,
    ntgew numeric(8, 3) ENCODE az64,
    pkunre character varying(20) ENCODE lzo,
    pkunrg character varying(20) ENCODE lzo,
    posar character varying(2) ENCODE lzo,
    prodh character varying(36) ENCODE lzo,
    pspdnr character varying(20) ENCODE lzo,
    pstyv character varying(8) ENCODE lzo,
    pvrtnr character varying(16) ENCODE lzo,
    stadat character varying(8) ENCODE lzo,
    umvkn numeric(3, 0) ENCODE az64,
    umvkz numeric(3, 0) ENCODE az64,
    vbeaf numeric(3, 2) ENCODE az64,
    vbeav numeric(3, 2) ENCODE az64,
    vdatu character varying(8) ENCODE lzo,
    vgbel character varying(20) ENCODE lzo,
    vgpos character varying(12) ENCODE lzo,
    vgtyp character varying(8) ENCODE lzo,
    vkbur character varying(8) ENCODE lzo,
    vkgrp character varying(6) ENCODE lzo,
    voleh character varying(6) ENCODE lzo,
    volum numeric(8, 3) ENCODE az64,
    vrkme character varying(6) ENCODE lzo,
    vtweg character varying(4) ENCODE lzo,
    werks character varying(8) ENCODE lzo,
    anzlipos numeric(5, 0) ENCODE az64,
    spara character varying(4) ENCODE lzo,
    ps_posid character varying(48) ENCODE lzo,
    periv character varying(4) ENCODE lzo,
    wa_delay_lf numeric(5, 0) ENCODE az64,
    mcex_apcampaign character varying(64) ENCODE lzo,
    odq_changemode character varying(2) ENCODE lzo,
    odq_entitycntr numeric(5, 2) ENCODE az64
) DISTSTYLE AUTO;

CREATE TABLE stg.lis_13_vdhdr (
    rocancel character varying(2) ENCODE lzo,
    vbeln character varying(20) ENCODE lzo,
    bukrs character varying(8) ENCODE lzo,
    bzirk character varying(12) ENCODE lzo,
    erdat character varying(8) ENCODE lzo,
    fkart character varying(8) ENCODE lzo,
    fkdat character varying(8) ENCODE lzo,
    fktyp character varying(2) ENCODE lzo,
    hwaer character varying(10) ENCODE lzo,
    kdgrp character varying(4) ENCODE lzo,
    kunag character varying(20) ENCODE lzo,
    kunrg character varying(20) ENCODE lzo,
    kurrf numeric(12, 5) ENCODE az64,
    kurst character varying(8) ENCODE lzo,
    pvrtnr character varying(16) ENCODE lzo,
    stwae character varying(10) ENCODE lzo,
    vbtyp character varying(8) ENCODE lzo,
    vkorg character varying(8) ENCODE lzo,
    vtweg character varying(4) ENCODE lzo,
    waerk character varying(10) ENCODE lzo,
    anzfk numeric(12, 5) ENCODE az64,
    periv character varying(4) ENCODE lzo,
    odq_changemode character varying(3) ENCODE lzo,
    odq_entitycntr numeric(5, 3) ENCODE az64
) DISTSTYLE AUTO;

CREATE TABLE stg.lis_13_vditm (
    rocancel character varying(2) ENCODE lzo,
    vbeln character varying(20) ENCODE lzo,
    posnr character varying(12) ENCODE lzo,
    aedat character varying(8) ENCODE lzo,
    bukrs character varying(8) ENCODE lzo,
    bzirk character varying(12) ENCODE lzo,
    fkart character varying(8) ENCODE lzo,
    fkdat character varying(8) ENCODE lzo,
    fktyp character varying(2) ENCODE lzo,
    hwaer character varying(10) ENCODE lzo,
    kdgrp character varying(4) ENCODE lzo,
    kunag character varying(20) ENCODE lzo,
    kunrg character varying(20) ENCODE lzo,
    kurrf numeric(11, 5) ENCODE az64,
    kurst character varying(8) ENCODE lzo,
    stwae character varying(10) ENCODE lzo,
    vbtyp character varying(8) ENCODE lzo,
    vkorg character varying(8) ENCODE lzo,
    vtweg character varying(4) ENCODE lzo,
    waerk character varying(10) ENCODE lzo,
    aktnr character varying(20) ENCODE lzo,
    aubel character varying(20) ENCODE lzo,
    aupos character varying(12) ENCODE lzo,
    bonba numeric(7, 2) ENCODE az64,
    bonus character varying(4) ENCODE lzo,
    brgew numeric(8, 3) ENCODE az64,
    brtwr numeric(8, 2) ENCODE az64,
    bwapplnm character varying(60) ENCODE lzo,
    bwvorg character varying(6) ENCODE lzo,
    charg character varying(20) ENCODE lzo,
    ean11 character varying(36) ENCODE lzo,
    erdat character varying(8) ENCODE lzo,
    fareg character varying(2) ENCODE lzo,
    fbuda character varying(8) ENCODE lzo,
    fkimg numeric(7, 3) ENCODE az64,
    fklmg numeric(7, 3) ENCODE az64,
    gewei character varying(6) ENCODE lzo,
    knuma_ag character varying(20) ENCODE lzo,
    kokrs character varying(8) ENCODE lzo,
    kostl character varying(20) ENCODE lzo,
    kursk numeric(11, 5) ENCODE az64,
    kursk_dat character varying(8) ENCODE lzo,
    kvgr1 character varying(6) ENCODE lzo,
    kvgr2 character varying(6) ENCODE lzo,
    kvgr3 character varying(6) ENCODE lzo,
    kvgr4 character varying(6) ENCODE lzo,
    kvgr5 character varying(6) ENCODE lzo,
    kzwi1 numeric(11, 2) ENCODE az64,
    kzwi2 numeric(11, 2) ENCODE az64,
    kzwi3 numeric(11, 2) ENCODE az64,
    kzwi4 numeric(11, 2) ENCODE az64,
    kzwi5 numeric(11, 2) ENCODE az64,
    kzwi6 numeric(11, 2) ENCODE az64,
    lgort character varying(8) ENCODE lzo,
    lmeng numeric(7, 3) ENCODE az64,
    matkl character varying(18) ENCODE lzo,
    matnr character varying(80) ENCODE lzo,
    matwa character varying(80) ENCODE lzo,
    meins character varying(6) ENCODE lzo,
    mvgr1 character varying(6) ENCODE lzo,
    mvgr2 character varying(6) ENCODE lzo,
    mvgr3 character varying(6) ENCODE lzo,
    mvgr4 character varying(6) ENCODE lzo,
    mvgr5 character varying(6) ENCODE lzo,
    mwsbp numeric(7, 2) ENCODE az64,
    netwr numeric(8, 2) ENCODE az64,
    ntgew numeric(8, 3) ENCODE az64,
    pkunre character varying(20) ENCODE lzo,
    pkunwe character varying(20) ENCODE lzo,
    posar character varying(2) ENCODE lzo,
    prodh character varying(36) ENCODE lzo,
    provg character varying(4) ENCODE lzo,
    prsdt character varying(8) ENCODE lzo,
    pstyv character varying(8) ENCODE lzo,
    pvrtnr character varying(16) ENCODE lzo,
    skfbp numeric(11, 2) ENCODE az64,
    smeng numeric(7, 3) ENCODE az64,
    spara character varying(4) ENCODE lzo,
    spart character varying(4) ENCODE lzo,
    stadat character varying(8) ENCODE lzo,
    stcur numeric(11, 5) ENCODE az64,
    umvkn numeric(3, 0) ENCODE az64,
    umvkz numeric(3, 0) ENCODE az64,
    vdatu character varying(8) ENCODE lzo,
    vgbel character varying(20) ENCODE lzo,
    vgpos character varying(12) ENCODE lzo,
    vkbur character varying(8) ENCODE lzo,
    vkgrp character varying(6) ENCODE lzo,
    voleh character varying(6) ENCODE lzo,
    volum numeric(8, 3) ENCODE az64,
    vrkme character varying(6) ENCODE lzo,
    vstel character varying(8) ENCODE lzo,
    wavwr numeric(11, 2) ENCODE az64,
    werks character varying(8) ENCODE lzo,
    ps_posid character varying(48) ENCODE lzo,
    anzfkpos numeric(5, 0) ENCODE az64,
    periv character varying(4) ENCODE lzo,
    mcex_apcampaign character varying(64) ENCODE lzo,
    odq_changemode character varying(2) ENCODE lzo,
    odq_entitycntr numeric(5, 2) ENCODE az64
) DISTSTYLE AUTO;
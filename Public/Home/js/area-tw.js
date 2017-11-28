/*///////////////////////////////////////// rain /////////////////////////////////////////*/

SPT="選區域";
SCT="選地區";
SAT="";
ShowT=1;
PCAD="基隆市$仁愛區|信義區|中正區|中山區|安樂區|暖暖區|七堵區#台北市$中正區|大同區|中山區|松山區|大安區|萬華區|信義區|士林區|北投區|內湖區|南港區|文山區#新北市$萬里區|金山區|板橋區|汐止區|深坑區|石碇區|瑞芳區|平溪區|雙溪區|貢寮區|新店區|坪林區|烏來區|永和區|中和區|土城區|三峽區|樹林區|鶯歌區|三重區|新莊區|泰山區|林口區|蘆洲區|五股區|八里區|淡水區|三芝區|石門區#宜蘭縣$宜蘭市|頭城鎮|礁溪鄉|壯圍鄉|員山鄉|羅東鎮|三星鄉|大同鄉|五結鄉|冬山鄉|冬山鄉|南澳鄉#新竹市$東區|北區|香山#新竹縣$竹北市|湖口鄉|新豐鄉|新埔鎮|關西鎮|芎林鄉|寶山鄉|竹東鎮|五峰鄉|橫山鄉|尖石鄉|北埔鄉|峨嵋鄉#桃園市$中壢區|平鎮區|龍潭區|楊梅區|新屋區|觀音區|桃園區|龜山區|八德區|大溪區|復興區|大園區|蘆竹區#苗栗縣$竹南鎮|頭份市|三灣鄉|南庄鄉|獅潭鄉|後龍鎮|通霄鎮|苑裡鎮|苗栗市|造橋鄉|頭屋鄉|公館鄉|大湖鄉|泰安鄉|銅鑼鄉|三義鄉|西湖鄉|卓蘭鎮#台中市$中區|東區|南區|西區|北區|北屯區|西屯區|南屯區|太平區|大里區|霧峰區|烏日區|豐原區|后里區|石岡區|東勢區|和平區|新社區|潭子區|大雅區|神岡區|大肚區|沙鹿區|龍井區|梧棲區|清水區|大甲區|外埔區|大安區#彰化縣$彰化市|芬園鄉|花壇鄉|秀水鄉|鹿港鎮|福興鄉|線西鄉|和美鎮|伸港鄉|員林市|社頭鄉|永靖鄉|埔心鄉|溪湖鎮|大村鄉|埔鹽鄉|田中鎮|北斗鎮|田尾鄉|埤頭鄉|溪州鄉|竹塘鄉|二林鎮|大城鄉|芳苑鄉|二水鄉#南投縣$南投市|中寮鄉|草屯鎮|國姓鄉|埔里鎮|仁愛鄉|名間鄉|集集鎮|水里鄉|魚池鄉|信義鄉|竹山鎮|鹿谷鄉#嘉義市$東區|西區#嘉義縣$番路鄉|梅山鄉|竹崎鄉|阿里山|中埔鄉|大埔鄉|水上鄉|鹿草鄉|太保市|朴子市|東石鄉|六腳鄉|新港鄉|民雄鄉|大林鎮|溪口鄉|義竹鄉|布袋鎮#雲林縣$斗南鎮|大埤鄉|虎尾鎮|土庫鎮|褒忠鄉|東勢鄉|臺西鄉|崙背鄉|麥寮鄉|斗六市|林內鄉|古坑鄉|莿桐鄉|西螺鎮|二崙鄉|北港鎮|水林鄉|口湖鄉|四湖鄉|元長鄉#台南市$中西區|東區|南區|北區|安平區|安南區|永康區|歸仁區|新化區|左鎮區|玉井區|楠西區|南化區|仁德區|關廟區|龍崎區|官田區|麻豆區|佳里區|西港區|七股區|將軍區|學甲區|北門區|新營區|後壁區|白河區|東山區|六甲區|下營區|柳營區|鹽水區|善化區|大內區|山上區|新市區|安定區#高雄市$新興區|前金區|苓雅區|鹽埕區|鼓山區|旗津區|前鎮區|三民區|楠梓區|小港區|左營區|仁武區|大社區|岡山區|路竹區|阿蓮區|田寮區|燕巢區|橋頭區|梓官區|彌陀區|永安區|湖內區|鳳山區|大寮區|林園區|鳥松區|大樹區|旗山區|美濃區|六龜區|內門區|杉林區|甲仙區|桃源區|那瑪夏區|茂林區|茄萣區#屏東縣$屏東市|三地門鄉|霧臺鄉|瑪家鄉|九如鄉|里港鄉|高樹鄉|鹽埔鄉|長治鄉|麟洛鄉|竹田鄉|內埔鄉|萬丹鄉|潮州鎮|泰武鄉|來義鄉|萬巒鄉|崁頂鄉|新埤鄉|南州鄉|林邊鄉|東港鎮|琉球鄉|佳冬鄉|新園鄉|枋寮鄉|枋山鄉|春日鄉|獅子鄉|車城鄉|牡丹鄉|恆春鎮|滿州鄉#台東縣$臺東市|綠島鄉|延平鄉|卑南鄉|鹿野鄉|關山鎮|海端鄉|池上鄉|東河鄉|成功鎮|長濱鄉|太麻里鄉|金峰鄉|大武鄉|達仁鄉#花蓮縣$花蓮市|新城鄉|秀林鄉|吉安鄉|壽豐鄉|鳳林鎮|光復鄉|豐濱鄉|瑞穗鄉|萬榮鄉|玉里鎮|卓溪鄉|富里鄉#金門縣$金沙鎮|金湖鎮|金寧鄉|金城鎮#連江縣$南竿鄉|北竿鄉|莒光鄉|東引鄉#澎湖縣$西嶼鄉|湖西鄉";
if(ShowT)PCAD=SPT+"$"+SCT+","+SAT+"#"+PCAD;

PCAArea=[];
PCAP=[];
PCAC=[];
PCAA=[];
PCAN=PCAD.split("#");
for(i=0;i<PCAN.length;i++){
    PCAA[i]=[];
    TArea=PCAN[i].split("$")[1].split("|");
    for(j=0;j<TArea.length;j++){
        PCAA[i][j]=TArea[j].split(",");
        if(PCAA[i][j].length==1)PCAA[i][j][1]=SAT;
        TArea[j]=TArea[j].split(",")[0]
    }
    PCAArea[i]=PCAN[i].split("$")[0]+","+TArea.join(",");
    PCAP[i]=PCAArea[i].split(",")[0];
    PCAC[i]=PCAArea[i].split(',')
}

function PCAS(){
    this.SelP=document.getElementsByName(arguments[0])[0];
    this.SelC=document.getElementsByName(arguments[1])[0];
    this.SelA=document.getElementsByName(arguments[2])[0];
    this.DefP=this.SelA?arguments[3]:arguments[2];
    this.DefC=this.SelA?arguments[4]:arguments[3];
    this.DefA=this.SelA?arguments[5]:arguments[4];
    this.SelP.PCA=this;this.SelC.PCA=this;
    this.SelP.onchange=function(){
        PCAS.SetC(this.PCA)
    };
    if(this.SelA)this.SelC.onchange=function(){
        PCAS.SetA(this.PCA)};
    PCAS.SetP(this)
};

PCAS.SetP=function(PCA){
    for(i=0;i<PCAP.length;i++){
        PCAPT=PCAPV=PCAP[i];
        if(PCAPT==SPT)PCAPV="";
        PCA.SelP.options.add(new Option(PCAPT,PCAPV));
        if(PCA.DefP==PCAPV)PCA.SelP[i].selected=true
    }
    PCAS.SetC(PCA)
};

PCAS.SetC=function(PCA){
    PI=PCA.SelP.selectedIndex;
    PCA.SelC.length=0;
    for(i=1;i<PCAC[PI].length;i++){
        PCACT=PCACV=PCAC[PI][i];
        if(PCACT==SCT)PCACV="";
        PCA.SelC.options.add(new Option(PCACT,PCACV));
        if(PCA.DefC==PCACV)PCA.SelC[i-1].selected=true
    }
    if(PCA.SelA)PCAS.SetA(PCA)
};

PCAS.SetA=function(PCA){
    PI=PCA.SelP.selectedIndex;
    CI=PCA.SelC.selectedIndex;PCA.SelA.length=0;
    for(i=1;i<PCAA[PI][CI].length;i++){
        PCAAT=PCAAV=PCAA[PI][CI][i];
        if(PCAAT==SAT)PCAAV="";
        PCA.SelA.options.add(new Option(PCAAT,PCAAV));
        if(PCA.DefA==PCAAV)PCA.SelA[i-1].selected=true
    }
}

//执行函数
try{
    new PCAS("province","city","area");
}
catch(ex){
}
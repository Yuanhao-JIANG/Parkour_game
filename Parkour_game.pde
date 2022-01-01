import ddf.minim.*;
Minim minim;
AudioPlayer bgm;
int bulletNum=12;
PImage[] hero=new PImage[23];
PImage[][] monsterTop=new PImage[3][20];
PImage[] monsterLeft=new PImage[26];
PImage[] cannon=new PImage[3];
PImage[] fireBall=new PImage[3];
PImage[] monster=new PImage[3];
PImage[] bullet=new PImage[bulletNum];
int[] fireBallNum=new int[3];
int[] monsterTopNum=new int[3];
PImage heroJump;
PImage track, vineL, vineR;
PImage mainPage,RUN,INSTRUCTION,instructions,back;
PImage endP,MAINPAGEbutton;
PImage shield;
PImage flash;
PImage newCursor;
int t;
int p;
int heroX,heroY,heroWidth,heroHeight,heroSpeed;
int heroFeetL,heroFeetR,heroFeetT,heroFeetB;
int heroChestL,heroChestR,heroChestT,heroChestB;
int trackY,trackMovingSpeed;
int vineHeight, vineWidth, vineLY, vineRY, vineMovingSpeed;
int vineLL,vineLR,vineLT,vineLB,vineRL,vineRR,vineRT,vineRB;
int myTime;
int stage;
int jumpTimeCount;
int RUNX,RUNY,RUNW,RUNH,INSTRUCTIONX,INSTRUCTIONY,INSTRUCTIONW,INSTRUCTIONH,backX,backY,backW,backH;
int bloodBarLength;
int MAINPAGEbuttonX,MAINPAGEbuttonY,MAINPAGEbuttonW,MAINPAGEbuttonH;
int cannonX,cannonY,cannonW,cannonH;
int fireBallSpeed,fireBallW,fireBallH;
int monsterTopSpeed,monsterTopW,monsterTopH;
int bulletSpeed,bulletW,bulletH;
int flashX,flashY,flashW,flashH;
int flashL,flashR,flashT,flashB;
int[] fireBallX=new int[3];
int[] fireBallY=new int[3];
int[] fireBallL=new int[3];
int[] fireBallR=new int[3];
int[] fireBallT=new int[3];
int[] fireBallB=new int[3];
int[] monsterTopX=new int[3];
int[] monsterTopY=new int[3];
int[] monsterTopL=new int[3];
int[] monsterTopR=new int[3];
int[] monsterTopT=new int[3];
int[] monsterTopB=new int[3];
int[] bulletX=new int[bulletNum];
int[] bulletY=new int[bulletNum];
int[] bulletL=new int[bulletNum];
int[] bulletR=new int[bulletNum];
int[] bulletT=new int[bulletNum];
int[] bulletB=new int[bulletNum];
boolean isLEFT,isRIGHT,isUP,isDOWN;
boolean stumble;
boolean[] fired=new boolean[3];
boolean[] hit=new boolean[3];
boolean[] fireBallNumBoolean=new boolean[3];
boolean[] monsterTopNumBoolean=new boolean[3];
boolean[] bulletVisible=new boolean[bulletNum];
boolean shieldBoolean;
boolean jumpTime;
boolean cursorVisible;
float timer,timer1,timer2;
float frameRateNum;
boolean flashBoolean;
boolean flashTime;
int flashSpeed;
int flashTimeCount;
int flashTimeCountNum;
int score;
boolean monsterLeftLocation;
boolean monsterLeftBoolean;
boolean biten;
int monsterLeftPossibility;
int monsterLeftX,monsterLeftY,monsterLeftW,monsterLeftH;
int monsterLeftL,monsterLeftR,monsterLeftT,monsterLeftB;
int monsterLeftSpeed;
int end;
void setup(){
  minim=new Minim(this);
  bgm=minim.loadFile("music.mp3");
  size(500,750);
  jumpTimeCount=0;
  for(int i=0; i<23; i=i+1){
    hero[i]=loadImage("hero"+i+".gif");
  }
  for(int i=0;i<3;i=i+1){
    for(int y=0;y<20;y=y+1){
      monsterTop[i][y]=loadImage("monsterTop"+y+".gif"); 
    }
  }
  for(int i=0;i<26;i=i+1){
    monsterLeft[i]=loadImage("monsterLeft"+i+".png"); 
  }
  isLEFT=false;
  isRIGHT=false;
  heroJump=loadImage("heroJump.png");
  vineL=loadImage("vineL.png");
  vineR=loadImage("vineR.png");
  track=loadImage("track.png");
  mainPage=loadImage("mainPage.png");
  RUN=loadImage("RUN.png");
  INSTRUCTION=loadImage("INSTRUCTION.png");
  instructions=loadImage("instructions.png");
  back=loadImage("back.png");
  endP=loadImage("endP.png");
  MAINPAGEbutton=loadImage("MAINPAGEbutton.png");
  shield=loadImage("shield.png");
  flash=loadImage("flash.png");
  newCursor=loadImage("cursor.png");
  newCursor.resize(30,30);
  fireBallSpeed=9;
  fireBallW=70;
  fireBallH=90;
  monsterTopSpeed=8;
  monsterTopW=145;
  monsterTopH=135;
  for(int i=0;i<3;i=i+1){
    cannon[i]=loadImage("cannon.png");
    fireBall[i]=loadImage("fireBall.png");
    fireBallNumBoolean[i]=true;
    fireBallX[i]=60+i*150;
    fireBallY[i]=0;
    fired[i]=false;
    monsterTopNumBoolean[i]=true;
    monsterTopX[i]=43+i*135;
    monsterTopY[i]=0;
    hit[i]=false;
  }
  bulletSpeed=9;
  bulletW=30;
  bulletH=50;
  flashSpeed=5;
  for(int i=0;i<bulletNum;i=i+1){
    bullet[i]=loadImage("bullet.png");
    bulletVisible[i]=false; 
  }
  trackMovingSpeed=7;
  trackY=0;
  p=0;
  heroX=195;
  heroY=530;
  heroWidth=120;
  heroHeight=210;
  vineHeight=80;
  vineWidth=240;
  vineLY=int(random(-400,0));
  vineRY=int(random(-400,0));
  vineMovingSpeed=trackMovingSpeed;
  frameRateNum=30;
  frameRate(frameRateNum);
  myTime = 0;
  stage=0;
  RUNX=205;
  RUNY=500;
  RUNW=100;
  RUNH=50;
  INSTRUCTIONX=135;
  INSTRUCTIONY=570;
  INSTRUCTIONW=250;
  INSTRUCTIONH=RUNH;
  backX=205;
  backY=600;
  backW=100;
  backH=RUNH;
  MAINPAGEbuttonX=125;
  MAINPAGEbuttonY=530;
  MAINPAGEbuttonW=260;
  MAINPAGEbuttonH=60;
  heroSpeed=9;
  bloodBarLength=200;
  stumble=false;
  cannonW=100;
  cannonH=100;
  cannonX=48;
  cannonY=-cannonH;
  shieldBoolean=false;
  jumpTime=true;
  cursor(newCursor);
  flashW=width-50;
  flashH=50;
  flashBoolean=true;
  flashTime=false;
  flashTimeCountNum=300;
  flashTimeCount=flashTimeCountNum;
  score=0;
  monsterLeftBoolean=true;
  monsterLeftLocation=true;
  monsterLeftW=200;
  monsterLeftH=100;
  monsterLeftSpeed=9;
  biten=false;
  end=0;
}
  
void draw(){
  if(stage==0){
    mainP();
  }else if(stage==1){
    timeCount();
    bgm.play();
    track();
    vine();
    bullet();
    releaseFlash();
    heroOperation();
    bloodBar();
    flashCooling();
    scorePrint();
  }else if(stage==2){
    instructions();
  }else if(stage==3){
    end+=1;
    heroSpeed=0;
    trackMovingSpeed=0;
    vineMovingSpeed=0;
    monsterTopSpeed=0;
    monsterLeftSpeed=0;
    flashSpeed=0;
    bulletSpeed=0;
    fireBallSpeed=0;
    if(end>=70){
      endPage();
    }
    bgm.pause();
  }else if(stage==4){
    timeCount();
    track();
    vine();
    bullet(); 
    cannonFire(); 
    releaseFlash();
    heroOperation();  
    bloodBar();
    flashCooling();
    scorePrint();
  }else if(stage==5){
    timeCount();
    track();
    vine();
    monsterTopFunction();
    bullet();
    cannonFire();  
    monsterLeftFunction();
    releaseFlash();
    heroOperation();  
    bloodBar();
    flashCooling();
    scorePrint();
  }
  cursorVisibility();
}

void cursorVisibility(){
  if(stage==0||stage==2||stage==3){
   cursorVisible=true;
  }else{
   cursorVisible=false;
  } 
  if(cursorVisible==false){
    noCursor();
  }else{
   cursor(newCursor,2,0); 
  }
}

void mainP(){
  image(mainPage,-3,0,503,750);
  image(hero[9],180,250,140,250);
  image(RUN,RUNX,RUNY,RUNW,RUNH);
  image(INSTRUCTION,INSTRUCTIONX,INSTRUCTIONY,INSTRUCTIONW,INSTRUCTIONH);
}

void instructions(){
  image(instructions,-3,0,503,750);
  image(back,backX,backY,backW,backH);
}

void heroOperation(){
 if(p==0){
      image(hero[frameCount%23],heroX,heroY,heroWidth,heroHeight);
      if(shieldBoolean==true){
        image(shield,heroX-37,heroY+5,200,200);
      }
    }else if(p==1){
        image(heroJump,heroX,heroY,90,140); 
      if(shieldBoolean==true){
        image(shield,heroX-44,heroY-15,180,180);
      }
      }
  if (isLEFT == true && heroX>=55) //LEFT
  {
    heroX = heroX - heroSpeed;
  }
  if (isRIGHT == true && heroX<=width-175)
  {
    heroX = heroX + heroSpeed;
  }
  if (isUP == true && heroY>=100) 
  {
    heroY = heroY - heroSpeed;
  }
  if (isDOWN == true && heroY<=height-heroHeight)
  {
    heroY = heroY + heroSpeed;
  }
  heroFeetL=heroX+40;
  heroFeetR=heroX+80;
  heroFeetT=heroY+heroHeight-15;
  heroFeetB=heroY+heroHeight;
  heroChestL=heroX+25;
  heroChestR=heroX+95;
  heroChestT=heroY+50;
  heroChestB=heroY+100;
  if(p==1){
    jumpTimeCount++;
  }
  if(jumpTimeCount>=30){
    p=0;
    jumpTime=false;
    jumpTimeCount=0;
  }
}

void keyPressed()  
{
    if (keyCode == LEFT){
      isLEFT=true;
      if(p==1){
        p=0;
      }
    }
    if (keyCode == RIGHT){
      isRIGHT=true;
      if(p==1){
        p=0;
      }
    }
    if (keyCode == UP){
      isUP=true;
      if(p==1){
        p=0;
      }
    }
    if (keyCode == DOWN){
      isDOWN=true;
      if(p==1){
        p=0;
      }
    }
    if (key==' ' && jumpTime==true){
      p=1;
    }
    if (key=='e'||key=='E'){
      shieldBoolean=true;
    }
    if(key=='q'||key=='Q'){
      boolean found = false;
      for(int i=0;i<bulletNum;i=i+1){
        if(bulletVisible[i]==false && found==false){
          bulletX[i]=heroX+heroWidth/2-bulletW/2;
          bulletY[i]=heroY;
          bulletVisible[i]=true;
          found=true;
        }
      }
    }
    if((key=='w'||key=='W')){
      if(flashBoolean==true){
        flashX=25;
        flashY=heroY; 
        flashBoolean=false;
        flashTimeCount=0;
      }
      flashTime=true;
    }
}

void keyReleased()
{
    if (keyCode == LEFT)
      isLEFT=false;
    if (keyCode == RIGHT)
      isRIGHT=false;
    if (keyCode == UP)
      isUP=false;
    if (keyCode == DOWN)
      isDOWN=false;
    if (key==' '){
      p=0;
      jumpTimeCount=0;
      jumpTime=true;
    }
    if(key=='e'||key=='E'){
      shieldBoolean=false;
    }
}

void track(){
    if(trackY<=740){
    image(track,-3,trackY,503,750);
    image(track,-3,trackY-750, 503,750);
    trackY=trackY+trackMovingSpeed;
  }
  if(trackY>740){
    trackY=0;
  }
}

void vine(){
  if(min(vineRY,vineLY)>height){
   vineLY=int(random(-height,-10));
   vineRY=int(random(-height,-10));
  }
  image(vineL,45,vineLY,vineWidth,vineHeight);
  image(vineR,width-45-vineWidth,vineRY,vineWidth,vineHeight);
  vineLY=vineLY+vineMovingSpeed;
  vineRY=vineRY+vineMovingSpeed;
  vineLL=45;
  vineLR=45+vineWidth-30;
  vineLT=vineLY+20;
  vineLB=vineLY-20+vineHeight;
  vineRL=width-45-vineWidth+30;
  vineRR=width-45;
  vineRT=vineRY+20;
  vineRB=vineRY-20+vineHeight;
}
  
void mousePressed(){
  if(stage==0 && mouseX>RUNX && mouseX<RUNX+RUNW && mouseY>RUNY && mouseY<RUNY+RUNH){
    stage=1; 
    timer1=millis();
  }else if(stage==0 && mouseX>INSTRUCTIONX && mouseX<INSTRUCTIONX+INSTRUCTIONW && mouseY>INSTRUCTIONY && mouseY<INSTRUCTIONY+INSTRUCTIONH){
    stage=2;
  }else if(stage==2 && mouseX>backX && mouseX<backX+backW && mouseY>backY && mouseY<backY+backH){
    stage=0;
  }else if(stage==3 && mouseX>MAINPAGEbuttonX && mouseX<MAINPAGEbuttonX+MAINPAGEbuttonW && mouseY>MAINPAGEbuttonY && mouseY<MAINPAGEbuttonY+MAINPAGEbuttonH){
    setup();
  }
  //bloodBarLength=200;
}

void bloodBar(){
  fill(#FFFFFF);
  stroke(5);
  rect(2,0,200,25);
  if(((vineLL<heroFeetR && vineLR>heroFeetL && vineLB>heroFeetT && vineLT<heroFeetB)||(vineRL<heroFeetR && vineRR>heroFeetL && vineRB>heroFeetT && vineRT<heroFeetB))&&p==0){
    if(stumble==false){
      bloodBarLength=bloodBarLength-50;
      stumble=true;
    }
  }else{
   stumble=false; 
  }
  for(int i=0;i<3;i=i+1){
    for(int y=0;y<bulletNum;y=y+1){
    if((fireBallL[i]<heroChestR && fireBallR[i]>heroChestL && fireBallB[i]>heroChestT && fireBallT[i]<heroChestB)&&(p==0||p==1)&&shieldBoolean==false){
      if(fired[i]==false){
        bloodBarLength=bloodBarLength-50;
        fireBallY[i]=height;
        fired[i]=true;
      }
    }else if((fireBallL[i]<heroChestR && fireBallR[i]>heroChestL && fireBallB[i]>heroChestT && fireBallT[i]<heroChestB)&&(p==0||p==1)&&shieldBoolean==true){
     fired[i]=false; 
     fireBallY[i]=height;
    }else{
     fired[i]=false;
    }
    if((monsterTopL[i]<heroChestR && monsterTopR[i]>heroChestL && monsterTopB[i]>heroChestT && monsterTopT[i]<heroChestB)&&(p==0||p==1)){
      if(hit[i]==false){
        bloodBarLength=bloodBarLength-50;
        monsterTopY[i]=height;
        hit[i]=true;
      }
    }else if((monsterTopL[i]<bulletR[y] && monsterTopR[i]>bulletL[y] && monsterTopB[i]>bulletT[y] && monsterTopT[i]<bulletB[y])&&(p==0||p==1)){
      hit[i]=false; 
      score+=1;
      monsterTopY[i]=height;
      bulletVisible[y]=false;
      bulletL[y]=-1000;
      bulletR[y]=-500;
      bulletT[y]=10000;
      bulletB[y]=12000;
    }else if((monsterTopL[i]<flashR && monsterTopR[i]>flashL && monsterTopB[i]>flashT && monsterTopT[i]<flashB)&&(p==0||p==1)){
      hit[i]=false;
      score+=1;
      monsterTopY[i]=height;
      monsterTopL[i]=-1000;
      monsterTopR[i]=-500;
      monsterTopT[i]=10000;
      monsterTopB[i]=12000;
    }else if((monsterLeftL<bulletR[y] && monsterLeftR>bulletL[y] && monsterLeftB>bulletT[y] && monsterLeftT<bulletB[y])&&(p==0||p==1)){
      hit[i]=false;
      score+=10;
      monsterLeftX=width; 
      bulletVisible[y]=false;
      bulletL[y]=-1000;
      bulletR[y]=-500;
      bulletT[y]=10000;
      bulletB[y]=12000;     
    }else{
      hit[i]=false;
    }
   }
  }
  if((monsterLeftL<heroChestR && monsterLeftR>heroChestL && monsterLeftB>heroChestT && monsterLeftT<heroChestB)&&(p==0||p==1)){
        if(biten==false){
        bloodBarLength=bloodBarLength-50;
        biten=true;
      }
     }else{
       biten=false; 
     }
  if((monsterLeftL<flashR && monsterLeftR>flashL && monsterLeftB>flashT && monsterLeftT<flashB)&&(p==0||p==1)){
      score+=10;
      monsterLeftX=width;
    }
  fill(#FF0000);
  stroke(5);
  rect(2,0,bloodBarLength,25);
  if(bloodBarLength<=0){
   stage=3; 
  }
}

void timeCount(){
  timer2=millis()-timer1;
  timer=timer2/1000;
  if(timer>=3){
    frameRate(frameRateNum);
    frameRateNum+=0.006;
  }
  if(timer>=10){
   stage=4; 
  }
  if(timer>=20){
    stage=5;
  }
}

void endPage(){
  image(endP,-3,0,503,750);
  image(MAINPAGEbutton,MAINPAGEbuttonX,MAINPAGEbuttonY,MAINPAGEbuttonW,MAINPAGEbuttonH);
  textSize(40);
  fill(#FFFFFF);
  text("Your Score: ",120,450);
  fill(#FF0000);
  text(score,350,450);
}

void cannonFire(){
  for(int i=0;i<3;i+=1){
  if(fireBallNumBoolean[i]==true){
    fireBallNum[i]=int(random(0,1000));
    fireBallNumBoolean[i]=false;
  }
  if(fireBallNum[i]<=3){
    image(fireBall[i],fireBallX[i],fireBallY[i],fireBallW,fireBallH);
    fireBallY[i]=fireBallY[i]+fireBallSpeed;
    fireBallL[i]=fireBallX[i]+5;
    fireBallR[i]=fireBallX[i]+fireBallW-5;
    fireBallT[i]=fireBallY[i]+7;
    fireBallB[i]=fireBallY[i]+fireBallH-10;
  }else{
    fireBallNumBoolean[i]=true;
  }
  if(fireBallY[i]>=height){
    fireBallNumBoolean[i]=true;
    fireBallY[i]=0;
  }
  }
  if(cannonY<-20){
   cannonY=cannonY+trackMovingSpeed;
  }
  image(cannon[0],cannonX,cannonY,cannonW,cannonH);
  image(cannon[1],cannonX+150,cannonY,cannonW,cannonH);
  image(cannon[2],cannonX+300,cannonY,cannonW,cannonH);
}

void monsterTopFunction(){
  for(int i=0;i<3;i+=1){
  if(monsterTopNumBoolean[i]==true){
    monsterTopNum[i]=int(random(0,1000));
    monsterTopNumBoolean[i]=false;
  }
  if(monsterTopNum[i]<=3){
    image(monsterTop[i][frameCount%20],monsterTopX[i],monsterTopY[i],monsterTopW,monsterTopH);
    monsterTopY[i]=monsterTopY[i]+monsterTopSpeed;
    monsterTopL[i]=monsterTopX[i]+5;
    monsterTopR[i]=monsterTopX[i]+monsterTopW-5;
    monsterTopT[i]=monsterTopY[i]+7;
    monsterTopB[i]=monsterTopY[i]+monsterTopH-10;
  }else{
    monsterTopNumBoolean[i]=true;
  }
  if(monsterTopY[i]>=height){
    monsterTopNumBoolean[i]=true;
    monsterTopY[i]=0;
  }
  }
}

void bullet(){
  for(int i=0;i<bulletNum;i=i+1){
   if(bulletVisible[i]==true){
    image(bullet[i],bulletX[i],bulletY[i],bulletW,bulletH);
    bulletY[i]-=bulletSpeed;
    bulletL[i]=bulletX[i]+5;
    bulletR[i]=bulletX[i]+bulletW-5;
    bulletT[i]=bulletY[i]+10;
    bulletB[i]=bulletY[i]+bulletH-5;
   }
   if(bulletY[i]<=-bulletH){
    bulletVisible[i]=false;
   }
  }
}

void releaseFlash(){
  if(flashTime==true){
  image(flash,flashX,flashY,flashW,flashH);
  flashY-=flashSpeed;
  flashTimeCount+=1;
  flashL=flashX+5;
  flashR=flashX+flashW-5;
  flashT=flashY+10;
  flashB=flashY+flashH-5;
  }
  if(flashTimeCount>=flashTimeCountNum){
   flashTimeCount=flashTimeCountNum;
   flashBoolean=true;
  }
}

void flashCooling(){
  fill(#FFFFFF);
  ellipse(30,55,45,45);
  fill(#035FFA);
  arc(30,55,45,45,0,PI*2*flashTimeCount/flashTimeCountNum);
  fill(#FFFFFF);
  textSize(32);
  text("w",18,64);
}

void scorePrint(){
  fill(#FFFFFF);
  rect(290,0,210,30);
  fill(#000000);
  textSize(25);
  text("Your Score: ",300,25);
  fill(#FF0000);
  text(score,440,25);
}

void monsterLeftFunction(){
  if(monsterLeftBoolean==true){
    monsterLeftPossibility=int(random(0,1000));
    monsterLeftBoolean=false;
  }
  if(monsterLeftLocation==true){
    monsterLeftX=-monsterLeftW-10;
    monsterLeftY=int(random(80,400));
    monsterLeftLocation=false;
  }
  if(monsterLeftPossibility<=3){
    image(monsterLeft[frameCount%26],monsterLeftX,monsterLeftY,monsterLeftW,monsterLeftH);
    monsterLeftX+=monsterLeftSpeed;
    monsterLeftL=monsterLeftX+5;
    monsterLeftR=monsterLeftX+monsterLeftW-5;
    monsterLeftT=monsterLeftY+7;
    monsterLeftB=monsterLeftY+monsterLeftH-10;
  }else{
    monsterLeftBoolean=true;
  }
  if(monsterLeftX>width){
    monsterLeftLocation=true;
    monsterLeftBoolean=true;
  }
}

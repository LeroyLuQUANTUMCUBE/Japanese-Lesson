size(1200, 600);
//variables-----------------------------------
var mC=false;
var triM=0;
var triS=1;
var triD=true;
var count=0;
var screen=1;
var c=[0, 0, 0, 0, 0];
var p=[3, 3, 3, 3, 3];
var cMov=[false, false, false, false, false];
var pMov=[false, false, false, false, false];
var qAA=[["Which of these statements are true?", "true", "false", "true", "false", "true"], ["Which of these are grammatically correct?", "true", "false", "true", "false", "true"], ["Which of these statements are in polite form?", "true", "false", "true", "false", "true"]];
var qCa=[false, false, false, false, false];
var ques=false;
var qNo=-1;
var qNum=[-1, -1, -1, -1, -1];
var qSel=[false, false, false, false, false];
var qIn=false;
var qFC=4;
var ts=0;
var cs=0;
var inC=false;
//variables for just the triangle-----------------------------------
var pX=19.5;
//functions-----------------------------------
var lRot = function(x, y, rad1, deg1, rad2, deg2){
    line(x+rad1*cos(deg1*PI/180), y+rad1*sin(deg1*PI/180), x+rad2*cos(deg2*PI/180), y+rad2*sin(deg2*PI/180));
}
//function just for the triangle-----------------------------------
var pen5 = function(deg, x, y, s){
    var pC=100-((pX*tan(72*PI/180))+(2*pX));
    var pL=((pX*tan(72*PI/180))+pX+(tan(72*PI/180)*(pX/2)))/tan(72*PI/180);
    var pW=((pX*tan(72*PI/180))+(tan(72*PI/180)*(pX/2)))/tan(72*PI/180);
    lRot(x, y, pC/cos(36*PI/180)/100*s, 90+deg, sqrt(pow(pL, 2)+(pow(pX+pC, 2)))/100*s, deg+270-atan((pL)/(pX+pC))*180/PI);
    lRot(x, y, sqrt(pow(100, 2)+(pow(pX/2, 2)))/100*s, deg+270-atan((pX/2)/(100))*180/PI, sqrt(pow(pL, 2)+(pow(pX+pC, 2)))/100*s, deg+270-atan((pL)/(pX+pC))*180/PI);
    lRot(x, y, sqrt(pow(100, 2)+(pow(pX/2, 2)))/100*s, deg+270+atan((pX/2)/(100))*180/PI, sqrt(pow(pL/2, 2)+(pow((pX+pC)/2, 2)))/100*s, deg+270-atan((pL/2)/((pX+pC)/2))*180/PI);
    lRot(x, y, sqrt(pow(100, 2)+(pow(pX/2, 2)))/100*s, deg+270-atan((pX/2)/(100))*180/PI, sqrt(pow(100, 2)+(pow(pX/2, 2)))/100*s, deg+270+atan((pX/2)/(100))*180/PI);
    lRot(x, y, sqrt(pow(100, 2)+(pow(pX/2, 2)))/100*s, deg+270+atan((pX/2)/(100))*180/PI, sqrt(pow(pW, 2)+(pow(pX+pX+pC, 2)))/100*s, deg+270+atan((pW)/(pX+pX+pC))*180/PI);
}
var rosePen=function(x, y, s, str, fil, rot){
    strokeWeight(str);
    stroke(fil);
    for(var i=0;i<5;i++){
    pen5((i*72)+rot, x, y, s);
    }
}

//loop-----------------------------------
draw=function(){
//start screen-----------------------------------
    if(screen>=1&&screen<2){
        background(255, 60, 0);
        textSize(150);
        textAlign(CENTER);
        fill(0);
        text("追撃", 600, 230);
        fill(0, 100, 0);
        textSize(80);
        text("CHASE", 600, 90);
        fill(255);
        textSize(100);
        rotate(PI/4);
        text("つ", 350, -30);
        rotate(-PI/6);
        text("い", 550, 220);
        rotate(-PI/6);
        text("げ", 610, 520);
        rotate(-PI/6);
        text("き", 495, 805);
        fill(0, 200, 200);
        noStroke();
        rotate(PI/4);
        triangle(50, 100, 500, 550, 50, 550);
        triangle(1150, 100, 700, 550, 1150, 550);
        rotate(PI/4);
        fill(255, 255, 0);
        textSize(70);
        text("Play quiz", 420, 160);
        rotate(-PI/2);
        textSize(60);
        text("Information", 430, 1000);
        rotate(PI/4);
        triM++;
        if(triM>360){
        triM-=360;
        }
        if(triD){
            triS+=0.1;
            if(triS>=8){
                triD=false;
            }
        }else{
            triS-=0.1;
            if(triS<=1){
                triD=true;
            }
        }
        rosePen(600, 480, 100, triS, 240-((triS*30)-10), triM);
        if(!mC&&mousePressed&&mouseX>50&&mouseY<550&&mouseY>mouseX+50&&screen==1){
            screen=1.1;
            mC=true;
        }
        if(!mC&&mousePressed&&mouseX<1150&&mouseY<550&&mouseY>-mouseX+1250&&screen==1){
            screen=1.2;
            mC=true;
        }
        if(screen==1.1){
            noStroke();
            fill(255, 0, 0, count);
            count+=3;
            if(count>250){
                screen=2;
                count=0;
            }
            rect(0, 0, 1200, 600);
        }
        if(screen==1.2){
            noStroke();
            fill(255, 127, 0, count);
            count+=3;
            if(count>250){
                screen=3;
                count=0;
            }
            rect(0, 0, 1200, 600);
        }
    }
    //game screen-----------------------------------
    if(screen>=2&&screen<3){
        background(255, 0, 0);
        textSize(50);
        fill(0);
        if(qNo!=-1){
            if(qFC==4){
                text("Ready. Click anywhere for next question.", 600, 50);
            }else if(qFC==3){
                text("Moving players...", 600, 50);
            }else if(qFC==2){
                text("Moving the chaser...", 600, 50);
            }else if(qFC==1){
                text("These were the correct answers", 600, 50);
            }else{
                text(qAA[qNo][0], 600, 50);
            }
        }else{
            textSize(40);
            text("Click anywhere to begin. To answer, select from bottom panels.", 600, 50);
        }
        if(ques){
            if(qIn){
                if(count<359){
                    count++;
                }else{
                    ques=false;
                    qIn=false;
                    qFC=1;
                    count=round(random(-0.5, 4.5));    
                    for(var i=0;i<5;i++){
                        if(((qSel[i]&&qNum[i]%2==0)||(!qSel[i]&&qNum[i]%2==1))&&!qCa[i]){
                            pMov[i]=true;
                            cs++;
                        }
                        if(i!=count&&!qCa[i]){
                            cMov[i]=true;
                        }
                        if(!qCa[i]){
                            ts++;
                        }
                    }
                    count=0;
                    
                }
            }else{
                count=0;
                qNo=round(random(-0.5, 2.5));
                for(var i=0;i<qAA[0].length-1;i++){
                    qNum[i]=round(random(-0.5, qAA[0].length-1.5));
                    for(var j=0;j<qAA[0].length-1;j++){
                        if(qNum[i]==qNum[j]&&i!=j){
                            i--;
                            j=qAA[0].length;
                        }
                    }
                }
                qIn=true;
            }
        }
        for(var i=0;i<5;i++){
            if(c[i]>=p[i]||p[i]>=11){
                qCa[i]=true;
                c[i]=0;
            }
            fill(0, 255, 0);
            noStroke();
            if(!qCa[i]||p[i]>=11){
                rect(240*i, 100+(c[i]*40), 240, ((p[i]-c[i]-1)*40));
                if(c[i]<=10){
                    triangle(240*i, 60+(p[i]*40), 240*(i+1), 60+(p[i]*40), 240*(i+0.5), 100+(p[i]*40));
                }
                if(qSel[i]||p[i]>=11){
                    rect(240*i, 500, 240, 100);
                }
            }
            if(qCa[i]&&p[i]<=10){                
                for(var j=1;j<11;j++){
                    rosePen(120+(i*240), 82.5+(j*40), 15, .3, 0, 0);
                }
            }else if(p[i]<=10){
                rosePen(120+(i*240), 82.5+(c[i]*40), 15, .3, 0, -360*(c[i]%1));
            }
            strokeWeight(5);
            stroke(0);
            if(i!=0){
                line(240*i, 100, 240*i, 600);
            }
            textSize(20);
            fill(0);
            if(!qCa[i]){
                text("Player "+(i+1), 120+(240*i), 85+(40*p[i]));
                if(qNum[i]!=-1){
                    text(qAA[qNo][qNum[i]+1], 120+(240*i), 560);
                }
            }
            if(ques){
                if(!mC&&mousePressed&&mouseX>(240*i)&&mouseX<(240*(i+1))&&mouseY>500&&mouseY<600){
                    mC=true;
                    if(qSel[i]){
                        qSel[i]=false;
                    }else{
                        qSel[i]=true;
                    }
                }
            }
            if(qFC==1&&i==0){
                count++;  
                if(count>172){
                    count=0;
                    qFC=2;
                }
            }
            if(qFC==1&&!qCa[i]){
                if(qNum[i]%2==0){
                    strokeWeight(10);
                    stroke(0, 0, 0, 50);
                    noFill();
                    if(count>72){
                        ellipse(120+(240*i), 550, 200, 80);                        
                    }else{
                        arc(120+(240*i), 550, 200, 80, (270-(count*5))*PI/180, 3*PI/2);
                    }                    
                }
            }
        }
        stroke(0);
        strokeWeight(5);
        line(0, 100, 1200, 100);
        strokeWeight(1);
        for(var i=0;i<10;i++){
            line(0, 140+(40*i), 1200, 140+(40*i));
        }
        if(qFC==2){
            for(var i=0;i<5;i++){
                if(cMov[i]){
                    c[i]+=0.05;
                    if(abs(c[i]-round(c[i]))<0.01){
                        cMov[i]=false;
                        c[i]=round(c[i]);
                    }
                }
            }
            if(!cMov[0]&&!cMov[1]&&!cMov[2]&&!cMov[3]&&!cMov[4]){
                count++;
                if(count>=50){
                    count=0;
                    qFC=3;
                }
            }
        }
        if(qFC==3){
            for(var i=0;i<5;i++){
                if(pMov[i]){
                    p[i]+=0.05;
                    if(abs(p[i]-round(p[i]))<0.01){
                        pMov[i]=false;       
                        p[i]=round(p[i]);
                    }
                }
            }
            if(!pMov[0]&&!pMov[1]&&!pMov[2]&&!pMov[3]&&!pMov[4]){
                count++;
                if(count>=50){
                    count=0;
                    qFC=4;
                }
            }
        }
        if(qFC==4){
            if(qCa[0]&&qCa[1]&&qCa[2]&&qCa[3]&&qCa[4]){
                for(var i=0;i<5;i++){
                    if(p[i]>=11){
                        qCa[i]=false;                        
                    }
                }
                screen=2.1;
            }else if(mousePressed&&!mC&&screen==2){
                mC=true;
                count=0;
                ques=true;
                qFC=0;
                qNum=[-1, -1, -1, -1, -1];
                qNo=-1;
                qSel=[0, 0, 0, 0, 0];
            }
        }
        if(screen==2.1){
            count+=3;
            fill(0, 0, 0, count);
            rect(0, 0, 1200, 600);
            if(count>=250){
                screen=4;
            }
        }
        if(qIn){
            noStroke();
            fill(0, 0, 0, 30);
            arc(600, 300, 500, 500, -PI/2, (270-count)*PI/180);
        }
    }
    //info screen-----------------------------------
    if(screen>=3&&screen<4){
        background(255, 127, 0);
        rosePen(350, 300, 270, 20, 255, -triM);
        rosePen(850, 300, 270, 20, 255, triM+36);
        triM++;
        if(triM>360){
        triM-=360;
        }
        textSize(29.4);
        fill(0, 80+count, 0);
        text("The language feature I am presenting is より, along with の ほうが, used to compare two things. The basic usage of this is just X は Y より followed with the adjective. For example 二は一より大きいです is just saying two is larger than one. Note that the second thing is compared too the first thing, so in the example when comparing two to one, it is larger. Also, by using より, the focus of the sentence is going to be on A. This stands true even if the structure is swapped, such as Y より X は adjective. Want to make the opposite the focus? If we are using ほど instead, the translation has the opposite effect of より, but the focus is still on the subject. What if we don't want to focus on either and are just doing a comparison? Using の ほうが instead of the は along with the より, or even dropping the より, means to compare between X and Y, such as X の ほうが Y より adjective, or just X の ほうが Y adjective. E.g: 二*六の ほうが四*三 等しいです means 2*6 is equal to 4*3. A secondary use of の ほうが has the effect of softening the sentence, and making it feel more natural to say instead of coming off as crute and impolite.", 50, 50, 1100, 500);
        fill(255);
        noStroke();
        triangle(1200, 500, 1200, 600, 1100, 600);
        fill(0);
        textSize(20);
        rotate(-PI/4);
        text("BACK", 422, 1230);
        rotate(PI/4);
        if(mousePressed&&!mC&&mouseY>-mouseX+1600){
            screen=3.1;
            mc=true;
            count=0;
        }
        if(screen==3.1){
            fill(255, 0, 0, count);
            count+=3;
            if(count>250){
                screen=1;
                count=0;
            }
            rect(0, 0, 1200, 600);
        }else{
            if(inC){
                count--;
            }else{
                count++;
            }
            if(count>=100){
                inC=true;
            }
            if(count<=0){
                inC=false;
            }
        }
    }
    //final screen-----------------------------------
    if(screen>=4&&screen<5){
        background(0);
        textSize(60);
        int qNS=0;
        for(var i=0;i<5;i++){
            if(!qCa[i]){
                qNS++;
            }
        }
        if(qNS==0){
            fill(255, 0, 0);
            text("Oh dear. No one escaped.", 600, 100);
        }else if(qNS==5){
            fill(0, 255, 0);
            text("Well done! Everyone escaped.", 600, 100);
        }else{
            fill(255, 255, 0);
            text(qNS+" of your players escaped.", 600, 100);
        }
        text("Total selections attempted: "+ts, 600, 300);
        text("Number of correct selections: "+cs, 600, 500);
        CRASH
    }
    //looped always-----------------------------------
    if(!mousePressed){
        mC=false;
    }
    //debug-----------------------------------
    textSize(20);
    fill(0);
    text(mouseX+" "+mouseY+" "+qFC+"   "+p, 200, 200);
    if(mousePressed&&mouseX<10&&mouseY<10){
        CRASH
    }
}

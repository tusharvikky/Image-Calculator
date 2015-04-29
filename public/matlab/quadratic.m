clc
clear all
imagen = imread('quadratic.png');
if length(size(imagen))==3 %RGB image
    imagen=rgb2gray(imagen);
    imagen=roicolor(imagen,0,100); 
    imagen =clip(imagen);
    img_rr = imagen;
end
img_rr = imagen;
imagen = medfilt2(imagen);
% imshow(imagen);
ocrResults = ocr(img_rr,'Language','English');%,'English');
	letter = ocrResults.Text;
    disp(letter);
    size_in = size(letter);
    for i = 1:size_in(2)
        if i == 1
            if letter(i) == '0'
                v_1 = 0;
            elseif letter(i) == '1'
                v_1 = 1;
            elseif letter(i) == '2'
                v_1 = 2;
            elseif letter(i) == '3'
                v_1 = 3;
            elseif letter(i) == '4'
                v_1 = 4;
            elseif letter(i) == '5'
                v_1 = 5;
            elseif letter(i) == '6'
                v_1 = 6;
            elseif letter(i) == '7'
                v_1 = 7;
            elseif letter(i) == '8'
                v_1 = 8;
            elseif letter(i) == '9'
                v_1 = 9;
            end
        
        elseif i == 5
            if letter(i) == '0'
                v_2 = 0;
            elseif letter(i) == '1'
                v_2 = 1;
            elseif letter(i) == '2'
                v_2 = 2;
            elseif letter(i) == '3'
                v_2 = 3;
            elseif letter(i) == '4'
                v_2 = 4;
            elseif letter(i) == '5'
                v_2 = 5;
            elseif letter(i) == '6'
                v_2 = 6;
            elseif letter(i) == '7'
                v_2 = 7;
            elseif letter(i) == '8'
                v_2 = 8;
            elseif letter(i) == '9'
                v_2 = 9;
            end
            v_2 = num2str(v_2);
            elseif i == 6
            if letter(i) == '0'
                v_2 = strcat(v_2,'0');
            elseif letter(i) == '1'
                v_2 = strcat(v_2,'1');
            elseif letter(i) == '2'
                v_2 = strcat(v_2,'2');
            elseif letter(i) == '3'
                v_2 = strcat(v_2,'3');
            elseif letter(i) == '4'
                v_2 = strcat(v_2,'4');
            elseif letter(i) == '5'
                v_2 = strcat(v_2,'5');
            elseif letter(i) == '6'
                v_2 = strcat(v_2,'6');
            elseif letter(i) == '7'
                v_2 = strcat(v_2,'7');
            elseif letter(i) == '8'
                v_2 = strcat(v_2,'8');
            elseif letter(i) == '9'
                v_2 = strcat(v_2,'9');
            end
            v_2 = str2num(v_2);
            
        elseif i == 9
            if letter(i) == '0'
                v_3 = 0;
            elseif letter(i) == '1'
                v_3 = 1;
            elseif letter(i) == '2'
                v_3 = 2;
            elseif letter(i) == '3'
                v_3 = 3;
            elseif letter(i) == '4'
                v_3 = 4;
            elseif letter(i) == '5'
                v_3 = 5;
            elseif letter(i) == '6'
                v_3 = 6;
            elseif letter(i) == '7'
                v_3 = 7;
            elseif letter(i) == '8'
                v_3 = 8;
            elseif letter(i) == '9'
                v_3 = 9;
            end
            v_3 = num2str(v_3);
            elseif i == 10
            if letter(i) == '0'
                v_3 = strcat(v_3,'0');
            elseif letter(i) == '1'
                v_3 = strcat(v_3,'1');
            elseif letter(i) == '2'
                v_3 = strcat(v_3,'2');
            elseif letter(i) == '3'
                v_3 = strcat(v_3,'3');
            elseif letter(i) == '4'
                v_3 = strcat(v_3,'4');
            elseif letter(i) == '5'
                v_3 = strcat(v_3,'5');
            elseif letter(i) == '6'
                v_3 = strcat(v_3,'6');
            elseif letter(i) == '7'
                v_3 = strcat(v_3,'7');
            elseif letter(i) == '8'
                v_3 = strcat(v_3,'8');
            elseif letter(i) == '9'
                v_3 = strcat(v_3,'9');
            end
            v_3 = str2num(v_3);
            
        end
    end
    
    p = [v_1 v_2 v_3];
    v_r = roots(p);
    

    disp(v_r)
    v_r = num2str(v_r);
    word=[];%Storage matrix word from image
    fid = fopen('quadratic.txt', 'wt');%Opens text.txt as file for write
    [r c]=size(v_r);
    
    question = letter; %Store recognized eq to question variable
    fq = fopen('quadeq.txt', 'wt');
    % word = [word question];
    % word = [word '_'];
    fprintf(fq, question);
    fclose(fq);

    for i=1:r
    for j=1:c
        
        s = v_r(i,j);
        letter = s;
   
        word = [word letter]; 
    end
        word = [word '/'];
    end

    fprintf(fid,word);%Write 'word' in text file (upper)
    fclose(fid);
    